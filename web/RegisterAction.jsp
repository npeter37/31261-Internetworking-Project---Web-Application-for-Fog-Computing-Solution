<%-- 
    Document   : RegisterAction
    Created on : 01/09/2017, 5:03:04 PM
    Author     : Peter Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registering...</title>
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <h2>Register</h2>
        <div>
            <%
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String mac = request.getParameter("mac");
                String verify = request.getParameter("verify");
            %>
        </div>
    </body>
</html>