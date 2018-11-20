import test.Connect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    Statement st;
    ResultSet rs;
    PreparedStatement pst;
    HttpSession mysession;
    String qr;
    String userid;
    String uname;
    String email;
    String phone;
    String dob;
    String gender;
    String password;
    String usertype;
    
    Connect makeConnect = new Connect();
    Connection con ;
    User user = new User();
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        con = makeConnect.makeConnection();
        String email1 = request.getParameter("uname");
        String paswd = request.getParameter("paswd");
        if(validate(email1,paswd)){
                HttpSession mysession = request.getSession();
                mysession.setAttribute("userid", userid);
                mysession.setAttribute("name", uname);
                mysession.setAttribute("email", email);
                mysession.setAttribute("phone", phone);
                mysession.setAttribute("dob", dob);
                mysession.setAttribute("gender", gender);
                mysession.setAttribute("password", password);
                mysession.setAttribute("usertype", usertype);
                System.out.println(usertype+" "+uname);
                response.sendRedirect("./authenticate.jsp");
        }
        else{
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.include(request,response);
            String error_msg="error-msg";
            out.print("<div id='"+error_msg+"'>Invalid username or Password</div>");
        }
    }
    boolean validate(String emailid, String passwd){
        String qry = "select * from users where  Email ='"+emailid+"' and Password ='"+passwd+"'";
          try {
            con = makeConnect.makeConnection();
            st=con.createStatement();
            rs=st.executeQuery(qry);
            if(rs.next()){
                userid = rs.getString(1);
                uname = rs.getString(2);
                email = rs.getString(3);
                phone = rs.getString(4);
                dob = rs.getString(5);
                gender = rs.getString(6);
                password = rs.getString(7);
                usertype = rs.getString(8);
//                user.setName(rs.getString(2));
//                user.setEmail(rs.getString(3));
//                user.setPhone(rs.getString(4));
//                user.setDob(rs.getString(5));
//                user.setGender(rs.getString(6));
//                user.setPassword(rs.getString(7));
//                user.setUserType(rs.getString(8));
//                mysession.setAttribute("user", user);
                return true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
}