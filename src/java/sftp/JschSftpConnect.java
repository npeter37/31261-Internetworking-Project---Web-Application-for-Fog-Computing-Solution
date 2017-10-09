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

public class JschSftpConnect implements Serializable {
    
    private Session session;
    private ChannelSftp channel;
    private User user;
    private String workingDirectory = ".";
    
    
    public JschSftpConnect () {
        
    }
    
    //public JschSftpConnect (User user) {
    //    this.user = user;
    //    workingDirectory = "./" + user.getEmail();
    //    openConnection();
    //}
    
    public void setUser(User user) {
        this.user = user;
    }
    
    public void openConnection() {
        String host = "127.0.0.1";
        String username = "tester";
        String password = "password";
        
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
        if (channel != null)
            channel.disconnect();
        if (session != null)
            session.disconnect();
    }
    
    public void setWorkingDirectory(String workingDirectory) {
        if (workingDirectory.equals(".")) {
            this.workingDirectory = "./" + user.getEmail();
        } else if (workingDirectory.equals("..")) {
            int endIndex = this.workingDirectory.lastIndexOf("/");
            if (endIndex != -1) {
                this.workingDirectory = this.workingDirectory.substring(0,endIndex);
            } else {
                this.workingDirectory = "./" + user.getEmail();
            }
        } else { 
            this.workingDirectory += "/" + workingDirectory;
        }
        if (!this.workingDirectory.contains("./" + user.getEmail()))
            this.workingDirectory = "./" + user.getEmail();
    }
    
    public void newUserDirectory(String name) {
        openConnection();
        try {
            channel.mkdir("./" + name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        closeConnection();
    }
    
    public void makeDirectory(String name) {
        openConnection();
        try {
            channel.mkdir(workingDirectory + "/" + name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        closeConnection();
    }
    
    public void deleteFile(String fileName) {
        openConnection();
        try {
            channel.rm(workingDirectory + "/" + fileName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        closeConnection();
    }
    
    public void deleteDirectory(String directoryName) {
        openConnection();
        try {
            final Vector<LsEntry> entries = channel.ls(workingDirectory + "/" + directoryName);
            for (LsEntry entry : entries) {
                if (!entry.getAttrs().isDir()) {
                    channel.rm(workingDirectory + "/" + directoryName + "/" + entry.getFilename());
                } else if (!entry.getFilename().equals(".") && !entry.getFilename().equals("..")) {
                    try {
                        channel.rmdir(workingDirectory + "/" + directoryName + "/" + entry.getFilename());
                    } catch (Exception e) {
                        deleteDirectory(directoryName + "/" + entry.getFilename());
                    }
                }
            }
            channel.rmdir(workingDirectory + "/" + directoryName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        closeConnection();
    }
    
    public String getWorkingDirectory() {
        String s = "";
        s += "<h2>" + workingDirectory + "</h2>";
        s = s.replaceFirst("./" + user.getEmail(), "Home_Directory");
        return s;
    }
    
    public String getDirectories() {
        openConnection();
        String directories = "<div id=\"directories\">";
        System.out.println(workingDirectory);
        try {
            final Vector<LsEntry> entries = channel.ls(workingDirectory);
            directories += "<div id=\"directory-options\">";
            directories += "<form action=\"ChangeDirectory.jsp\" method=\"post\">";
            directories += "<input type=\"hidden\" name=\"workingDirectory\" value=\".\">";
            directories += "<input type=\"submit\" value=\"Home Directory\">";
            directories += "</form>";
            directories += "<form action=\"ChangeDirectory.jsp\" method=\"post\">";
            directories += "<input type=\"hidden\" name=\"workingDirectory\" value=\"..\">";
            directories += "<input type=\"submit\" value=\"Parent Directory\">";
            directories += "</form>";
            directories += "<form action=\"MakeDirectory.jsp\" method=\"post\">";
            directories += "<input class=\"inputWidth\" type=\"text\" name=\"folderName\" placeholder=\"Folder Name...\">";
            directories += "<input type=\"submit\" value=\"New Folder\">";
            directories += "</form>";
            directories += "</div>";
            directories += "<ul>";
            for (LsEntry entry : entries) {
                if (entry.getAttrs().isDir() && (!entry.getFilename().equals(".") && !entry.getFilename().equals(".."))) {
                    directories += "<li>";
                    directories += "<form class=\"directory-button\" action=\"ChangeDirectory.jsp\" method=\"post\">";
                    directories += "<input type=\"hidden\" name=\"workingDirectory\" value=\"" + entry.getFilename() + "\">";
                    directories += "<input type=\"submit\" value=\"" + entry.getFilename() + "\">";
                    directories += "</form>";
                    directories += "<form class=\"directory-delete\" action=\"DeleteDirectory.jsp\" method=\"post\">";
                    directories += "<input type=\"hidden\" name=\"directoryName\" value=\"" + entry.getFilename() + "\">";
                    directories += "<input type=\"submit\" value=\"Delete\">";
                    directories += "</form>";
                    directories += "</li>";
                }
            }
            directories += "</ul>";
        } catch (Exception e) {
            directories = "<p>Failed to read from directory" + workingDirectory + "</p>";
        }
        directories += "</div>";
        closeConnection();
        return directories;
    }
    
    public String getFiles() {
        openConnection();
        String files = "<div id=\"files\">";
        try {
            final Vector<LsEntry> entries = channel.ls(workingDirectory);
            files += "<h4>Files in: " + workingDirectory + "</h4>";
            files = files.replaceFirst("./" + user.getEmail(), "Home_Directory");
            files += "<table>";
            for (LsEntry entry : entries) {
                if (!entry.getAttrs().isDir()) {
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
            files += "</table>";
            files += "</div>";
        } catch (Exception e) {
            files = "<p>Failed to read from directory</p>";
        }
        closeConnection();
        return files;
    }
    
    public void upload(FileItem fi, String fileName) {
        openConnection();
        try { 
            channel.cd(workingDirectory);
            InputStream inputStream = fi.getInputStream();
            channel.put(inputStream, fileName);
            inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        } 
        closeConnection();
    }
    
    //http://www.javaxp.com/2015/06/jsch-uploaddownload-files-from-remote.html
    public void download(String fileName, OutputStream os) {
        openConnection();
        byte[] buffer = new byte[1024];
        try {
            channel.cd(workingDirectory);
            BufferedInputStream bis = new BufferedInputStream(channel.get(fileName));
            BufferedOutputStream bos = new BufferedOutputStream(os);
            int readCount;
            while ((readCount = bis.read(buffer)) > 0) {
                bos.write(buffer, 0, readCount);
            }
            bis.close();
            bos.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
        closeConnection();
    }
}
