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

@WebServlet(urlPatterns = {"/AddBus"})
public class AddBus extends HttpServlet {
    
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
        String bname = request.getParameter("bname");
        String regno = request.getParameter("regno");
        String seatno = request.getParameter("seatno");
        String seatprice = request.getParameter("seatprice");
        String route =  request.getParameter("route");
        String type = request.getParameter("type");

        if(!route.equals(0)){
            try {
               boolean b = insertData(bname,seatno,seatprice,route,type,regno);
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
    boolean validate(String regno){
        String qry = "select * from bus where RegNo ='"+regno+"'";

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
    boolean insertData(String bname,String seatno,String seatprice,String route,String type,String regno) throws SQLException{
        boolean b;
        if(!validate(regno)){
           String sql = "insert into bus values(NULL,?,?,?,?,?,?)";
           pst = con.prepareStatement(sql);
           pst.setString(1, bname);
           int seatno1 = Integer.parseInt(seatno);
           pst.setInt(2, seatno1);
           int seatprice1 = Integer.parseInt(seatprice);
           pst.setInt(3, seatprice1);
           pst.setString(4, route);
           pst.setString(5, type);
           pst.setString(6, regno);
           
           int val = pst.executeUpdate();
           
           String sql2 = "insert into seats values(NULL,?,?,?,?)";
           pst2 = con.prepareStatement(sql2);
           pst2.setString(1, bname);
           pst2.setString(2, regno);
           pst2.setString(3, route);
           pst2.setInt(4, seatno1);
           
           int val2 = pst2.executeUpdate();
           if(val == 1){b = true;}
           else{b =  false;}
        }
        else{
            b= false;
        }
        return b;
    }
}