<%-- 
    Document   : logout
    Created on : Sep 9, 2016, 4:43:36 PM
    Author     : bearu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cupcake Shop - logging out</title>
    </head>
    <!-- Logud styring - Sender brugeren tilbage til login skærmen -->
    <body>
        <h1>You've been logged out!</h1>
        <% session.setAttribute("user_id", null);
            session.invalidate();
            response.sendRedirect("login.jsp");
        %>
    </body>
</html>
