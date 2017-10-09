<%-- 
    Document   : Upload
    Created on : 13/09/2017, 12:18:14 AM
    Author     : Peter Nguyen
--%>

<%@page import="user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sftp.JschSftpConnect"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Files</title>
        <link rel="stylesheet" href="css/MainFormat.css" />
            
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <div id="content">
            <!-- print file list -->
            <jsp:getProperty name="sftpConnection" property="workingDirectory"/>
            <form action="MakeDirectory.jsp" method="post">
                <input class="inputWidth" type="text" name="folderName">
                <input type="submit" value="New Folder">
            </form>
            <jsp:getProperty name="sftpConnection" property="directories"/>
            <jsp:getProperty name="sftpConnection" property="files"/>
            
            
            <h2>Upload File</h2>
            <p>Select a File to upload</p>
            <form action="UploadFile.jsp" method="post" enctype="multipart/form-data">
                <input type="file" name="fileName" size="50">
                <input type="submit" value="Upload File">
            </form>
        </div>
    </body>
</html>
