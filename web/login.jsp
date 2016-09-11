<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Cupcake Shop - Login</title>
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
        <!--Adding the sweet bg video-->
        <video playsinline autoplay loop id="bgvid">
            <source src="media/bg.mp4" type="video/mp4">
        </video>
        <div class="container">
            <form class="form-signin" action="Front" method="POST">
                <% String login_msg = (String)request.getAttribute("error"); if(login_msg != null) out.println("<div class=\"alert alert-warning\">" + login_msg + "</div>"); %>
                <input class="form-control" type="text" name="username" value="" placeholder="Username" />
                <input class="form-control" type="password" name="password" value="" placeholder="Password" />
                <input type="hidden" name="origin" value="login" />
                <input class="btn btn-lg btn-primary btn-block" type="submit" value="Enter The Cupcake Shop" name="Login" />
            </form>
        </div>
    </body>
</html>
