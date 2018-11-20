import test.Connect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/CityList"})
public class CityList extends HttpServlet {
    
    Connect makeConnect = new Connect();
    Connection con ;
    PreparedStatement pst;
    ResultSet rs;
    Statement st;

    public ArrayList getCity(){
        ArrayList CList = new ArrayList();
        String Qry = "SELECT * FROM city";
        try{
            st.execute(Qry);
            rs = st.getResultSet();
            while(rs.next()){
                HashMap<String, String> hs = new HashMap();
                
            }
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
        return CList;
    }
}