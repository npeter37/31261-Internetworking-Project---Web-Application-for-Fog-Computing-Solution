<%-- 
    Document   : ChangeDirectory
    Created on : 09/10/2017, 1:54:06 AM
    Author     : James
--%>

<%@page import="sftp.JschSftpConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Directory</title>
        <%
            if (session.getAttribute("user") == null) {
                response.sendRedirect("Home.jsp");
            } else {
                String workingDirectory = request.getParameter("workingDirectory");
                JschSftpConnect connection = (JschSftpConnect) session.getAttribute("sftpConnection");
                // when sftp server allows, change to directory, username and password of the current user
                connection.setWorkingDirectory(workingDirectory);
                response.sendRedirect("ViewFiles.jsp");
            }
        %>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
