
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Progress extends HttpServlet{
    
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
    
        HttpSession session =request.getSession();
        
        String suid = session.getAttribute("uid").toString();
        String stopicid =request.getParameter("topicid");
        String s[] = request.getParameterValues("process");
        try{
            if (s != null && s.length != 0) {
                
                Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/studyplan","app","app");

                for (int i = 0; i < s.length; i++) {
                    
                    PreparedStatement ps = con.prepareStatement("INSERT INTO progress VALUES (?,?,?)");
                    ps.setString(1, suid);
                    ps.setString(2, stopicid);
                    ps.setString(3, s[i]);

                    int j = ps.executeUpdate();
                }   
                
                response.sendRedirect("progress.jsp");
            }
            else{
                response.sendRedirect("progress.jsp");
            }
        } catch(ClassNotFoundException | SQLException ex) {}
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    
}
