<%@page import="entity.Cupcake"%>
<%@page import="java.util.List, java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Cupcake Shop - Basket</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div>
            <% ArrayList<Cupcake> basket = (ArrayList<Cupcake>) session.getAttribute("basket"); %>
            <ul>         
                <% for (int i = 0; i < basket.size(); i++) {
                        Cupcake cake = basket.get(i);
                        out.println("<li>" + cake.getIdCupcake() + " - " + cake.getCupCakename() + "</li>");
                    }%>

            </ul>
        </div>
    </body>
</html>
