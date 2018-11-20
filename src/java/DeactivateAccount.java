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

@WebServlet(urlPatterns = {"/DeactivateAccount"})
public class DeactivateAccount extends HttpServlet {
    
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
        String uid = request.getParameter("uid");
        String deac = request.getParameter("conf");
        int uid1 = Integer.parseInt(uid);
        int deac1 = Integer.parseInt(deac);
        
        if(deac1 == 1){
            try {
               boolean b = deleteData(uid1);
               if(b){
                   out.println("Deleted");
                   response.sendRedirect("./logout.jsp");
               }
               else{
                   out.println("Not Deleted ");
                   out.println(uid1);
               }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        else{
            out.println("not deleted");
            response.sendRedirect("./home.jsp");
        }
    }
    boolean deleteData(Integer uid1) throws SQLException{
        boolean b;
        
        String sql = "delete FROM users where id = ?";
        pst = con.prepareStatement(sql);
        pst.setInt(1, uid1);

        int val = pst.executeUpdate();
        
        if(val == 1){b = true;}
        else{b =  false;}
        return b;
        }
    }