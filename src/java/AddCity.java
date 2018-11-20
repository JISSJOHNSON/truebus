import test.Connect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/AddCity"})
public class AddCity extends HttpServlet {
    
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
        String city = request.getParameter("city");

        if(!city.equals(0)){
            try {
               boolean b = insertData(city);
               if(b){
                   out.println("registered");
                   response.sendRedirect("./dash.jsp");
               }
               else{
                   out.println("Something wrong");
               }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        else{
            out.println("dont match");
        }
    }
    boolean validate(String city){
        String qry = "select * from city where name ='"+city+"'";

          try {
            st=con.createStatement();
            rs=st.executeQuery(qry);
            if(rs.next()){
                return true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
    boolean insertData(String city) throws SQLException{
        boolean b;
        if(!validate(city)){
           String sql = "insert into city values(NULL,?)";
           pst = con.prepareStatement(sql);
           pst.setString(1, city);
           
           int val = pst.executeUpdate();
           if(val == 1){b = true;}
           else{b =  false;}
        }
        else{
            b= false;
        }
        return b;
    }
}