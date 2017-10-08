<%-- 
    Document   : DownloadFile
    Created on : 27/09/2017, 3:35:21 PM
    Author     : James
--%>

<%@page import="sftp.JschSftpConnect"%>
<%@page import="user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Download File</title>
        <link rel="stylesheet" href="css/MainFormat.css" />
        <%
            String fileName = (String)request.getParameter("fileName");
            User user = (User) session.getAttribute("user");
            JschSftpConnect connection = new JschSftpConnect("127.0.0.1", "tester", "password", user);
            connection.download(fileName);
            connection.closeConnection();
            response.sendRedirect("ViewFiles.jsp");
        %>
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <p>Downloading File</p>
    </body>
</html>
