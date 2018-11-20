import test.Connect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/BookBus"})
public class BookBus extends HttpServlet {
    
    Connect makeConnect = new Connect();
    Connection con ;
    PreparedStatement pst, pst2, pst3;
    ResultSet rs, rs2, rs3;
    Statement st, st2, st3;
    
    String Username;
    String Busname;
    String Seats1;
    String BusRegNo;
    int Seats;
    String BRoute;
    String BType;
    Date d;
    String Price1;
    int Price;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        con = makeConnect.makeConnection();
        String userid = request.getParameter("uid");
        String busid = request.getParameter("bid");
        
        java.util.Date date = new java.util.Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dt = formatter.format(date);
        d = Date.valueOf(dt);
        System.out.println(d);
        
        if(!userid.equals(0)){
            try {
               boolean b = insertData(userid,busid);
               if(b){
                   out.println("registered");
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
            out.println("dont match");
        }
    }
    boolean validate(String busid){
        String qry = "select * from bus where Id ='"+busid+"'";

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
    boolean insertData(String userid,String busid) throws SQLException{
        boolean b;
        if(validate(busid)){
            String userqry = "SELECT * FROM users where id = '"+userid+"'";
            st=con.createStatement();
            rs=st.executeQuery(userqry);
            while(rs.next()){
                Username = rs.getString(3);
            }
            String busqry = "SELECT * FROM bus where Id = '"+busid+"'";
            st=con.createStatement();
            rs=st.executeQuery(busqry);
            while(rs.next()){
                Busname = rs.getString(2);
                Seats1 = rs.getString(3);
                BusRegNo = rs.getString(7);
                Seats = Integer.parseInt(Seats1);
                BRoute = rs.getString(5);
                BType = rs.getString(6);
                Price1 = rs.getString(4);
                Price = Integer.parseInt(Price1);
            }
            
            
            
           String sql = "insert into booking values(NULL,?,?,?,?,?,?,1)";
           pst = con.prepareStatement(sql);
           pst.setString(1, Username);
           pst.setString(2, Busname);
           pst.setString(3, BRoute);
           pst.setString(4, BType);
           pst.setDate(5, d);
           pst.setInt(6, Price);
           
           int seats = Seats-1;
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
           
           if(val == 1 && val2 == 1 && val3 == 1){b = true;}
           else{b =  false;}
        }
        else{
            b= false;
        }
        return b;
    }
}