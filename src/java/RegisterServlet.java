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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
    
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
        String name = request.getParameter("uname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String  dob =  request.getParameter("dob");
        String gender = request.getParameter("gender");
        String pass = request.getParameter("paswd");
        String pass2 = request.getParameter("paswd2");
        System.out.println(dob);

        if(pass.equals(pass2)){
            try {
               boolean b = insertData(name,email,phone,dob,gender,pass);
               if(b){
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.include(request,response);
                    String suc_msg="suc-msg";
                    out.print("<div id='"+suc_msg+"'>Registered, Login Here</div>");
               }
               else{
//                   RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
//                   rd.include(request,response);
                   String err_msg="error-msg";
                   out.print("<div id='"+err_msg+"'>Something Went Wrong</div>");
               }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        else{
            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
            rd.include(request,response);
            String err_msg="error-msg";
            out.print("<div id='"+err_msg+"'>Password Didn't Match at last try</div>");
        }
    }
     boolean validate(String email){
        String qry = "select * from users where  email ='"+email+"'";

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
    
    boolean insertData(String name,String email,String phone,String dob,String gender,String password ) throws SQLException{
        boolean b;
        if(!validate(email)){
           String sql = "insert into users values(NULL,?,?,?,?,?,?,2)";
           pst = con.prepareStatement(sql);
           pst.setString(1, name);
           pst.setString(2,email);
           pst.setString(3, phone);
           Date d = Date.valueOf(dob);
           pst.setDate(4, d);
           pst.setString(5, gender);
           pst.setString(6, password);
           
           int val = pst.executeUpdate();
           if(val == 1){
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