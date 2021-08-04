<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove</title>
        <link rel="stylesheet" href="style.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;700&display=swap"
            rel="stylesheet"
        />
    </head>
    <body class="remove1-page">
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
                <li><a href="calendar.jsp">Calendar</a></li>
                <li><a href="Logout">Logout</a></li>
            </ul>
        </div>
        <div class="subjects">
            <form action="StudyRemove" id="select-form" method="post">
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
                <label>How many hours have you allocated for study?</label>
                <input type="text" name="hours" required>
                <input type="submit" value="Set hours">
            </form>
        </div>
        <%            String countrow[] = new String[11];
            try {
                Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/studyplan", "app", "app");

                for (int i = 1; i < 11; i++) {
                    PreparedStatement ps = con.prepareStatement("select * FROM subjects WHERE subject_no=? AND uid=?");

                    ps.setString(1, String.valueOf(i));
                    ps.setString(2, suid);

                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        countrow[i] = (rs.getString("hours"));
                    }
                    ps.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <table>     
            <tr>
                <th>Lesson</th>
                <th class="h">Hours</th>
            </tr>          
            <tr>
                <td>Measurements</td>
                <td class="h"><%= countrow[1]%></td>
            </tr>                   
            <tr>
                <td>Mechanics</td>
                <td class="h"><%= countrow[2]%></td>
            </tr>
            <tr>
                <td>Simple Harmonic Oscillations and Waves</td>
                <td class="h"><%= countrow[3]%></td>
            </tr>
            <tr>
                <td>Heat</td>
                <td class="h"><%= countrow[4]%></td>
            </tr>
            <tr>
                <td>Electricity</td>
                <td class="h"><%= countrow[5]%></td>
            </tr>
            <tr>
                <td>Properties of Matte</td>
                <td class="h"><%= countrow[6]%></td>
            </tr>
            <tr>
                <td>Matter and Radiation</td>
                <td class="h"><%= countrow[7]%></td>
            </tr>
            <tr>
                <td>Electric Fields</td>
                <td class="h"><%= countrow[8]%></td>
            </tr>
            <tr>
                <td>Gravitational and Magnetic Fields</td>
                <td class="h"><%= countrow[9]%></td>
            </tr>
            <tr>
                <td>Electronics</td>
                <td class="h"><%= countrow[10]%></td>
            </tr>
        </table>

        <% }%>
    </body>
</html>
