<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession mysession = request.getSession();
%>
<html>
<head>
    <title>Register</title>
    <link rel="shortcut icon" href="#">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
    <style>
    .card {
            background-color: #ececec;
            max-width: 400px;
            min-height: 350px;
            padding: 20px 50px 30px;
            margin: 80px auto;
            border-radius: 10px;
            box-shadow: 0px 0px 20px -6px black;
    }
    .form-name{
            font-weight: bold;
            font-size: 30px;
            margin-top: -30px;
            /*padding: 100px;*/
            padding-bottom: 50px;
    }
    input,button.login{
            background: #f9f9f9;
            padding: 5px 0;
            margin-top: 30px;
            /*margin-bottom: 30px;*/
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
            left: 10px;
            color: #999;
            transition: 0.25s;
            pointer-events: none;
    }
    input:focus ~ label,
    input:valid ~ label{
            top: 10px;
            left: 0px;
            color: #0062cc;
            font-size: 16px;
            font-weight: bold;
    }
    .form-margin{
            margin-top: 500px;
    }
    .hider{
            display: none;
    }
    .shower{
            display: all;
    }
    .showpw{
            position: absolute;
            color: #999999;
            font-size: 16px;
            font-weight: bold;
            margin-left: -25px;
            margin-top: 40px;
    }
    input:focus ~ .showpw,
    input:valid ~ .showpw{
            top: 5px;
    }
    #error-msg{
        color: red;
        position: absolute;
        top: 680px;
        left: 580px;
    }
    #suc-msg{
        color: #00af26;
        position: absolute;
        top: 680px;
        left: 600px;
    }
</style>
</head>
<body>
    <%@include file="./navbar.jsp" %>
    
    
    <div class="container">
    <div class="card" id="login-form">
        <div class="text-center"><span class="form-name">Register</span></div>
        <span class="form-margin">
            <form method="POST" action="RegisterServlet">
                <div>
                    <input type="text" name="uname" required>
                    <label><span class="glyphicon glyphicon-user"></span> Username</label>
                </div>
                <div>
                    <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" name="email" required>
                    <label><span class="glyphicon glyphicon-envelope"></span> Email</label>
                </div>
                <div>
                    <input type="tel" maxlength="10" name="phone" required>
                    <label><span class="glyphicon glyphicon-earphone"></span> Phone</label>
                </div>
                <div>
                    <input type="date" name="dob" required>
                    <label><span class="glyphicon glyphicon-calendar"></span> Date of Birth</label>
                </div>
                <div>
                    <input type="radio" name="gender" value="Male">Male
                    <input type="radio" name="gender" value="female">Female
                </div>
                <div>
                    <input type="password" name="paswd" required id="pswdfld"><span id="eye" class="showpw glyphicon glyphicon-eye-open" onclick="showPwd()"></span>
                    <label><span class="glyphicon glyphicon-lock"></span> Password</label>
                </div>
                <div>
                    <input type="password" name="paswd2" required id="pswdfld"><span id="eye" class="showpw glyphicon glyphicon-eye-open" onclick="showPwd()"></span>
                    <label><span class="glyphicon glyphicon-lock"></span> Confirm Password</label>
                </div>
                <div>
                    <button class="login"><span class="glyphicon glyphicon-log-in"></span> Register</button>
                </div>
                <div class="error-msg"></div>
            </form><br>
        </span>
    </div>
</div>
    
    <%@include file="footer.jsp" %>
    <style>
    .footer {
        position: relative;
    }
    </style>
</body>
    <script type="text/javascript" src="./js/jquery.min.js"></script> 
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script>
    function showPwd() {
        var fld = document.getElementById("pswdfld");
        if(fld.type === "password") {
            fld.type = "text";
            document.getElementById("eye").classList.remove("glyphicon-eye-open");
            document.getElementById("eye").classList.add("glyphicon-eye-close");
        }else {
            fld.type = "password";
            document.getElementById("eye").classList.add("glyphicon-eye-open");
            document.getElementById("eye").classList.remove("glyphicon-eye-close");
        }
</script>
</html>
