<%-- 
    Document   : AdminAddUser
    Created on : 14/09/2017, 9:58:08 PM
    Author     : Peter Nguyen
--%>
<%@page import="javax.xml.bind.Marshaller"%>
<%@page import="javax.xml.bind.JAXBContext"%>
<%@page import="user.UsersApp"%>
<%@page import="user.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Add UserPage</title>
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <jsp:useBean id="registerApp" class="user.UsersApp" scope="session">
            <jsp:setProperty name="registerApp" property="filePath" value="<%=application.getRealPath("WEB-INF/users.xml")%>"/>
        </jsp:useBean>

        <%
            if (request.getParameter("Add") != null) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String mac = request.getParameter("mac");
                Users users = registerApp.getUsers();
                if (users.getUser(email) == null) {
                    User user = new User(name, email, password, mac);
                    //session.setAttribute("user", user);
                    users.addUser(user);
                    registerApp.updateXML(users);
                    response.sendRedirect("AdminViewUser.jsp");
                } else { %>
        <p>Sorry. The email of the user has already been registered.</p>
        <% }%>
        <% } else { %>
        <% }%>
        <div>
            <h2>Add User to the Cloud</h2>
            <form action="AdminAddUser.jsp" method="post">
                <table class="tableRegister">
                    <tr>
                        <td><label class="field" for="name">Full name</label></td>
                        <td><input class="inputWidth" type="text" name="name" required></td>
                    </tr>
                    <tr>
                        <td><label class="field" for="email">Email</label></td>
                        <td><input class="inputWidth" type="email" name="email" required></td>
                    </tr>
                    <tr>
                        <td><label class="field" for="password">Password</label></td>
                        <td><input class="inputWidth" type="password" minlength="10" name="password" required></td>
                    </tr>
                    <tr>
                        <td><label class="field" for="mac">MAC Address of User's Device</label></td>
                        <td><input class="inputWidth" type="text" minlength="6" maxlength="24" name="mac" required></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Add"></td><input type="hidden" name="Add" value="yes">
                    </tr>
                </table>
            </form>
        </div>

    </body>
</html>
