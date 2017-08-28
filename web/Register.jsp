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
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <div>
            <h2>Register</h2>
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
                    <td><input class="inputWidth" type="password" name="password" required></td>
                </tr>
                <tr>
                    <td><label class="field" for="mac">MAC Address of Device</label></td>
                    <td><input class="inputWidth" type="text" name="mac" required></td>
                </tr>
                <tr>
                    <td><label class="field" for="verify">What is the subject number of this subject?</label></td>
                    <td><input class="inputWidth" type="text" name="verify" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Register"></td>
                </tr>
            </table>
        </div>

    </body>
</html>
