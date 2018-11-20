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
    ResultSet resultset = st.executeQuery("SELECT * FROM seats");
%>

<div class="row">
    <div class="col-sm-12">
        <div class="addbus">
            
            <table>
                <thead>
                        <td>Id</td>
                        <td>Bus Name</td>
                        <td>Reg. No</td>
                        <td>Route</td>
                        <td>Seats Available</td>
                </thead>
                <tbody>
                    <% while(resultset.next()){ %>
                            <tr>
                                <td><%= resultset.getString(1)%></td>
                                <td><%= resultset.getString(2)%></td>
                                <td><%= resultset.getString(3)%></td>
                                <td><%= resultset.getString(4)%></td>
                                <td>
                                    <form method="POST" action="SeatManagement">
                                        <input type="text" name="seat" placeholder="<%= resultset.getString(5)%>">
                                        <button value="<%= resultset.getString(3)%>" name="bid">Change</button>
                                    </form>
                                </td>
                            </tr>
                        <%}%>
                </tbody>
            </table>
        </div>
    </div>
</div>