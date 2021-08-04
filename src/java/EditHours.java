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

public class EditHours extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
        
        String subject = request.getParameter("subject");
        String fixed = request.getParameter("hours");
        String uid = session.getAttribute("uid").toString();
        
        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/studyplan","app","app");
            
            PreparedStatement ps = con.prepareStatement("UPDATE subjects SET fixed=? WHERE subject_no=? AND uid=?");
            ps.setString(1,fixed);
            ps.setString(2,subject);
            ps.setString(3,uid);
            
            int i = ps.executeUpdate();
            
            if(i>0){
                ps.close();
                con.close();
                response.sendRedirect("studyprogress.jsp");
            }
        } catch(ClassNotFoundException | SQLException ex) {}
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
