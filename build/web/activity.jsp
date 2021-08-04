<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<% Class.forName("org.apache.derby.jdbc.EmbeddedDriver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Study Planner - Activities</title>
        <link rel="stylesheet" href="style.css" />
        <link rel="stylesheet"
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
            String month = request.getParameter("month");
            String day = request.getParameter("day");
            
            response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
            response.setHeader("Pragma","no-cache");
            response.setHeader("Expires","0");
		
            if(session.getAttribute("uid") == null) {
                response.sendRedirect("index.jsp");
            }
            else{
                
            String uid = session.getAttribute("uid").toString();
    
            try {
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/studyplan", "app","app");
                PreparedStatement ps = con.prepareStatement("SELECT * FROM activities WHERE uid=? AND month=? AND day=? order by stime");
                ps.setString(1,uid);
                ps.setString(2,month);
                ps.setString(3,day);
                
                ResultSet rs = ps.executeQuery();
        %>
         <div class="menu-bar">
            <ul>
                <li><a href="calendar.jsp">Back</a></li>
                <li><a href="Logout">Logout</a></li>
            </ul>
        </div>
        <div class="container">
            <div class="tab">
                <h1>Activities</h1>
                <div class="events">
                <%
                while(rs.next()){
                %>
                    <div class="event">
                        <div class="info">
                            <p><%= rs.getString("name") %></p>
                            <p><%= rs.getString("stime") %></p>
                            <p><%= rs.getString("etime") %></p>
                        </div>
                        <p class="event-desc"><%= rs.getString("description") %></p>
                    </div>
                    <% 
                            }
                        }
                        catch (Exception e){
                            e.printStackTrace();
                        }}
                    %>
                </div>
            </div>
        </div>
    </body>
    <div class="padding-cal"></div>
    <jsp:include page="nav.jsp"/>
</html>
