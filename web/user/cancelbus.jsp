<%@page import="java.sql.*" import="test.Connect"%>

<style>
    .addbus{
        height: 100%;
        max-width: 800px;
        margin: auto;
    }
    table {
        width: 100%;
    }
    thead {
        height: 50px;
        text-align: center;
        font-weight: bold;
        vertical-align: middle;
    }
    tbody{
        height: 40px;
        text-align: center;
        vertical-align: middle;
    }
    thead td{
        background: #101010;
        color: white;
    }
    tr{
        height: 40px;
    }
    td{
        /*width: 100px;*/
    }
    tr:hover {background-color: #f2f3ff;}
    /*tr:nth-child(even) {background-color: #f5f5f5;}*/
</style>

<%
    ResultSet rs;
    PreparedStatement ps;
    Connect makeConnect = new Connect();
    Connection con = makeConnect.makeConnection();
    Statement st = con.createStatement();
    HttpSession mysession = request.getSession();
    String email = mysession.getAttribute("email").toString();
    ResultSet resultset = st.executeQuery("SELECT * FROM booking where Uname = '"+email+"' and Status = 1");
%>

<div class="row">
    <div class="col-sm-12">
        <div class="addbus">
            <table>
                <thead>
                        <td>Bus</td>
                        <td>Route</td>
                        <td>Bus Type</td>
                        <td>Booked On</td>
                        <td>Price</td>
                        <td>Cancel</td>
                </thead>
                <tbody>
                    <%
                        while(resultset.next()){
                          %><tr>
                              <td><%= resultset.getString(3)%></td>
                              <td><%= resultset.getString(4)%></td>
                              <td><%= resultset.getString(5)%></td>
                              <td><%= resultset.getString(6)%></td>
                              <td><%= resultset.getString(7)%></td>
                              <td>
                                  <form action="CancelBus" method="POST">
                                    <button value="<%= resultset.getString(1)%>" name="bookid">Cancel</button>
                                  </form>
                              </td>
                            </tr><%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>