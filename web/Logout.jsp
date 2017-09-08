<%-- 
    Document   : Logout
    Created on : 08/09/2017, 1:35:42 PM
    Author     : Peter Nguyen
--%>
<%@page import ="user.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logging out</title>
        <link rel="stylesheet" href="css/MainFormat.css" />
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("Home.jsp");
        %>
    </body>
</html>
