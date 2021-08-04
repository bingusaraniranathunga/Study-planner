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

public class Login extends HttpServlet {
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
        
        String email = request.getParameter("email");
	String pass = request.getParameter("pass");
        
        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/studyplan","app","app");
            
            PreparedStatement st = con.prepareStatement("SELECT * FROM student WHERE email=? AND pass=?");
            st.setString(1,email);
            st.setString(2,pass);
            
            ResultSet rs = st.executeQuery();
            
            if(rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("uid",rs.getString("id"));
                st.close();
                con.close();
		response.sendRedirect("calendar.jsp");
            }
            else {
                st.close();
                con.close();
                request.setAttribute("errorMessage","Incorrect email or password");
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }
            
        } catch (ClassNotFoundException | SQLException e) {}
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
