<%-- 
    Document   : Upload
    Created on : 13/09/2017, 12:18:14 AM
    Author     : Peter Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sftp.JschSftpConnect"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Files</title>
        <link rel="stylesheet" href="css/MainFormat.css" />
        <%
            JschSftpConnect connection = new JschSftpConnect("127.0.0.1", "tester", "password");
            // when sftp server allows, change to directory, username and password of the current user
            String s = connection.listDirectory();
            connection.closeConnection();
        %>
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <div>
            <h2>View Files</h2>
            <form>
                <table>
                    <tr>
                        <td><input class="inputWidth" type="text" name="searchString"></td>
                        <td><input type="submit" value="Search"><td>
                    </tr>
                </table>
            </form>
            
            <p><%=s%></p>
            
            <form>
                <input type="submit" value="Upload File">
            </form>
        </div>
    </body>
</html>
