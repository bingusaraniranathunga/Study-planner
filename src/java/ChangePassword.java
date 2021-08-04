
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

public class ChangePassword extends HttpServlet {
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
        
        String soldpass = request.getParameter("oldpass");
        String snewpass = request.getParameter("newpass");
        String sconfirmpass = request.getParameter("confirmpass");
        String id = session.getAttribute("uid").toString();
        
        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/studyplan","app","app");
            
            PreparedStatement ps1 = con.prepareStatement("SELECT * FROM student WHERE id=? AND pass=?");
            ps1.setString(1,id);
            ps1.setString(2,soldpass);
            
            ResultSet rs = ps1.executeQuery();
            
            if(rs.next()) {
                
                if(snewpass.equals(sconfirmpass)){
                    
                    PreparedStatement ps2 = con.prepareStatement("UPDATE student set pass=? where id=?");
                    ps2.setString(1, snewpass);
                    ps2.setString(2, id);

                    int i = ps2.executeUpdate();

                    if(i>0){
                        ps1.close();
                        ps2.close();
                        con.close();
                        response.sendRedirect("calendar.jsp");
                    }
                }
                else{ 
                    response.sendRedirect("changepassword.jsp?a=1");
                }
            }    
            else {
                ps1.close();
                con.close();
		response.sendRedirect("changepassword.jsp?a=1");
            }    
        } catch (ClassNotFoundException | SQLException ex) {}
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
