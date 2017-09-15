<%-- 
    Document   : editAccount
    Created on : 13/09/2017, 12:19:05 AM
    Author     : Peter Nguyen
--%>

<%@page import = "user.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        <link rel="stylesheet" href="css/MainFormat.css" />
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <jsp:useBean id="getUser" class="user.UsersApp" scope="application">
            <jsp:setProperty name="getUser" property="filePath" value="<%=application.getRealPath("WEB-INF/users.xml")%>"/>
        </jsp:useBean>
        <div>
            <h2>Account Details</h2>
            <%
                User user = (User) session.getAttribute("user");
                //Users updateUser = getUser.getUsers();
                String name = user.getName();
                String email = user.getEmail();
                String password = user.getPassword();
                String mac = user.getMac();

                if (request.getParameter("edit") != null) {
                    session.setAttribute("user", user);
                    Users updateUser = getUser.getUsers();
                    user.setName(name);
                    user.setEmail(email);
                    user.setPassword(password);
                    user.setMac(mac);

                    getUser.updateXML(updateUser);
                    response.sendRedirect("results.jsp");
                }
            %>
            <form action="editAccount.jsp" method="post">
                <p>Here are your account details. Will you like to make changes to your account?</p>
                <table class="tableRegister">
                    <tr>
                        <td><label class="field" for="name">Full name</label></td>
                        <td><input class="inputWidth" value="<%=name%>" type="text" name="name" required></td>
                    </tr>
                    <tr>
                        <td><label class="field" for="email">Email</label></td>
                        <td><input class="inputWidth" value="<%=email%>" type="email" name="email" required></td>
                    </tr>
                    <tr>
                        <td><label class="field" for="password">Password</label></td>
                        <td><input class="inputWidth" value="<%=password%>" type="password" minlength="10" name="password" required></td>
                    </tr>
                    <tr>
                        <td><label class="field" for="mac">MAC Address of Device</label></td>
                        <td><input class="inputWidth" value="<%=mac%>" minlength="6" maxlength="24" type="text" name="mac" required></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Confirm Changes"></td>
                    <input type="hidden" name="edit" value="yes">
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
