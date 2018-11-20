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

@WebServlet(urlPatterns = {"/AddRoute"})
public class AddRoute extends HttpServlet {
    
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
        String rname = request.getParameter("rname");
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");

        if(!rname.equals(0)){
            try {
               boolean b = insertData(rname,source,destination);
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
    boolean validate(String rname){
        String qry = "select * from busroute where  Route_Name ='"+rname+"'";

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
    boolean insertData(String rname,String source,String destination) throws SQLException{
        boolean b;
        if(!validate(rname)){
           String sql = "insert into busroute values(NULL,?,?,?)";
           pst = con.prepareStatement(sql);
           pst.setString(1, rname);
           pst.setString(2, source);
           pst.setString(3, destination);
           
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