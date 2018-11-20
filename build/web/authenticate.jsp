<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    HttpSession mysession = request.getSession(false);
    
    java.util.Date date = new java.util.Date();
    
    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-YYYY | hh:mm:ss a");
    String dt = formatter.format(date);
    
    Cookie user = new Cookie("Username", mysession.getAttribute("email").toString());
    Cookie lastlogin = new Cookie("lastdate2", dt);
    lastlogin.setMaxAge(60*60*24);
    user.setMaxAge(60*60*24);
    
    response.addCookie(lastlogin);
    
    mysession.setAttribute("lastdate", dt);
    
    
    if(mysession != null){
        if(mysession.getAttribute("name") != null && mysession.getAttribute("usertype") != null){
            if(mysession.getAttribute("usertype").toString().equals("1")){
                response.sendRedirect("./dash.jsp");
            }
            else if(mysession.getAttribute("usertype").toString().equals("2")){
                response.sendRedirect("./home.jsp");
            }
            else{
                response.sendRedirect("./usertype.jsp");
            }
        }
        else{
            System.out.println("Session Fail");
        }
    }
    else{
        response.sendRedirect("./index.jsp");
    }
%>
