<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<% Class.forName("org.apache.derby.jdbc.EmbeddedDriver"); %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Calendar</title>
        <link rel="stylesheet" href="style.css" />
        <link 
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
            integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;700&display=swap"
            rel="stylesheet"
            />
    </head>
    <body class="calender-page">
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
                <li><a href="progress.jsp">Overall Progress</a></li>
                <li><a href="studyprogress.jsp">Study Progress</a></li>
                <li><a href="addevent.jsp">Add Event</a></li>
                <li><a href="addactivity.jsp?a=0">Add Activity</a></li>
                <li><a href="changepassword.jsp?a=0">Edit Password</a></li>
                <li><a href="Logout">Logout</a></li>
            </ul>
        </div>

        <%
            try {
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/studyplan", "app", "app");
                PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE id=?");
                ps.setString(1, suid);

                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %> 
        <div class="sdetails">
            <label>Name : <%= rs.getString("fname")%> <%= rs.getString("lname")%></label>
            <label>Email : <%= rs.getString("email")%></label>
        </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            LocalDate today = java.time.LocalDate.now();

            try {
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/studyplan", "app", "app");

                PreparedStatement ps = con.prepareStatement("SELECT * FROM events WHERE uid=? and date>=? order by date");
                ps.setString(1, suid);
                ps.setString(2, String.valueOf(today));

                ResultSet rs = ps.executeQuery();
        %>
        <div class="container">
            <div class="calendar">
                <div class="month">
                    <i class="fas fa-angle-left prev"></i>
                    <div class="date">
                        <h1></h1>
                        <p></p>
                    </div>
                    <i class="fas fa-angle-right next"></i>
                </div>
                <div class="weekdays">
                    <div>Sun</div>
                    <div>Mon</div>
                    <div>Tue</div>
                    <div>Wed</div>
                    <div>Thu</div>
                    <div>Fri</div>
                    <div>Sat</div>
                </div>
                <div class="days">
                </div>
            </div>
            <div class="tab">
                <h1 class="events-heading">Events</h1>
                <div class="events">
                    <%
                        while (rs.next()) {
                    %>
                    <div class="event">
                        <div class="info">
                            <p><%= rs.getString("name")%></p>
                            <p><%= rs.getString("stime")%></p>
                            <p><%= rs.getString("etime")%></p>
                            <p><%= rs.getString("date")%></p>
                        </div>
                        <p class="event-desc"><%= rs.getString("description")%></p>
                    </div>
                    <%
                                }
                                ps.close();
                                con.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    %>
                </div>
            </div>
        </div>
        <div class="padding-cal"></div>
        <jsp:include page="nav.jsp"/>
        <script src="script.js"></script> 
    </body>
</html>
