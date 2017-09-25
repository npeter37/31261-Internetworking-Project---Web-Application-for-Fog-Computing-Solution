<%-- 
    Document   : Upload
    Created on : 13/09/2017, 12:18:14 AM
    Author     : Peter Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Files</title>
        <link rel="stylesheet" href="css/MainFormat.css" />
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
            
            <p>file list goes here</p>
            
            <form>
                <input type="submit" value="Upload File">
            </form>
        </div>
    </body>
</html>
