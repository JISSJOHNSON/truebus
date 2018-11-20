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
    table {
        min-width: 600px;
        width: 100%;
        /*margin-left: -150px;*/
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
</style>

<%
    Connect makeConnect = new Connect();
    
    Connection con = makeConnect.makeConnection();
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    Statement st3 = con.createStatement();
    ResultSet resultset = st.executeQuery("SELECT * FROM city");
    ResultSet resultset2 = st1.executeQuery("SELECT * FROM city");
    ResultSet resultset3 = st3.executeQuery("SELECT * FROM bus");
%>

<div class="row">
    <div class="col-sm-12">
        <div class="addbus">
            <!--<form method="POST" action="#resultset">-->
                <div class="row">
                    <div clas="col-sm-6">
                        <label class="city" for="sel1">Source:</label>
                        <select name="source" class="select1 form-control" id="sel1">
                             <option selected disabled>Select</option>
                            <% while(resultset.next()){%>
                            <option id="opt1" value="<%= resultset.getString(2)%>"><%= resultset.getString(2)%></option>
                            <%}%>
                        </select>
                    </div>
                    <div clas="col-sm-6">
                        <label class="city" for="sel2">Destination:</label>
                        <select name="destination" class="select1 form-control" id="sel2">
                             <option selected disabled>Select</option>
                            <% while(resultset2.next()){%>
                            <option id="opt2"><%= resultset2.getString(2)%></option>
                            <%}%>
                        </select>
                    </div>
                </div>
                <div class="errmsg"></div>
                <div>
                    <button class="login" onclick="searchresult()"><span class="glyphicon glyphicon-log-in"></span> Search Bus</button>
                </div>
            </div>
    </div><br><br>
    <div id="res">
        Select Source and Destination
    </div>
</div>
</div>
<script>
    function searchresult(){
        var opt1 = document.getElementById("sel1").value;
        var opt2 = document.getElementById("sel2").value;
        
        var xhttp;
        xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function(){
            if (this.readyState == 4 && this.status == 200)
                document.getElementById("res").innerHTML = this.responseText;
        }
        xhttp.open("GET", "./user/searchres.jsp?opt1="+opt1+"&opt2="+opt2, true);
        xhttp.send();
    };
</script>