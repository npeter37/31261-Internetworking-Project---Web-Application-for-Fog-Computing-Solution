<%-- 
    Document   : RegisterAction
    Created on : 01/09/2017, 5:03:04 PM
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
            <jsp:useBean id="registerApp" class="user.UsersApp" scope="session">
                <jsp:setProperty name="registerApp" property="filePath" value="<%=application.getRealPath("WEB-INF/users.xml")%>"/>
            </jsp:useBean>

            <%
                if (verify == "31261") {
                    Users users = registerApp.getUsers();
                    if (users.getUser(email) == null) {
                        User user = new User(name, email, password, mac);
                        session.setAttribute("user", user);
                        users.addUser(user);
                        //String old_password = user.getPassword();
                        //user.setPassword(old_password);
                        registerApp.updateXML(users);
                        response.sendRedirect("Home.jsp");
                    } else { %>
            <p>Sorry. That email has already been registered.</p>
            <% }%>
            <% } else { %>
            <p>Secret answer is incorrect. Please try again.</p>
            <% }%>
        </div>
    </body>
</html>
