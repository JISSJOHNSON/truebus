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
<script>
    window.onload = function(){
        $("#buttons button a").click(function(e){
            $("#con-container").load($(this).attr("href"));
            e.preventDefault();
            return false;
        });
    }
</script>