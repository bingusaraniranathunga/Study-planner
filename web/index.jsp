<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" href="style.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;700&display=swap"
            rel="stylesheet"
            />
    </head>
    <body class="sign-in">
        <div class="menu-bar">
            <ul>
                <li><a href="home.html">Home</a></li>
                <li><a href="about.html">About Us</a></li>
                <li><a href="index.jsp">Sign In</a></li>
                <li><a href="register.jsp?email=0">Sign Up</a></li>
            </ul>
        </div>
        <div class="center">
            <h1>Sign In</h1>
            <div class="login-error">${errorMessage}</div>
            <form action="Login" method="POST">
                <div class="txt-field">
                    <input type="text" name="email" required>
                    <label>E-mail</label>
                </div>
                <div class="txt-field">
                    <input type="password" name="pass" required>
                    <label>Password</label>
                </div>
                <input type="submit" value="Sign In">
                <div class="signup-link">
                    Not registered yet? <a href="register.jsp?email=0">Click here</a>
                </div>
            </form>
        </div>
        <div class="padding"></div>
        <jsp:include page="nav.jsp"/>
    </body>
</html>
