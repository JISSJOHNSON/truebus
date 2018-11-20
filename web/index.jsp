<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession mysession = request.getSession();
    if(mysession != null){
        if(mysession.getAttribute("name") != null){
            response.sendRedirect("authenticate.jsp");
            return;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Index</title>
    <link rel="shortcut icon" href="#">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
    <style>
        body{
            margin: 0px;
            padding: 0px;
            background: #f5f5f5;
        }
    </style>
</head>
<body>
    <%@include file="./navbar.jsp" %>
    <%@include file="./login.jsp" %>
    <%@include file="./footer.jsp" %>
</body>
    <script type="text/javascript" src="./js/jquery.min.js"></script> 
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
</html>
