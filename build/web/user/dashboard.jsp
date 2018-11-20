<h1>Dashboard</h1>
<div id="buttons">
    <button class="button button1"><a href="./user/viewbus.jsp"><span class="glyphicon glyphicon-screenshot"></span> View Bus</a></button>
    <button class="button button1"><a href="./user/search.jsp"><span class="glyphicon glyphicon-search"></span> Search Bus</a></button>
    <button class="button button1"><a href="./user/bookbus.jsp"><span class="glyphicon glyphicon-plus"></span> Book Bus</a></button>
    <button class="button button1"><a href="./user/cancelbus.jsp"><span class="glyphicon glyphicon-minus"></span> Cancel Bus</a></button>
    <hr>
    <button class="button button1"><a href="./user/bookings.jsp"><span class="glyphicon glyphicon-list"></span> My Bookings</a></button>
    <button class="button button1"><a href="./user/profile.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></button>
    <button class="button button1"><a href="./user/changepassword.jsp"><span class="glyphicon glyphicon-lock"></span> Change Password</a></button>
    <hr>
</div>
<script>
    window.onload = function(){
        $("#buttons button a").click(function(e){
            $("#con-container").load($(this).attr("href"));
            e.preventDefault();
            return false;
        });
    }
</script>