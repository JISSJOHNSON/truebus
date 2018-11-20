<%@page import="java.sql.*" import="test.Connect"%>
<style>
    .addbus{
        height: 100%;
        max-width: 400px;
        margin: auto;
    }
    input,button.login{
        background: #f9f9f9;
        padding: 5px 0;
        margin-top: 30px;
        width: 100%;
        box-sizing: border-box;
        box-shadow: none;
        outline: none;
        border: none;
        border-radius: 5px;
        border: 2px #0062cc solid;
        font-weight: bold;
        font-size: 14px;
    }
    input:focus,
    input:valid{
        border: 1px #0062cc solid;
        padding: 10px;
        font-size: 16px;
    }
    button.login{
        border-bottom: none;
        cursor: pointer;
        background: #0062cc;
        color: #fff;
        margin-bottom: 0px;
        text-transform: uppercase;
    }
    form div{
        position: relative;
    }
    form div label{
        position: absolute;
        top: 38px;
        left: 25px;
        color: #999;
        transition: 0.25s;
        pointer-events: none;
    }
    input:focus ~ label,
    input:valid ~ label{
        top: 10px;
        left: 25px;
        color: #0062cc;
        font-size: 16px;
        font-weight: bold;
    }
    select{
        margin-left: 100px;
        margin-top: 20px;
        max-width: 300px;
        width: 50%;
    }
    .city{
        top: 8px;
        left: 10px;
    }
</style>

<%
    ResultSet rs;
    PreparedStatement ps;
    Connect makeConnect = new Connect();
    
    Connection con = makeConnect.makeConnection();
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    ResultSet resultset = st.executeQuery("SELECT * FROM city");
    ResultSet resultset2 = st1.executeQuery("SELECT * FROM city");
%>

<div class="row">
    <div class="col-sm-12">
        <div class="addbus">
            <form method="POST" action="AddRoute">
                <div>
                    <input type="text" name="rname" required>
                    <label><span class="glyphicon glyphicon-globe"></span> Route Name</label>
                </div>
                <div class="row">
                    <div clas="col-sm-6">
                        <label class="city" for="sel1">Source:</label>
                        <select name="source" class="select1 form-control" id="sel1">
                             <option selected disabled>Select</option>
                            <% while(resultset.next()){%>
                            <option><%= resultset.getString(2)%></option>
                            <%}%>
                        </select>
                    </div>
                    <div clas="col-sm-6">
                        <label class="city" for="sel2">Destination:</label>
                        <select name="destination" class="select1 form-control" id="sel2">
                             <option selected disabled>Select</option>
                            <% while(resultset2.next()){%>
                            <option><%= resultset2.getString(2)%></option>
                            <%}%>
                        </select>
                    </div>
                </div>
                <div class="errmsg"></div>
                <div>
                    <button class="login"><span class="glyphicon glyphicon-plus-sign"></span> Add Route</button>
                </div>
            </form>
    </div>
</div>
</div>