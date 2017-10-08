<%-- 
    Document   : AdminRemoveUser
    Created on : 14/09/2017, 10:46:55 PM
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
        <title>Remove a User</title>
        <link rel="stylesheet" href="css/MainFormat.css" />
    </head>
    <body>
        <jsp:useBean id="userApp" class="user.UsersApp" scope="session">
            <jsp:setProperty name="userApp" property="filePath" value="<%=application.getRealPath("WEB-INF/users.xml")%>"/>
        </jsp:useBean>
        <jsp:include page="Menu.jsp" />
        <div id="content">
            <h2>Remove a User</h2>
            <%
                if (request.getParameter("removeUser") != null) {
                    String reqEmail = request.getParameter("removeUser");
                    Users deleteUser = userApp.getUsers();
                    User cancelUser = deleteUser.getUser(reqEmail);
                    if (cancelUser != null) {
                        deleteUser.removeUser(cancelUser);
                        userApp.updateXML(deleteUser);
                        response.sendRedirect("AdminRemoveUser.jsp");
                    } else { %>
            <p>User's email is inputted incorrectly. Please try again.</p>
            <%
                    }               
                }
            %>

            <c:import url="WEB-INF/viewUsers.xsl" var="xslt"/>
            <c:import url="WEB-INF/users.xml"
                      var="inputDoc" />
            <x:transform xml="${inputDoc}" xslt="${xslt}"/>
            <br>
            <form action="AdminRemoveUser.jsp" method="post">
                <table>
                    <tr><td>What is the email of the user you wish to remove? </td><td><input class="inputWidth" type="text" name="removeUser" required></td></tr>
                    <tr><td></td><td><input type="submit" value="Confirm">  
                            <input type="hidden" name="removeUser" value="yes"></td></tr>
                </table>
            </form>
        </div>
    </body>
</html>