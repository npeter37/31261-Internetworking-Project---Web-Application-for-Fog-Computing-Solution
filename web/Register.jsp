<%-- 
    Document   : Register
    Created on : 28/08/2017, 8:25:02 PM
    Author     : Peter Nguyen
--%>

<%@page import="java.net.NetworkInterface"%>
<%@page import="java.net.InetAddress"%>
<%@page import="user.*"%>
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
        <div id="content">
            <h2>Register</h2>
            <%
                String answer = request.getParameter("answer");
            %>
            <%
                //Find MAC address
                String address =null;
                InetAddress ip;
                ip = InetAddress.getLocalHost();
                NetworkInterface network = NetworkInterface.getByInetAddress(ip);
                byte[] mac = network.getHardwareAddress();
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < mac.length; i++) {
                    sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
                }
                address = sb.toString(); 
            %>
            <% if (answer.equals("31261")) {%>
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
                        <td><input class="inputWidth" type="text" value="<%=address%>" name="mac" readonly></td>
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
