<%-- 
    Document   : DeleteDirectory
    Created on : 09/10/2017, 6:00:53 PM
    Author     : James
--%>

<%@page import="sftp.JschSftpConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Directory</title>
        
        <%
            if (session.getAttribute("user") == null) {
                response.sendRedirect("Home.jsp");
            } else {
                String directoryName = request.getParameter("directoryName");
                JschSftpConnect connection = (JschSftpConnect) session.getAttribute("sftpConnection");
                // when sftp server allows, change to directory, username and password of the current user
                connection.deleteDirectory(directoryName);
                response.sendRedirect("ViewFiles.jsp");
            }
        %>
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <p>Deleting Directory...</p>
    </body>
</html>
