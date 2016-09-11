<%-- 
    Document   : invoice
    Created on : 11-09-2016, 11:48:35
    Author     : RadeonXRay
--%>

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
                <h1 style="color: white" align="center">Checkout Successfull!</h1>
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
                        
                    </tbody>
                </table>
                    <h4 style="color: white" align="center">Grand Total: <% out.print(session.getAttribute("grandTotal")); %> </h4>
                
            </div>
        </div>
    </body>
</html>
