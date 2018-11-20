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

@WebServlet(urlPatterns = {"/SeatManagement"})
public class SeatManagement extends HttpServlet {
    
    Connect makeConnect = new Connect();
    Connection con ;
    PreparedStatement pst, pst2;
    ResultSet rs, rs2;
    Statement st, st2;
    
    boolean b;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        con = makeConnect.makeConnection();
        String seat1 = request.getParameter("seat");
        int seat = Integer.parseInt(seat1);
        String bid = request.getParameter("bid");

        if(!bid.equals(0)){
            try {
                b = updatedata(seat,bid);
                
               if(b){
                   out.println("Seat Changed");
                   response.sendRedirect("./dash.jsp");
               }
               else{
                   out.println("Something went Wrong");
               }
            }catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        else{
            out.println("Not Changed");
        }
    }
     boolean validate(String bid){
        String qry = "select * from seats where BusRegNo ='"+bid+"'";

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
    
    boolean updatedata(int seat,String bid) throws SQLException{
        if(validate(bid)){
           String sql = "UPDATE seats SET Seats = ? where BusRegNo = ?";
           pst = con.prepareStatement(sql);
           pst.setInt(1, seat);
           pst.setString(2,bid);
           
           String sql1 = "UPDATE bus SET Seats = ? where RegNo = ?";
           pst2 = con.prepareStatement(sql1);
           pst2.setInt(1, seat);
           pst2.setString(2,bid);
           
           int val = pst.executeUpdate();
           int val2 = pst2.executeUpdate();
           
           if(val == 1 && val2 == 1){
               b = true;
           }
           else{
               b =  false;
          }
            }
        else{
            b= false;
        }
        return b;
        }
}