<%-- 
    Document   : login
    Created on : 09-09-2016, 13:25:08
    Author     : Ceo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login</h1>
        <form action="Front" method="POST">
            <input type="text" name="username" value="" placeholder="Username" />
            <input type="password" name="password" value="" placeholder="Password" />
            <input type="hidden" name="origin" value="login" />
            <input type="submit" value="login" name="Login" />
        </form>
    </body>
</html>
