<%-- 
    Document   : index
    Created on : Mar 17, 2016, 11:05:17 PM
    Author     : PRANSH
--%>

<%@page import="java.sql.Connection"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.sql.*, java.io.*, java.text.SimpleDateFormat, java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%try {
        //url will be received from popup.js
        String url = "";
        url=request.getParameter("url");
        if(url.contains("twitter.com"))
        {
            response.sendRedirect("twitter.jsp?url="+url);
        }
        else if(url.contains("linkedin.com"))
        {
            response.sendRedirect("linkedin.jsp?url="+url);
        }

    } catch (Exception e) {
        e.printStackTrace();
        System.out.println();
    }
%>
