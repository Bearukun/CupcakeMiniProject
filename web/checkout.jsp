<%-- 
    Document   : invoice
    Created on : 11-09-2016, 11:48:35
    Author     : RadeonXRay
--%>

<%@page import="entity.Layer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Cupcake"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>invoice</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <!--Adding our own css-->
        <link href="script/login.css" rel="stylesheet" type="text/css"/>
        <% ArrayList<Cupcake> basket = (ArrayList<Cupcake>) session.getAttribute("basket");
             ArrayList<Layer> toppingList = (ArrayList<Layer>) session.getAttribute("toppings");
             ArrayList<Layer> bottomsList = (ArrayList<Layer>) session.getAttribute("bottoms");%>
    </head>
    <body>
        <!--Start of Navigation bar-->
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">

                    <a class="navbar-brand" href="#">The Cupcake Shop</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#">Invoices</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> Logged in as: <% out.print(session.getAttribute("username")); %> | Balance: <% out.print(session.getAttribute("balance")); %> </a></li>
                    <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li></form>
                </ul>
            </div>
        </nav>
        <!--End of Navigation bar-->
        <div class="checkout">
            <div class="checkoutContent">
                <h1 align="center">Checkout Successfull!</h1>
                <h1 style="color: white" align="center">Checkout Successfull!</h1>
                <table class="table table-hover">
                    <thead>
                        <tr class="active">
                            
                            <th>Cupcake</th>
                            <th>Qty</th>                            
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%      for (int i = 0; i < basket.size(); i++) {
                                Cupcake cake = basket.get(i);
                                //out.println("<td>" + i + "</td>");
                                out.println("<td>" + cake.getCupCakename() + "</td>");
                                out.println("<td>" + cake.getQty() + "</td>");
                                out.println("<td>" + ((toppingList.get(cake.getIdTopping()).getPrice() + bottomsList.get(cake.getIdBottom()).getPrice()) * cake.getQty()) + "</td>");
                                out.println("</tr>");
                            }%>
                    </tbody>
                </table>
                            <h1 align="center">New Grand Total: <% out.println(session.getAttribute("grandTotal"));%></h2>
                

            </div>
        </div>
    </body>
</html>
