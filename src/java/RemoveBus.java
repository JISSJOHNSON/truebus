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

@WebServlet(urlPatterns = {"/RemoveBus"})
public class RemoveBus extends HttpServlet {
    
    Connect makeConnect = new Connect();
    Connection con ;
    PreparedStatement pst , pst2;
    ResultSet rs;
    Statement st;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        con = makeConnect.makeConnection();
        String Bus_Id = request.getParameter("bus");
        int Bus_Id1 = Integer.parseInt(Bus_Id);
        
        if(Bus_Id1 > 0){
            try {
               boolean b = deleteData(Bus_Id1);
               if(b){
                   out.println("Deleted");
                   response.sendRedirect("./dash.jsp");
               }
               else{
                   out.println("Not Deleted");
                   out.println(Bus_Id1);
               }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        else{
            out.println("dont match");
        }
    }
    boolean deleteData(Integer Bus_Id1) throws SQLException{
        boolean b;
        
        String sql = "delete FROM bus where Id = ?";
        pst = con.prepareStatement(sql);
        pst.setInt(1, Bus_Id1);

        int val = pst.executeUpdate();
        
        String sql2 = "delete FROM seats where BusRegNo = (SELECT RegNo FROM bus where Id = ?))";
        pst2 = con.prepareStatement(sql2);
        pst2.setInt(1, Bus_Id1);
        
        int val2 = pst2.executeUpdate();
        
        if(val == 1){b = true;}
        else{b =  false;}
        return b;
        }
    }