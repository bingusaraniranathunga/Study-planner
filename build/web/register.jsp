<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <link rel="stylesheet" href="style.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;700&display=swap"
            rel="stylesheet"
            />
    </head>
    <body class="register-page">
        <div class="menu-bar">
            <ul>
                <li><a href="home.html">Home</a></li>
                <li><a href="about.html">About Us</a></li>
                <li><a href="index.jsp">Sign In</a></li>
                <li><a href="register.jsp?email=0">Sign Up</a></li>   
            </ul>
        </div>
        <div class="center">
            <h1>Sign Up</h1>
            <form method="post" action="Register">
                <div class="error">
                    <%
                        if (request.getParameter("email").equals("1")) {
                            out.println("Email already in use!");
                        }
                        if (request.getParameter("email").equals("2")) {
                            out.println("Passwords are not matched!");
                        }
                    %>
                </div>
                <div class="txt-field">
                    <input type="text" name="fname"  required>
                    <label>First Name</label>
                </div>
                <div class="txt-field">
                    <input type="text" name="lname" required>
                    <label>Last Name</label>
                </div>
                <div class="txt-field">
                    <input type="email" name="email" required>
                    <label>E-mail</label>
                </div>

                <div class="txt-field">
                    <input type="password" name="pass" required>
                    <label>Password</label>
                </div>
                <div class="txt-field">
                    <input type="password" name="confirm" required>
                    <label>Confirm Password</label>
                </div>
                <input type="submit" value="Sign Up">
            </form>
        </div>
        <div class="padding"></div>
        <jsp:include page="nav.jsp"/>
    </body>
</html>
