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

public class Register extends HttpServlet {
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
        
        String sfname = request.getParameter("fname");
        String slname = request.getParameter("lname");
        String semail = request.getParameter("email");
        String spass = request.getParameter("pass");
        String sconfirm = request.getParameter("confirm");
        String ssubjectNo[] ={"1","2","3","4","5","6","7","8","9","10"};
        String sfixed[] = {"10","10","10","10","10","10","10","10","10","10"};
        String suid = "";
        
        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/studyplan","app","app");
            
            PreparedStatement ps1 = con.prepareStatement("SELECT email FROM student WHERE email=?");
            ps1.setString(1,semail);
            
            ResultSet rs = ps1.executeQuery();
            
            if(rs.next()){
                ps1.close();
                con.close();
                response.sendRedirect("register.jsp?email=1");
            }
            else{
                if(spass.equals(sconfirm)){
                    
                    PreparedStatement ps2 = con.prepareStatement("INSERT INTO student(fname,lname,email,pass) VALUES (?,?,?,?)");
                    ps2.setString(1, sfname);
                    ps2.setString(2, slname);
                    ps2.setString(3, semail);
                    ps2.setString(4, spass);

                    int i = ps2.executeUpdate();

                    if(i>0){
                        ps1.close();
                        ps2.close();
                        try {
                            PreparedStatement st = con.prepareStatement("SELECT * FROM student WHERE email=? AND pass=?");
                            st.setString(1,semail);
                            st.setString(2,spass);

                            ResultSet rs1 = st.executeQuery();

                            if(rs1.next()) {
                                suid = rs1.getString("id") ;
                            }

                        } catch (SQLException e) {}
                        try{
                           if (sfixed != null && sfixed.length != 0) {
                           for (int j = 0; j < sfixed.length; j++) {
                                    PreparedStatement ps = con.prepareStatement("INSERT INTO subjects VALUES (?,?,?,?)");

                                    ps.setString(1, ssubjectNo[j]);
                                    ps.setString(2, "0");
                                    ps.setString(3, sfixed[j]);
                                    ps.setString(4, suid);

                                    int k = ps.executeUpdate();
                            }   
                               response.sendRedirect("index.jsp");
                            }
                            else{
                                response.sendRedirect("index.jsp");
                            }
                        } catch(SQLException ex) {}
                    }
                    
                    
                }
                else{     
                    ps1.close();
                    con.close();
                    response.sendRedirect("register.jsp?email=2");
                }
            }
            
            
        } catch (ClassNotFoundException | SQLException ex) {}
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
