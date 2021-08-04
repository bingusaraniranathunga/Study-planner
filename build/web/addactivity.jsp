<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Study Planner - Add Activity</title>
        <link rel="stylesheet" href="style.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;700&display=swap"
            rel="stylesheet"
        />
    </head>
    <body class="addactivity-page">
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
        
        <div class="schedule">
            <%  if (request.getParameter("a").equals("1")) { %>
            <div class="alert">
                <span class="aclosebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
                Activity added successfully.
            </div>
            <%    }%>

            <h1>Add Activity</h1>
            <form method="post" action="AddActivity">

                <label>Activity Name</label>
                <input type="text" name="name" required>

                <label>Activity Description</label>
                <input type="text" name="desc" required>
                <label>Date</label>
                <input type="number" name="day" min="1" max="31" required>

                <label>Month</label>
                <input type="number" name="month" min="1" max="12" required>  

                <label>Start Time</label>
                <input type="time" name="start" required>
                <label>End time</label>
                <input type="time" name="end" required>

                <input type="submit" value="ADD"> 
            </form> 
        </div>
        <% }%>
    </body>
    <div class="padding"></div>
    <jsp:include page="nav.jsp"/>
</html>
