<style>
    .button2 {
    background-color: white; 
    color: black; 
    border: 2px solid #f44336;
}

.button2:hover {
    background-color: #f44336;
    color: white;
}
.button3 {
    background-color: white; 
    color: black; 
    border: 2px solid #4CAF50;
}

.button3:hover {
    background-color: #4CAF50;
    color: white;
}
.buttoncon{
    margin: 100px 100px;
}
.container12{
    margin-left:auto;
}
</style>

<div class="buttoncon">
    <h1>Do You need to deactivate Your Account?</h1>
    <div class="container12">
        <form action="DeactivateAccount" method="POST">
            <%HttpSession mysession = request.getSession();%>
            <input type="text" name="uid" value="<%= mysession.getAttribute("userid")%>" hidden="true">
            <button class="button button2" type="submit" name="conf" value="1">Yes</button>
            <button class="button button3" type="submit" name="conf" value="0">No</button>
        </form>
    </div>
</div>