<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css" />
        <title>Study Planner - Edit preferences</title>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;700&display=swap"
            rel="stylesheet"
        />
    </head>
    <body class="edittime-page">
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
                <li><a href="studyprogress.jsp">Back</a></li>
                <li><a href="Logout">Logout</a></li>
            </ul>

            <div class="alert">
                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
                Warning! You are about to change the default times set for study
            </div>
        </div>
    </div>
    <div class="con">
        <div class="subjects">
            <h1 class="warning"><br>Please be absolutely certain when changing time allocated for each subject!</h1>
            <form action="EditHours" id="select-form" method="post">
                <label>Choose Topic:</label>
                <select name="subject" form="select-form">
                    <option value="1">Measurements</option>
                    <option value="2">Mechanics</option>
                    <option value="3">Simple Harmonic Oscillations and Waves</option>
                    <option value="4">Heat</option>
                    <option value="5">Electricity</option>
                    <option value="6">Properties of Matter</option>
                    <option value="7">Matter and Radiation</option>
                    <option value="8">Electric Fields</option>
                    <option value="9">Gravitational and Magnetic Fields</option>
                    <option value="10">Electronics</option>
                </select>
                <label>Choose the number of hours to be allocated for study:</label>
                <input type="text" name="hours" required>
                <input type="submit" value="Change preferences">
            </form>
        </div>
    </div>
    <% }%>
</body>
<jsp:include page="nav.jsp"/>
</html>
