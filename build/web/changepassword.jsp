<!DOCTYPE html>
<html>
    <head>
        <title>Change Password</title>
        <link rel="stylesheet" href="style.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;700&display=swap"
            rel="stylesheet"
            />
    </head>
    <body class="changepass-page">
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");

            if (session.getAttribute("uid") == null) {
                response.sendRedirect("index.jsp");
            } else {
                String suid = session.getAttribute("uid").toString();

        %>
        <div class="menu-bar">
            <ul>
                <li><a href="calendar.jsp">Back</a></li>
                <li><a href="Logout">Logout</a></li>

            </ul>
        </div>
        <div class="center">
            <h1>Change Password</h1>  
            <form method="post" action="ChangePassword">
                <div class="error">

                    <%  if (request.getParameter("a").equals("1")) {
                            out.println("Passwords are not matched!");
                        }
                    %>
                </div>
                <div class="txt_field">
                    <label>Old Password</label>
                    <input type="text" name="oldpass"  required>


                </div>                
                <div class="txt_field">
                    <label>New Password</label>
                    <input type="password" name="newpass" required>


                </div>
                <div class="txt_field">
                    <label>Confirm New Password</label>
                    <input type="password" name="confirmpass" required>


                </div>
                <input type="submit" value="Submit">
            </form>
        </div>
        <% }%>
        <div class="padding"></div>
        <jsp:include page="nav.jsp"/>
    </body>
</html>

