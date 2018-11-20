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
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="addbus">
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
                <div class-="row">
                    <div>
                        <input type="date" name="dob" value="2000-02-02" required>
                        <label><span class="glyphicon glyphicon-calendar"></span> Date of Birth</label>
                    </div>
                    <select name="gender">
                        <option disabled selected>Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <input type="password" name="paswd" required id="pswdfld">
                        <label><span class="glyphicon glyphicon-lock"></span> Password</label>
                    </div>
                    <div class="col-sm-6">
                        <input type="password" name="paswd2" required id="pswdfld2">
                        <label><span class="glyphicon glyphicon-lock"></span> Confirm Password</label>
                    </div>
                </div>
                <div class="errmsg"></div>
                <div>
                    <button class="login"><span class="glyphicon glyphicon-log-in"></span> Add User</button>
                </div>
            </form>
        </div>
    </div>
</div>