<%@page import="entity.Cupcake"%>
<%@page import="java.util.List, java.util.ArrayList"%>
<%@page import="entity.Layer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Cupcake Shop - Main page</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <link href="script/theshopccs.css" rel="stylesheet" type="text/css"/>
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
        <% ArrayList<Layer> toppingList = (ArrayList<Layer>) session.getAttribute("toppings");
            ArrayList<Layer> bottomsList = (ArrayList<Layer>) session.getAttribute("bottoms");
            ArrayList<Cupcake> cupcakesList = (ArrayList<Cupcake>) session.getAttribute("cupcakes");
        %>
        <!--Beginning of createCupcake div-->
        <div class="createCupcake">
            <div class="createCupcakeContent">
                <h3 style="color: white" align="center">Create cupcake</h3>
                <form action="Front" method="POST">
                    <div class="col-xs-4">
                        <h5 style="color: white" align="center">1. Topping</h5>
                        <select class="form-control" name="selectedTopping" id="selectedTopping">
                            <%  for (int i = 0; i < toppingList.size(); i++) {
                                    String option = toppingList.get(i).getCupcakeLayerPiece() + " | " + toppingList.get(i).getPrice() + "$";
                            %>

                            <option value="<%= option%>"><%= option%></option>
                            <% }%>
                        </select>
                    </div>
                    <div class="col-xs-4">
                        <h5 style="color: white" align="center">2. Bottom</h5>
                        <select class="form-control" name="selectedBottom" id="selectedBottom">
                            <%  for (int i = 0; i < bottomsList.size(); i++) {
                                    String option = bottomsList.get(i).getCupcakeLayerPiece() + " | " + bottomsList.get(i).getPrice() + "$";
                            %>

                            <option value="<%= option%>"><%= option%></option>
                            <% }%>
                        </select>
                    </div>
                    <div class="col-xs-4">
                        <h5 style="color: white" align="center">3. Name</h5>
                        <input class="form-control" type="text" name="cupcakeName" placeholder="Enter a name here." />
                    </div>
                    <div class="col-xs-12" style="padding-top: 20px">
                        <input type="hidden" name="origin" value="addCupcake" />
                        <input style="max-width: 120px; margin: auto" class="btn btn-warning btn-block" type="submit" value="Add Cupcake" name="add cupcake" />
                    </div>
                </form>

            </div>
        </div>
        <!--End of createCupcake div-->
        <br>
        <!--Start of chooseCupcake div-->
        <div class="chooseCupcake">
            <div class="chooseCupcakeContent">
                <h3 style="color: white" align="center">Add cupcake(s) to the basket</h3>
                <form action="Front" method="POST">
                    <div class="col-xs-12" style="padding-top: 20px">
                        <select  class="form-control" name="selectedCupcake" id="selectedCupcake">
                            <%  for (int i = 0; i < cupcakesList.size(); i++) {
                                    String option = cupcakesList.get(i).getIdCupcake() + "# " + cupcakesList.get(i).getCupCakename() + " || Topping: " + toppingList.get(cupcakesList.get(i).getIdTopping()).getCupcakeLayerPiece() + " - Bottom: " + bottomsList.get(cupcakesList.get(i).getIdBottom()).getCupcakeLayerPiece() + " || Price: " + (toppingList.get(cupcakesList.get(i).getIdTopping()).getPrice() + bottomsList.get(cupcakesList.get(i).getIdBottom()).getPrice() + "$");
                            %>
                            <option value="<%= option%>"><%= option%></option>
                            <% }%>
                        </select>
                    </div>
                    <div class="col-xs-12" style="padding-top: 20px">
                        <input type="hidden" name="origin" value="addToBasket" />
                        <input style="max-width: 120px; margin: auto" class="btn btn-warning btn-block" type="submit" value="Add to basket" name="Login" />
                    </div>
                </form>
            </div>        
        </div>
        <!--End of chooseCupcake div-->
        <!--Start of basket/checkout div-->
        <div>
            <form action="Front" method="POST">
                <div class="col-xs-12" style="padding-top: 20px">
                    <input type="hidden" name="origin" value="goToBasket" />
                    <input style="max-width: 120px; margin: auto" class="btn btn-success btn-block" type="submit" value="Go to basket" name="basket" />
                </div>
            </form>

        </div>




</html>
