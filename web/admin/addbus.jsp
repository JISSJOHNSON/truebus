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
    ResultSet resultset = st.executeQuery("SELECT * FROM busroute");
    ResultSet resultset2 = st1.executeQuery("SELECT * FROM bustype");
%>
<div class="row">
    <div class="col-sm-12">
        <div class="addbus">
            <form method="POST" action="AddBus">
                <div class="row">
                    <div class="col-sm-6">
                    <input type="text" name="bname" required>
                    <label><span class="glyphicon glyphicon-bed"></span> Bus Name</label>
                </div>
                <div class="col-sm-6">
                    <input type="text" name="regno" required>
                    <label><span class="glyphicon glyphicon-barcode"></span> Registration No</label>
                </div>
                </div>
                <div class="row">
                <div class="col-sm-6">
                    <input type="text" name="seatno" required>
                    <label><span class="glyphicon glyphicon-th"></span> No of Seats</label>
                </div>
                <div class="col-sm-6">
                    <input type="text" name="seatprice" required>
                    <label><span class="glyphicon glyphicon-tag"></span> Seat Price</label>
                </div>
                </div>
                <div class="row">
<!--                <div class="col-sm-6">
                    <input type="text" name="routeid" required>
                    <label><span class="glyphicon glyphicon-user"></span> Route Id</label>
                </div>
                <div class="col-sm-6">
                    <input type="text" name="typeid" required>
                    <label><span class="glyphicon glyphicon-user"></span> Bus Type Id</label>
                </div>-->
                </div>
                <div class="row">
                    <div clas="col-sm-6">
                        <label class="city" for="sel1">Route:</label>
                        <select name="route" class="select1 form-control" id="sel1">
                            <option selected disabled>Select</option>
                            <% while(resultset.next()){%>
                            <option><%= resultset.getString(2)%></option>
                            <%}%>
                        </select>
                    </div>
                    <div clas="col-sm-6">
                        <label class="city" for="sel2">Type:</label>
                        <select name="type" class="select1 form-control" id="sel2">
                            <option selected disabled>Select</option>
                            <% while(resultset2.next()){%>
                            <option><%= resultset2.getString(2)%></option>
                            <%}%>
                        </select>
                    </div>
                </div>
                <div class="errmsg"></div>
                <div>
                    <button class="login"><span class="glyphicon glyphicon-plus-sign"></span> Add Bus</button>
                </div>
            </form>
        </div>
    </div>
</div>