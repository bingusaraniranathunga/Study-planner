import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddActivity extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String aname = request.getParameter("name");
        String adesc = request.getParameter("desc");
        String astart = request.getParameter("start");
        String aend = request.getParameter("end");
        String aday = request.getParameter("day");
        String amonth = request.getParameter("month");
        String id = session.getAttribute("uid").toString();

        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/studyplan", "app", "app");

            PreparedStatement ps = con.prepareStatement("INSERT INTO activities VALUES (?,?,?,?,?,?,?)");
            ps.setString(1, aname);
            ps.setString(2, astart);
            ps.setString(3, aend);
            ps.setString(4, aday);
            ps.setString(5, amonth);
            ps.setString(6, adesc);
            ps.setString(7, id);

            int i = ps.executeUpdate();

            if (i > 0) {
                ps.close();
                con.close();
                response.sendRedirect("addactivity.jsp?a=1");
            }

        } catch (ClassNotFoundException | SQLException ex) {
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
