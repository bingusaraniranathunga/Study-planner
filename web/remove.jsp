<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
        <link rel="stylesheet" href="style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;700&display=swap"
            rel="stylesheet"
            />
    </head>
    <body class="update-page">
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
                <li><a href="calendar.jsp"> Calendar</a></li>
                <li><a href="Logout">Logout</a></li>
            </ul>
        </div>
        <%  String cbtheory = "disabled";
            String cbtutorial = "disabled";
            String cbrevision = "disabled";
            String cbpast = "disabled";

            String stopicid = request.getParameter("lessons");
            String process[] = {" ", " ", " ", " "};
            try {
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/studyplan", "app", "app");
                PreparedStatement ps = con.prepareStatement("SELECT distinct * FROM progress WHERE uid=? and topicid=?");
                ps.setString(1, suid);
                ps.setString(2, stopicid);

                ResultSet rs = ps.executeQuery();
                int i = 0;
                while (rs.next()) {
                    process[i] = rs.getString("process");
                    i++;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            for (int j = 0; j < 4; j++) {
                if (process[j].equals("Theory")) {
                    cbtheory = " ";
                } else if (process[j].equals("Tutorial")) {
                    cbtutorial = " ";
                } else if (process[j].equals("Revision")) {
                    cbrevision = " ";
                } else if (process[j].equals("PastPapers")) {
                    cbpast = " ";
                }
            }
        %> 
        <input type="checkbox" id="show" class="hide">

        <div class="container2">
            

            <form method="post" action="Remove">

                <div class="tasks">
                    <h1>Completed Tasks</h1>
                    <br>
                    <%
                        for (int k = 0; k < 4; k++) {
                    %>
                    <h2><%= process[k]%></h2>
                    <%
                        }
                    %>
                    <br>
                </div>
                <table>                   
                    <tr>
                        <td>Theory</td>
                        <td> <input type="checkbox" name="process" value="Theory" <%= cbtheory%> ></td>
                    </tr>                   
                    <tr>
                        <td>Tutorial</td>
                        <td> <input type="checkbox" name="process" value="Tutorial"  <%= cbtutorial%> ></td>
                    </tr>
                    <tr>
                        <td>Revision</td>
                        <td> <input type="checkbox" name="process" value="Revision" <%= cbrevision%> ></td>
                    </tr>
                    <tr>
                        <td>Past Papers</td>
                        <td> <input type="checkbox" name="process" value="PastPapers" <%= cbpast%> ></td>
                    </tr>
                </table>
                <input type="hidden" name="topicid" value="<%= stopicid%>">
                <input type="submit" name="Submit"/>
            </form>
        </div>
        <% }%>
        <div class="padding"></div>
        <jsp:include page="nav.jsp"/>
    </body>
</html>
