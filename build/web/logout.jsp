<%@page session="false" contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession mysession = request.getSession();
    mysession.invalidate();
    response.sendRedirect("./index.jsp");
%>