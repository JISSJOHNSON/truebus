import test.Connect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/RemoveUser"})
public class RemoveUser extends HttpServlet {
    
    Connect makeConnect = new Connect();
    Connection con ;
    PreparedStatement pst;
    ResultSet rs;
    Statement st;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        con = makeConnect.makeConnection();
        String Uname = request.getParameter("user");
        int Uname1 = Integer.parseInt(Uname);
        
        if(Uname1 > 0){
            try {
               boolean b = deleteData(Uname1);
               if(b){
                   out.println("Deleted");
                   response.sendRedirect("./dash.jsp");
               }
               else{
                   out.println("Not Deleted");
                   out.println(Uname1);
               }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        else{
            out.println("dont match");
        }
    }
    boolean deleteData(Integer Uname1) throws SQLException{
        boolean b;
        
        String sql = "delete FROM users where id = ?";
        pst = con.prepareStatement(sql);
        pst.setInt(1, Uname1);

        int val = pst.executeUpdate();
        
        if(val == 1){b = true;}
        else{b =  false;}
        return b;
        }
    }