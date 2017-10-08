<%-- 
    Document   : Admin
    Created on : 08/09/2017, 7:54:29 PM
    Author     : Peter Nguyen
--%>

<%@page import="user.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator</title>
        <link rel="stylesheet" href="css/MainFormat.css" />
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <div id="content">
            <h2>Administrator</h2>
            <p>Only administrators are granted access to this page and the administrative functions. Click on the following links to perform the following functions.</p>
            <p class="pCenter"><a href="AdminAddUser.jsp">Add New User</a></p>
            <p class="pCenter"><a href="AdminRemoveUser.jsp">Remove User</a></p>
            <p class="pCenter"><a href="AdminViewUser.jsp">View User</a></p>
        </div>
    </body>
</html>