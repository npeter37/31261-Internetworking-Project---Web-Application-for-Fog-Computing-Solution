<%-- 
    Document   : Login
    Created on : 28/08/2017, 8:25:31 PM
    Author     : Peter Nguyen
--%>
<%@page import ="user.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sftp.JschSftpConnect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="css/MainFormat.css" />
        <jsp:useBean id="sftpConnection" class="sftp.JschSftpConnect" scope="session"></jsp:useBean>
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <div id="content">
            <jsp:useBean id="logIn" class="user.UsersApp" scope="session">
                <jsp:setProperty name="logIn" property="filePath" value="<%=application.getRealPath("WEB-INF/users.xml")%>"/>
            </jsp:useBean>
            <% if (request.getParameter("log") != null) {
                    int loginAttempt = Users.getAttempt();
                    Users users = logIn.getUsers();
                    User user = users.loginAttempt(request.getParameter("email"), request.getParameter("password"));
                    //replace "loginAttempt" with "loginhashed" so it will check if the password matches with the hash for newly registered accounts. It will not work for the current hard coded data in the users.xml file.

                    if (user != null) {
                        //session.setAttribute("user", user);
                        //response.sendRedirect("Home.jsp");
                        String answer = user.getSecretanswer();
                        if (request.getParameter("secretanswer").equals(answer)) {
                            session.setAttribute("user", user);
                            %>
                            
                            <jsp:setProperty name="sftpConnection" property="user" value="<%=user%>"/>
                            <jsp:setProperty name="sftpConnection" property="workingDirectory" value="<%=user.getEmail()%>"/>
                            
                            <%
                            response.sendRedirect("Home.jsp");
                        } else {
                            response.sendRedirect("Login.jsp");
                        }
                    }
            %>    
            <p>Login failed. You have <%=loginAttempt%> login attempts left.</p>
            <%
                if (loginAttempt <= 0) {
                    response.sendRedirect("loginblock.jsp");
                }
            %>
            <% }
            %>



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
                        <td><label class="field" for="secretanswer">Secret Question: What is your secret?</label></td>
                        <td><input class="inputWidth" type="text" name="secretanswer" required></td>
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
