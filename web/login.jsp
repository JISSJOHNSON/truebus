<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        top: 446px;
        left: 576px;
    }
    #suc-msg{
        color: #00af26;
        position: absolute;
        top: 446px;
        left: 600px;
    }
</style>
<div class="container">
    <div class="card" id="login-form">
        <div class="text-center"><span class="form-name">Login</span></div>
        <span class="form-margin">
            <form method="POST" action="LoginServlet">
                <div>
                    <input type="text" name="uname" required>
                    <label><span class="glyphicon glyphicon-user"></span> Username</label>
                </div>
                <div>
                    <input type="password" name="paswd" required id="pswdfld"><span id="eye" class="showpw glyphicon glyphicon-eye-open" onclick="showPwd()"></span>
                    <label><span class="glyphicon glyphicon-lock"></span> Password</label>
                </div>
                <div class="errmsg"></div>
                <div class="sucmsg"></div>
                <div>
                    <button class="login"><span class="glyphicon glyphicon-log-in"></span> Login</button>
                </div>
            </form><br>
            <!--<a onclick="showForgetForm()">Forget Password</a><br>-->
            New User ? <a href="./register.jsp">Register Here</a>
        </span>
    </div>
</div>