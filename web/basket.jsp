<%@page import="entity.Cupcake, entity.Layer"%>
<%@page import="java.util.List, java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Cupcake Shop - Basket</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <link href="script/basket.css" rel="stylesheet" type="text/css"/>
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
                    <li class="active"><a href="theshop.jsp">Home</a></li>
                    <li><a href="#">Invoices</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> Logged in as: <% out.print(session.getAttribute("username")); %> | Balance: <% out.print(session.getAttribute("balance")); %> </a></li>
                    <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li></form>
                </ul>
            </div>
        </nav>
        <!--End of Navigation bar-->
        <div class="basket">
            <div class="basketContent">
                <h1 style="color: white" align="center">Basket</h1>
                <table class="table table-hover">
                    <thead>
                        <tr class="active">
                            <th>ID</th>
                            <th>Name</th>
                            <th>Topping</th>
                            <th>Bottom</th>
                            <th>Amount</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < basket.size(); i++) {
                                Cupcake cake = basket.get(i);
                                out.println("<tr class=" + "" + "success" + ">");
                                out.println("<td>" + cake.getIdCupcake() + "</td>");
                                out.println("<td>" + cake.getCupCakename() + "</td>");
                                out.println("<td>" + toppingList.get(cake.getIdTopping()).getCupcakeLayerPiece() + "</td>");
                                out.println("<td>" + bottomsList.get(cake.getIdBottom()).getCupcakeLayerPiece() + "</td>");
                                out.println("<td>" + cake.getQty() + "</td>");
                                out.println("<td>" + ((toppingList.get(cake.getIdTopping()).getPrice() + bottomsList.get(cake.getIdBottom()).getPrice()) * cake.getQty()) + "</td>");
                                out.println("</tr>");
                            }%>
                    </tbody>
                </table>
                    <h4 style="color: white" align="center">Grand Total: <% out.print(session.getAttribute("grandTotal")); %> </h4>
                <div>
                    <form action="Front" method="POST">
                        <div class="col-xs-6" style="padding-top: 0px">
                            <input type="hidden" name="origin" value="checkout" />
                            <input style="max-width: 130px; margin: auto" class="btn btn-success btn-block" type="submit" value="Checkout" name="checkout" />
                        </div>
                    </form>
                    <form action="Front" method="POST">
                        <div class="col-xs-6" style="padding-top: 0px">
                            <input type="hidden" name="origin" value="empty" />
                            <input style="max-width: 130px; margin: auto" class="btn btn-danger btn-block" type="submit" value="Empty basket" name="empty" />
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
