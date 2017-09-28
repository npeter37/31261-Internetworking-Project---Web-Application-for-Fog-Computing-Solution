<%-- 
    Document   : Register
    Created on : 28/08/2017, 8:25:02 PM
    Author     : Peter Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="css/MainFormat.css" />
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <div>
            <h2>Register</h2>
            <%
                String answer = request.getParameter("answer");
            %>
            <% if (answer.equals("31261")) { %>
            <form action="RegisterAction.jsp" method="post">
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
                        <td><label class="field" for="mac">MAC Address of Device</label></td>
                        <td><input class="inputWidth" type="text" minlength="6" maxlength="24" name="mac" required></td>
                    </tr>
                    <tr>
                        <td><label class="field" for="secretanswer">The following answer will your secret answer. What is your secret?</label></td>
                        <td><input class="inputWidth" type="text" name="secretanswer" required></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Register"></td>
                    </tr>
                </table>
            </form>
            <% } else { %>
            <p>Secret answer is incorrect. Please try again.</p>
            <% }
            %>
        </div>

    </body>
</html>
