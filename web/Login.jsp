<%-- 
    Document   : Login
    Created on : 28/08/2017, 8:25:31 PM
    Author     : Peter Nguyen
--%>
<%@page import ="user.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="css/MainFormat.css" />
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <div>
            <jsp:useBean id="logIn" class="user.UsersApp" scope="session">
                <jsp:setProperty name="logIn" property="filePath" value="<%=application.getRealPath("WEB-INF/users.xml")%>"/>
            </jsp:useBean>
            <% if (request.getParameter("log") != null) {
                    Users users = logIn.getUsers();
                    User user = users.login(request.getParameter("email"), request.getParameter("password"));

                    if (user != null) {
                        session.setAttribute("user", user);
                        response.sendRedirect("Home.jsp");
                    } else if (user == null) { %>
                    <p>Login failed.</p>
                   <% }
            } %>

            <h2>Login</h2>
            <form action="Login.jsp" method="post">
                <table class="tableRegister">
                    <tr>
                        <td><label class="field" for="email">Email</label></td>
                        <td><input class="inputWidth" type="email" name="email" required></td>
                    </tr>
                    <tr>
                        <td><label class="field" for="password">Password</label></td>
                        <td><input class="inputWidth" type="password" name="password" required></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Login"></td>
                    <input type="hidden" name="log" value="yes">
                    </tr>
                </table>
            </form>

        </div>

    </body>
</html>
