<%-- 
    Document   : MakeDirectory
    Created on : 26/09/2017, 5:06:04 PM
    Author     : James
--%>

<%@page import="user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sftp.JschSftpConnect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete File</title>
        <link rel="stylesheet" href="css/MainFormat.css" />
        
        <%
            if (session.getAttribute("user") == null) {
                response.sendRedirect("Home.jsp");
            } else {
                User user = (User) session.getAttribute("user");
                String fileName = request.getParameter("fileName");
                JschSftpConnect connection = new JschSftpConnect(user);
                // when sftp server allows, change to directory, username and password of the current user
                connection.deleteFile(fileName);
                connection.closeConnection();
                response.sendRedirect("ViewFiles.jsp");
            }
        %>
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <p>Deleting File...</p>
    </body>
</html>
