<%-- 
    Document   : Upload
    Created on : 13/09/2017, 12:18:14 AM
    Author     : Peter Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sftp.JschSftpConnect"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Files</title>
        <link rel="stylesheet" href="css/MainFormat.css" />
        <%
            String s = "";
            if (session.getAttribute("user") == null) {
                response.sendRedirect("Home.jsp");
            } else { 
                JschSftpConnect connection = new JschSftpConnect("127.0.0.1", "tester", "password");
                // when sftp server allows, change to directory, username and password of the current user
                s = connection.listDirectory();
                connection.closeConnection();
            }
        %>
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <div>
            <h2>View Files</h2>
            
            <p><%=s%></p> <!-- print file list -->
            
            <form action="MakeDirectory.jsp" method="post">
                <input class="inputWidth" type="text" name="folderName">
                <input type="submit" value="New Folder">
            </form>
            
            <h2>Upload File</h2>
            <p>Select a File to upload</p>
            <form action="UploadFile.jsp" method="post" enctype="multipart/form-data">
                <input type="file" name="fileName" size="50">
                <input type="submit" value="Upload File">
            </form>
        </div>
    </body>
</html>
