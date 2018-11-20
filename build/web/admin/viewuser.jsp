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
    thead td{
        background: #101010;
        color: white;
    }
    tbody{
        height: 40px;
        text-align: center;
        vertical-align: middle;
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
    ResultSet resultset = st.executeQuery("SELECT * FROM users");
%>

<div class="row">
    <div class="col-sm-12">
        <div class="addbus">
            <table>
                <thead>
                        <td>Id</td>
                        <td>Name</td>
                        <td>Email</td>
                        <td>Phone</td>
                        <td>D.O.B</td>
                        <td>Gender</td>
                </thead>
                <tbody>
                    <%
                        while(resultset.next()){
                          %><tr>
                              <td><%= resultset.getString(1)%></td>
                              <td><%= resultset.getString(2)%></td>
                              <td><%= resultset.getString(3)%></td>
                              <td><%= resultset.getString(4)%></td>
                              <td><%= resultset.getString(5)%></td>
                              <td><%= resultset.getString(6)%></td>
                            </tr><%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>