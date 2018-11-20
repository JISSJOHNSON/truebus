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

@WebServlet(urlPatterns = {"/CancelBus"})
public class CancelBus extends HttpServlet {
    
    Connect makeConnect = new Connect();
    Connection con ;
    PreparedStatement pst, pst2, pst3;
    ResultSet rs, rs2;
    Statement st, st2;
    
    String Busname;
    String Route;
    String Seats1;
    int Seats;
    String BusRegNo;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        con = makeConnect.makeConnection();
        String bookid = request.getParameter("bookid");
        
        if(!bookid.equals(0)){
            try {
               boolean b = deleteData(bookid);
               if(b){
                   out.println("Cancelled");
                   response.sendRedirect("./home.jsp");
               }
               else{
                   out.println("Something wrong");
               }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        else{
            out.println("Booking Id don't match");
        }
    }
    boolean validate(String bookid){
        String qry = "select * from booking where Id ='"+bookid+"'";
          try {
            st=con.createStatement();
            rs=st.executeQuery(qry);
            if(rs.next()){
                Busname = rs.getString(3);
                Route = rs.getString(4);
                return true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
    boolean deleteData(String bookid) throws SQLException{
        boolean b;
        if(validate(bookid)){
            String sql = "UPDATE booking SET Status = '0' where id = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, bookid);
            
            String busqry = "SELECT * FROM bus where Name = '"+Busname+"' and Route ='"+Route+"'";
            st=con.createStatement();
            rs=st.executeQuery(busqry);
            while(rs.next()){
                Seats1 = rs.getString(3);
                Seats = Integer.parseInt(Seats1);   
                BusRegNo = rs.getString(7);
            }
            
            int seats = Seats+1;
            
            String seatqry = "UPDATE seats SET Seats = ? WHERE BusRegNo = ?";
            pst2 = con.prepareStatement(seatqry);
            pst2.setInt(1, seats);
            pst2.setString(2,BusRegNo);
            
            String seatqry1 = "UPDATE bus SET Seats = ? WHERE RegNo = ?";
            pst3 = con.prepareStatement(seatqry1);
            pst3.setInt(1, seats);
            pst3.setString(2,BusRegNo);
            
            int val = pst.executeUpdate();
            int val2 = pst2.executeUpdate();
            int val3 = pst3.executeUpdate();

            if(val == 1 && val2 ==1 && val3 ==1 ){b = true;}
            else{b =  false;}
            return b;
        }
        else{
            b = false;
            return b;
        }
    }
}