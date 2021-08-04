<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Study Planner - Add Event</title>
        <link rel="stylesheet" href="style.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;700&display=swap"
            rel="stylesheet"
            />
    </head>
    <body class="addevent-page">
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


        <div class="popup">

            <h1>Add Event</h1>
            <form method="post" action="AddEvent">

                <label>Event Name</label>
                <input type="text" name="name" required>

                <label>Event Description</label>
                <input type="text" name="desc" required>

                <label>Date</label>
                <input type="date" name="date" required>
                <label>Start Time</label>
                <input type="time" name="start" required>
                <label>End Time</label>
                <input type="time" name="end" required>

                <input type="submit" value="ADD">  
            </form> 
        </div>
        <% }%>
        <div class="padding"></div>
        <jsp:include page="nav.jsp"/>
    </body>
</html>
