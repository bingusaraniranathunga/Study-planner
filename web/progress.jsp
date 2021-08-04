<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Progress</title>
        <link rel="stylesheet" href="style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;700&display=swap"
            rel="stylesheet"
        />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    </head>
    <body class="progress-page">
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
        <%
            Integer countrow[] = new Integer[11];
            try {
                Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/studyplan", "app", "app");

                for (int i = 1; i < 11; i++) {
                    PreparedStatement ps = con.prepareStatement("select  count(distinct process) FROM progress WHERE uid=? and topicid=?");
                    ps.setString(1, suid);
                    ps.setString(2, String.valueOf(i));

                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        countrow[i] = (rs.getInt(1)) * 25;
                    }
                    ps.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

        <input type="checkbox" id="show" class="hide">
        <label for="show" class="show-btn">Update</label>
        
        
        <div class="container3">
            <label for="show" class="close-btn" title="close">×</label>

            <form method="post" action="update.jsp">
                <label for="lessons">Choose the lesson:UPDATE</label>

                <select name="lessons" id="lessons">
                    <option value="1">Measurement</option>
                    <option value="2">Mechanics</option>
                    <option value="3">Simple Harmonic Oscillations and Waves</option>
                    <option value="4">Heat</option>
                    <option value="5">Electricity</option>
                    <option value="6">Properties of Matter</option>
                    <option value="7">Matter Radiation</option>
                    <option value="8">Electric Field</option>
                    <option value="9">Magnetic and Gravitational Fields</option>
                    <option value="10">Electronics</option>
                </select>
                <input type="submit" value="Select"/>
            </form>
        </div>
        <input type="checkbox" id="show1" class="hide1">
        <label for="show1" class="show-btn1">Remove</label>
        <div class="container1">
            <label for="show1" class="close-btn1" title="close">×</label>

            <form method="post" action="remove.jsp">
                <label for="lessonsr">Choose the lesson:REMOVE</label>

                <select name="lessons" id="lessonsr">
                    <option value="1">Measurement</option>
                    <option value="2">Mechanics</option>
                    <option value="3">Simple Harmonic Oscillations and Waves</option>
                    <option value="4">Heat</option>
                    <option value="5">Electricity</option>
                    <option value="6">Properties of Matter</option>
                    <option value="7">Matter Radiation</option>
                    <option value="8">Electric Field</option>
                    <option value="9">Magnetic and Gravitational Fields</option>
                    <option value="10">Electronics</option>
                </select>
                <input type="submit" value="Select"/>
            </form>
        </div>

        <div class="skills">
            <div class="skill">
                <div class="skill-name">Measurement</div>
                <div class="skill-bar">
                    <div class="skill-per" per=<%= countrow[1]%>></div>
                </div>

            </div>

            <div class="skill">
                <div class="skill-name">Mechanics</div>
                <div class="skill-bar">
                    <div class="skill-per" per=<%= countrow[2]%>></div>

                </div>
            </div>

            <div class="skill">
                <div class="skill-name">Simple Harmonic Oscillations and Waves</div>
                <div class="skill-bar">
                    <div class="skill-per" per=<%= countrow[3]%>></div>

                </div>
            </div>

            <div class="skill">
                <div class="skill-name">Heat</div>
                <div class="skill-bar">
                    <div class="skill-per" per=<%= countrow[4]%>></div>

                </div>
            </div>

            <div class="skill">
                <div class="skill-name">Electricity</div>
                <div class="skill-bar">
                    <div class="skill-per" per=<%= countrow[5]%>></div>

                </div>
            </div>
            <div class="skill">
                <div class="skill-name">Properties of Matter</div>
                <div class="skill-bar">
                    <div class="skill-per" per=<%= countrow[6]%>></div>

                </div>
            </div>

            <div class="skill">
                <div class="skill-name">Matter Radiation</div>
                <div class="skill-bar">
                    <div class="skill-per" per=<%= countrow[7]%>></div>

                </div>
            </div>

            <div class="skill">
                <div class="skill-name">Electric Field</div>
                <div class="skill-bar">
                    <div class="skill-per" per=<%= countrow[8]%>></div>

                </div>
            </div>

            <div class="skill">
                <div class="skill-name">Magnetic and Gravitational Fields</div>
                <div class="skill-bar">
                    <div class="skill-per" per=<%= countrow[9]%>></div>

                </div>
            </div>

            <div class="skill">
                <div class="skill-name">Electronics</div>
                <div class="skill-bar">
                    <div class="skill-per" per=<%= countrow[10]%>></div>

                </div>
            </div>
        </div>

        <script>
            $('.skill-per').each(function () {
                var $this = $(this);
                var per = $this.attr('per');
                $this.css("width", per + '%');
                $({animatedValue: 0}).animate({animatedValue: per}, {
                    duration: 1000,
                    step: function () {
                        $this.attr('per', Math.floor(this.animatedValue) + '%');
                    },
                    complete: function () {
                        $this.attr('per', Math.floor(this.animatedValue) + '%');
                    }
                });
            });
        </script>
       <% } %>
       <div class="padding-cal"></div>
     <jsp:include page="nav.jsp"/>
    </body>
</html>
