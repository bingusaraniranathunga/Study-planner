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

public class AddEvent extends HttpServlet {

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
        
        String ename = request.getParameter("name");
        String estart = request.getParameter("start");
        String eend = request.getParameter("end");
        String edate = request.getParameter("date");
        String edesc = request.getParameter("desc");
        String id = session.getAttribute("uid").toString();
        
        
        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/studyplan","app","app");
            
            PreparedStatement ps = con.prepareStatement("INSERT INTO events VALUES (?,?,?,?,?,?)");
            ps.setString(1, ename);
            ps.setString(2, estart);
            ps.setString(3, eend);
            ps.setString(4, edate);
            ps.setString(5, edesc);
            ps.setString(6, id);
            
            int i = ps.executeUpdate();
            
            if(i>0){
                ps.close();
                con.close();
                response.sendRedirect("calendar.jsp");   
            }                
        } catch(ClassNotFoundException | SQLException ex) {}
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
