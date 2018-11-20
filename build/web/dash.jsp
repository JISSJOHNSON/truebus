<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession mysession = request.getSession();
    if(mysession != null){
        if(mysession.getAttribute("name") != null && mysession.getAttribute("usertype").toString().equals("1")){
            System.out.print("Valid Authentication in Dash");
        }
        else{
            response.sendRedirect("logout.jsp");
        }
    }
    else{
        response.sendRedirect("logout.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard</title>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="dashboard.css" rel="stylesheet">
    <style>
body {
  padding-top: 50px;
}
.sub-header {
  padding-bottom: 10px;
  border-bottom: 1px solid #eee;
}
.navbar-fixed-top {
  border: 0;
}
.sidebar {
  display: none;
}
@media (min-width: 768px) {
  .sidebar {
    position: fixed;
    top: 51px;
    bottom: 0;
    left: 0;
    z-index: 1000;
    display: block;
    padding: 20px;
    overflow-x: hidden;
    overflow-y: auto;
    background-color: #f5f5f5;
    border-right: 1px solid #eee;
  }
}

.nav-sidebar {
  margin-right: -21px;
  margin-bottom: 20px;
  margin-left: -20px;
}
.nav-sidebar > li > a {
  padding-right: 20px;
  padding-left: 20px;
}
.nav-sidebar > .active > a,
.nav-sidebar > .active > a:hover,
.nav-sidebar > .active > a:focus {
  color: #fff;
  background-color: #428bca;
}
.main {
  padding: 20px;
}
@media (min-width: 768px) {
  .main {
    padding-right: 40px;
    padding-left: 40px;
  }
}
.main .page-header {
  margin-top: 0;
}

.placeholders {
  margin-bottom: 30px;
  text-align: center;
}
.placeholders h4 {
  margin-bottom: 0;
}
.placeholder {
  margin-bottom: 20px;
}
.placeholder img {
  display: inline-block;
  border-radius: 50%;
}
.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}
.button1 {
    background-color: white;
    color: black;
    border: 2px solid #e7e7e7;
}
a{
    text-decoration: none;
}
.button1:hover {background-color: #e7e7e7;}
    </style>
  </head>

  <body>

    <%@include file="navbar.jsp" %>

    <div class="container-fluid">
      <div class="row">
          <div class="col-sm-3 col-md-2 sidebar" id="sidelink">
          <ul class="nav nav-sidebar">
            <li><a href="./admin/dashboard.jsp"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
            <li><a href="./admin/viewbus.jsp"><span class="glyphicon glyphicon-search"></span> View Bus</a></li>
            <li><a href="./admin/addbus.jsp"><span class="glyphicon glyphicon-plus-sign"></span> Add Bus</a></li>
            <li><a href="./admin/removebus.jsp"><span class="glyphicon glyphicon-minus-sign"></span> Remove Bus</a></li>
            <li><a href="./admin/seatmanagement.jsp"><span class="glyphicon glyphicon-screenshot"></span> Seat Management</a></li>
            <!--<li><a href="./admin/updatebus.jsp">Update Bus</a></li>-->
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="./admin/addroute.jsp"><span class="glyphicon glyphicon-road"></span> Add Route</a></li>
              <li><a href="./admin/addcity.jsp"><span class="glyphicon glyphicon-globe"></span> Add City</a></li>
            <li><a href="./admin/addbustype.jsp"><span class="glyphicon glyphicon-scale"></span> Add Bus Type</a></li>
          </ul>
            <ul class="nav nav-sidebar">
                <li><a href="./admin/viewuser.jsp"><span class="glyphicon glyphicon-search"></span> View User</a></li>
                <li><a href="./admin/adduser.jsp"><span class="glyphicon glyphicon-plus-sign"></span> Add User</a></li>
                <li><a href="./admin/removeuser.jsp"><span class="glyphicon glyphicon-minus-sign"></span> Remove User</a></li>
                <!--<li><a href="./admin/updateuser.jsp">Update user</a></li>-->
            </ul>
        </div>
          <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="con-container">
              <div>
                <h1>Dashboard</h1>
                <div id="buttons">
                    <button class="button button1"><a href="./admin/viewbus.jsp"><span class="glyphicon glyphicon-search"></span> View Bus</a></button>
                    <button class="button button1"><a href="./admin/addbus.jsp"><span class="glyphicon glyphicon-plus-sign"></span> Add Bus</a></button>
                    <button class="button button1"><a href="./admin/removebus.jsp"><span class="glyphicon glyphicon-minus-sign"></span> Remove Bus</a></button>
                    <button class="button button1"><a href="./admin/seatmanagement.jsp"><span class="glyphicon glyphicon-screenshot"></span> Seat Management</a></button>
                    <hr>
                    <button class="button button1"><a href="./admin/addroute.jsp"><span class="glyphicon glyphicon-road"></span> Add Route</a></button>
                    <button class="button button1"><a href="./admin/addcity.jsp"><span class="glyphicon glyphicon-globe"></span> Add City</a></button>
                    <button class="button button1"><a href="./admin/addbustype.jsp"><span class="glyphicon glyphicon-scale"></span> Add Bus Type</a></button>
                    <hr>
                    <button class="button button1"><a href="./admin/viewuser.jsp"><span class="glyphicon glyphicon-search"></span> View user</a></button>
                    <button class="button button1"><a href="./admin/adduser.jsp"><span class="glyphicon glyphicon-plus-sign"></span> Add user</a></button>
                    <button class="button button1"><a href="./admin/removeuser.jsp"><span class="glyphicon glyphicon-minus-sign"></span> Remove user</a></button>
                </div>
              </div>
        </div>
      </div>
    </div>
    
    <%@include file="footer.jsp" %>
    
    
    
    <script>
        window.onload = function(){
            $("#sidelink ul li a").click(function(e){
                $("#con-container").load($(this).attr("href"));
                e.preventDefault();
                return false;
            });
            $("#buttons button a").click(function(e){
                $("#con-container").load($(this).attr("href"));
                e.preventDefault();
                return false;
            });
        }
    </script>
    <script src="./js/jquery.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
  </body>
</html>
