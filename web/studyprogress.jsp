<%@page import="java.util.ArrayList"%>
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
        <link rel="stylesheet" href="style.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;700&display=swap"
            rel="stylesheet"
        />
        <title>Study Planner - Progress</title>
    </head>
    <body class="progress1-page">

        <%

            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");

            ArrayList<Integer> hours = new ArrayList();
            ArrayList<Integer> fixed = new ArrayList();

            if (session.getAttribute("uid") == null) {
                response.sendRedirect("index.jsp");
            } else {
                String uid = session.getAttribute("uid").toString();
                try {
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/studyplan", "app", "app");
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM subjects WHERE uid=?");
                    ps.setString(1, uid);

                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                        hours.add(Integer.parseInt(rs.getString("hours")));
                        fixed.add(Integer.parseInt(rs.getString("fixed")));
                    }
                } catch (Exception e) {
                }
        %>
        <div class="menu-bar">
            <ul>
                <li><a href="calendar.jsp">Back</a></li>
                <li><a href="editTime.jsp">Edit Preferences</a></li>
                <li><a href="studyremove.jsp">Remove</a></li>
                <li><a href="Logout">Logout</a></li>
            </ul>
        </div>

        <div class="con">
            <div class="subjects">
                <form action="AddHours" id="select-form" method="post">
                    <label>Choose Topic:</label>
                    <select name="subject" form="select-form" class="subject-select">
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
                    <label>How many hours did you study?</label>
                    <input type="text" name="hours" required>
                    <input type="submit" value="Set hours">
                </form>
            </div>
            <div class="skills">
                <h1>Your Progress So Far</h1>
                <div class="skill">
                    <div class="skill-name">Measurements</div>
                    <div class="skill-bar">
                        <div class="skill-per" style="width: <%= hours.get(0) < fixed.get(0) ? (double) hours.get(0) / fixed.get(0) * 100 : 100%>%; background-color: <%= hours.get(0) < fixed.get(0) ? "red" : "#1bff17"%>;"></div>
                    </div>
                </div>
                <div class="skill">
                    <div class="skill-name">Mechanics</div>
                    <div class="skill-bar">
                        <div class="skill-per" style="width: <%= hours.get(1) < fixed.get(1) ? (double) hours.get(1) / fixed.get(1) * 100 : 100%>%; background-color: <%= hours.get(1) < fixed.get(1) ? "red" : "#1bff17"%>;"></div>
                    </div>
                </div>
                <div class="skill">
                    <div class="skill-name">Simple Harmonic Oscillations and Waves</div>
                    <div class="skill-bar">
                        <div class="skill-per" style="width: <%= hours.get(2) < fixed.get(2) ? (double) hours.get(2) / fixed.get(2) * 100 : 100%>%; background-color: <%= hours.get(2) < fixed.get(2) ? "red" : "#1bff17"%>;"></div>
                    </div>
                </div>
                <div class="skill">
                    <div class="skill-name">Heat</div>
                    <div class="skill-bar">
                        <div class="skill-per" style="width: <%= hours.get(3) < fixed.get(3) ? (double) hours.get(3) / fixed.get(3) * 100 : 100%>%; background-color: <%= hours.get(3) < fixed.get(3) ? "red" : "#1bff17"%>;"></div>
                    </div>
                </div>
                <div class="skill">
                    <div class="skill-name">Electricity</div>
                    <div class="skill-bar">
                        <div class="skill-per" style="width: <%= hours.get(4) < fixed.get(4) ? (double) hours.get(4) / fixed.get(4) * 100 : 100%>%; background-color: <%= hours.get(4) < fixed.get(4) ? "red" : "#1bff17"%>;"></div>
                    </div>
                </div>
                <div class="skill">
                    <div class="skill-name">Properties of Matter</div>
                    <div class="skill-bar">
                        <div class="skill-per" style="width: <%= hours.get(5) < fixed.get(5) ? (double) hours.get(5) / fixed.get(5) * 100 : 100%>%; background-color: <%= hours.get(5) < fixed.get(5) ? "red" : "#1bff17"%>;"></div>
                    </div>
                </div>
                <div class="skill">
                    <div class="skill-name">Matter and Radiation</div>
                    <div class="skill-bar">
                        <div class="skill-per" style="width: <%= hours.get(6) < fixed.get(6) ? (double) hours.get(6) / fixed.get(6) * 100 : 100%>%; background-color: <%= hours.get(6) < fixed.get(6) ? "red" : "#1bff17"%>;"></div>
                    </div>
                </div>
                <div class="skill">
                    <div class="skill-name">Electric Fields</div>
                    <div class="skill-bar">
                        <div class="skill-per" style="width: <%= hours.get(7) < fixed.get(7) ? (double) hours.get(7) / fixed.get(7) * 100 : 100%>%; background-color: <%= hours.get(7) < fixed.get(7) ? "red" : "#1bff17"%>;"></div>
                    </div>
                </div>
                <div class="skill">
                    <div class="skill-name">Gravitational and Magnetic Fields</div>
                    <div class="skill-bar">
                        <div class="skill-per" style="width: <%= hours.get(8) < fixed.get(8) ? (double) hours.get(8) / fixed.get(8) * 100 : 100%>%; background-color: <%= hours.get(8) < fixed.get(8) ? "red" : "#1bff17"%>;"></div>
                    </div>
                </div>
                <div class="skill">
                    <div class="skill-name">Electronics</div>
                    <div class="skill-bar">
                        <div class="skill-per" style="width: <%= hours.get(9) < fixed.get(9) ? (double) hours.get(9) / fixed.get(9) * 100 : 100%>%; background-color: <%= hours.get(9) < fixed.get(9) ? "red" : "#1bff17"%>;"></div>
                    </div>
                </div>
            </div>  
        </div>
        <%}%>
        <jsp:include page="nav.jsp"/>
    </body>
</html>
