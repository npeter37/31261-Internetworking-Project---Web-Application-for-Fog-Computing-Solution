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

/**
 *
 * @author James
 */

public class JschSftpConnect {
    
    Session session;
    ChannelSftp channel;
    
    public JschSftpConnect (String host, String username, String password) {
        JSch jsch = new JSch();
        
        //String host = "127.0.0.1";
        //String username = "tester";
        //String password = "password";
    
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
    
    public String listDirectory() throws Exception {
        String s = ""; 
        try {
            final Vector<LsEntry> files = channel.ls(".");
            for (LsEntry obj : files) {
                s += obj.toString() + "<br>\n";
            }
        } catch (Exception e) {
            s = "Failed to read from directory";
        }
        return s;
    }
}
