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

@WebServlet(urlPatterns = {"/SearchBus"})
public class SearchBus extends HttpServlet {
    
    Connect makeConnect = new Connect();
    Connection con ;
    PreparedStatement pst;
    ResultSet rs, rs2;
    Statement st, st2;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        con = makeConnect.makeConnection();
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");

        if(!source.equals(0)){
            try {
               boolean b = selectData(source,destination);
               if(b){
                   out.println("registered");
                   response.sendRedirect("./searchres.jsp");
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
    boolean selectData(String source,String destination) throws SQLException{
        boolean b;
        if(!validate(source)){
           String sql = "SELECT * FROM busroute WHERE From = '"+source+"' and To = '"+destination+"'";
           
           int val =1;
           if(val == 1){b = true;}
           else{b =  false;}
        }
        else{
            b= false;
        }
        return b;
    }
}