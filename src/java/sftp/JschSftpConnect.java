/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 *
 * https://www.matt-reid.co.uk/blog_post.php?id=56
 */
package sftp;

import com.jcraft.jsch.*;
import com.jcraft.jsch.ChannelSftp.LsEntry;
import java.util.*;
import java.io.*;
import org.apache.commons.fileupload.FileItem;
import user.User;

/**
 *
 * @author James
 */

public class JschSftpConnect {
    
    private Session session;
    private ChannelSftp channel;
    private User user;
    private String workingDirectory;
    
    public JschSftpConnect (String host, String username, String password, User user) {
        this.user = user;
        
        JSch jsch = new JSch();
        
        // set properties
        Properties config = new Properties();
        config.put("StrictHostKeyChecking", "no");
        config.put("compression.s2c", "zlib,none");
        config.put("compression.c2s", "zlib,none");
        
        try {
            // create the session
            session = jsch.getSession(username, host, 22);
            session.setConfig(config);
            session.setPassword(password);
            session.connect();

            // open the channel
            channel = (ChannelSftp) session.openChannel("sftp");
            channel.connect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void closeConnection() {
        user = null;
        if (channel != null)
            channel.disconnect();
        if (session != null)
            session.disconnect();
    }
    
    public void makeDirectory(String name) {
        try {
            channel.mkdir("./" + name);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void deleteFile(String fileName) {
        try {
            channel.rm(fileName);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public String listDirectory() {
        String files = "<div id=\"files\"><table>";
        String directories = "<div id=\"directories\"><ul>";
        try {
            final Vector<LsEntry> entries = channel.ls(".");
            workingDirectory = channel.pwd();
            
            for (LsEntry entry : entries) {
                if (entry.getAttrs().isDir()) {
                    directories += "<li>" + entry.getFilename() + "</li>";
                } else {
                    files += "<tr>";
                    files += "<td>" + entry.getFilename() + "</td>";
                    files += "<td>";
                    files += "<form action=\"DownloadFile.jsp\" method=\"post\">";
                    files += "<input type=\"hidden\" name=\"fileName\" value=\"" + entry.getFilename() + "\">";
                    files += "<input type=\"submit\" value=\"Download\">";
                    files += "</form>";
                    files += "</td><td>";
                    files += "<form action=\"DeleteFile.jsp\" method=\"post\">";
                    files += "<input type=\"hidden\" name=\"fileName\" value=\"" + entry.getFilename() + "\">";
                    files += "<input type=\"submit\" value=\"Delete\">";
                    files += "</form>";
                    files += "</td>";
                    files += "</tr>";
                }
            }
            
            directories += "</ul></div>";
            files += "</table>";
            files += "</div>";
        } catch (Exception e) {
            files = "<p>Failed to read from directory</p>";
        }
        return "<h2>View Files in " + workingDirectory + "</h2>\n" + directories + files;
    }
    
    public void upload(FileItem fi, String fileName) {
        try { 
            channel.cd(".");
            InputStream inputStream = fi.getInputStream();
            channel.put(inputStream, fileName);
            inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        } 
    }
    
    //http://www.javaxp.com/2015/06/jsch-uploaddownload-files-from-remote.html
    public void download(String fileName) {
        byte[] buffer = new byte[1024];
        try {
            channel.cd(".");
            channel.get(fileName);
            BufferedInputStream bis = new BufferedInputStream(channel.get(fileName));
            File newFile = new File("C:/temp/" + fileName); //
            OutputStream os = new FileOutputStream(newFile); //
            BufferedOutputStream bos = new BufferedOutputStream(os);
            int readCount;
            while ((readCount = bis.read(buffer)) > 0) {
                bos.write(buffer, 0, readCount);
            }
            bis.close();
            bos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
