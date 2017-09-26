<%-- 
    Document   : verifyRegister
    Created on : 26/09/2017, 5:58:17 PM
    Author     : Peter Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify before Registering</title>
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <div>
            <h2>Verify</h2>
            <form action="Register.jsp" method="post">
                <p>Please answer the secret question before proceeding to register.</p>
                <table class="tableRegister">
                    <tr>
                        <td><label class="field" for="answer">What is the subject number of this subject?</label></td>
                        <td><input class="inputWidth" type="text" name="answer" required></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Confirm"></td>
                    </tr>
                </table>
            </form>
        </div>

    </body>
</html>