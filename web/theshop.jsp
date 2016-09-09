<%-- 
    Document   : theshop
    Created on : 09-09-2016, 13:26:39
    Author     : Ceo
--%>

<%@page import="entity.Cupcake"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Layer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <body>
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
        <% ArrayList<Layer> toppingList = (ArrayList<Layer>) session.getAttribute("toppings");
            ArrayList<Layer> bottomsList = (ArrayList<Layer>) session.getAttribute("bottoms");
            ArrayList<Cupcake> cupcakesList = (ArrayList<Cupcake>) session.getAttribute("cupcakes");

        %>

        Toppings:
        <select>
            <%  for (int i = 0; i < toppingList.size(); i++) {
                    String option = toppingList.get(i).getCupcakeLayerPiece() +" | " + toppingList.get(i).getPrice() + "$";
            %>

            <option value="<%= option%>"><%= option%></option>
            <% }%>
        </select>

        Bottoms:
        <select>
            <%  for (int i = 0; i < bottomsList.size(); i++) {
                    String option = bottomsList.get(i).getCupcakeLayerPiece() +" | " + bottomsList.get(i).getPrice() + "$";
            %>

            <option value="<%= option%>"><%= option%></option>
            <% }%>
        </select>
        <br><br>
        Cupcakes:
        <select>
            <%  for (int i = 0; i < cupcakesList.size(); i++) {
                    String option = cupcakesList.get(i).getCupCakename();
            %>

            <option value="<%= option%>"><%= option%></option>
            <% }%>
        </select>

</html>
