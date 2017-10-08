<%-- 
    Document   : MainLayout
    Created on : 28/08/2017, 8:48:28 PM
    Author     : Peter Nguyen
--%>

<%@page import="user.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("user");
%>
    <div id="header">
        <div id="heading">
            <h1>Improving the Cloud Through Fog Computing</h1>
            <% if (user != null) { %>
                <p>Welcome, <%= user.getName()%>!</p>
            <% } %>
        </div>
        <div id="menu">
            <% if (user == null) { %>
            <ul>
                <li><a href="Home.jsp">Home</a></li>
                <li class="right"><a href="Login.jsp">Login</a></li>
                <li class="right"><a href="verifyRegister.jsp">Register</a></li>
            </ul>
            <% } else {
            %>
            <ul>
                <li><a href="Home.jsp">Home</a></li>
                <li><a href="ViewFiles.jsp">View Files</a></li>
                <li class="right"><a href="Logout.jsp">Logout</a></li>
                <li class="right"><a href="editAccount.jsp">Account Settings</a></li>

                <%
                    if (user.getPrivilege().equals("admin")) {
                %>
                <li class="right"><a href="Admin.jsp">Admin</a></li>  
                    <% } %>
            </ul>
            <% }%>
        </div>
    </div>