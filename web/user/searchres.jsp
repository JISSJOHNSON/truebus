<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" import="test.Connect"%>
<%
    String opt1 = request.getParameter("opt1");
    String opt2 = request.getParameter("opt2");
    String Route = "";
    
    Connect makeConnect = new Connect();
    Connection con = makeConnect.makeConnection();
    ResultSet rs,rs2;
    Statement st,st2;
    st = con.createStatement();
    st2 = con.createStatement();
    
    rs = st.executeQuery("SELECT * FROM busroute WHERE FromCity = '"+opt1+"' and ToCity = '"+opt2+"'");
    if(rs.next()){
    Route = rs.getString(2);
    rs2 = st2.executeQuery("SELECT * FROM bus WHERE Route = '"+Route+"'");
    
%>

<table>
    <thead>
            <td>Name</td>
            <td>Seats Available</td>
            <td>Price</td>
            <td>Route</td>
            <td>Type</td>
    </thead>
    <tbody>
        <%while(rs2.next()){%>
            <tr>
              <td><%= rs2.getString(2)%></td>
              <td><%= rs2.getString(3)%></td>
              <td><%= rs2.getString(4)%></td>
              <td><%= rs2.getString(5)%></td>
              <td><%= rs2.getString(6)%></td>
            </tr>
        <%}%>
    </tbody>
</table>
    
<%
    }
    else{
    %>
        No bus found
    <%
    }
%>