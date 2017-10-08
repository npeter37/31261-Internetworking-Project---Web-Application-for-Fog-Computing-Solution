<%-- 
    Document   : AdminViewUser
    Created on : 15/09/2017, 10:09:34 PM
    Author     : Peter Nguyen
--%>

<%@page import="java.util.stream.Collectors"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@page import="user.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Users on the Cloud</title>
        <link rel="stylesheet" href="css/MainFormat.css" />
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <div id="content">
            <h2>View Users on the Cloud</h2>
            <c:import url="WEB-INF/viewUsers.xsl" var="xslt"/>
            <c:import url="WEB-INF/users.xml"
                      var="inputDoc" />
            <x:transform xml="${inputDoc}" xslt="${xslt}"/>
            <br>
        </div>
    </body>
</html>
