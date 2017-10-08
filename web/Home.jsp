<%-- 
    Document   : Home
    Created on : 25/08/2017, 9:04:19 PM
    Author     : Peter Nguyen
    test
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="css/MainFormat.css" />
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <div id="content">
            <h2>Home</h2>
            <%--Add an if statement that if user is logged in, that it will show a different message --%>
            <p>This is a private cloud where you can freely upload files and folders. In this cloud, we aim to provide a highly secured platform in which we can guarantee that your files will be safe and properly secured.</p>
            <p>If you have not registered, you will be required to register before entering the cloud. You can do by clicking on the Register tab in the menu above.</p>
            <p>Otherwise, click on the Login tab to access your cloud!</p>
        </div>
    </body>
</html>
