<%-- 
    Document   : MainLayout
    Created on : 28/08/2017, 8:48:28 PM
    Author     : Peter Nguyen
--%>

<%@page import="user.*" contentType="text/html" pageEncoding="UTF-8"%>

<h1>Improving the Cloud Through Fog Computing</h1>
<% if (session.getAttribute("user") == null) { %>
<ul>
    <li><a href="Home.jsp">Home</a></li>
    <li class="right"><a href="Login.jsp">Login</a></li>
    <li class="right"><a href="verifyRegister.jsp">Register</a></li>
</ul>
<% } else {
    User user = (User) session.getAttribute("user");
%>
<ul>
    <li><a href="Home.jsp">Home</a></li>
    <li><a href="ViewFiles.jsp">View Files</a></li>
    <li class="right"><a href="Logout.jsp">Logout</a></li>
    <li class="right1"><a href="editAccount.jsp">Logged in as <%= user.getName()%></a></li>

    <%
        if (user.getPrivilege().equals("admin")) {
    %>
    <li class="right"><a href="Admin.jsp">Admin</a></li>  
        <% } %>
</ul>
<% }%>