<%@ page import="java.sql.Connection" %>
<%@ page import="com.java.myDB" %>
<%@ page import="java.lang.ref.PhantomReference" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: shivani
  Date: 12/10/18
  Time: 10:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    try {
        out.print(request.getParameter("entc_date"));
        out.print(request.getParameter("from_time"));
        out.print(request.getParameter("to_time"));

        Connection con = myDB.getCon();
        PreparedStatement stmt = con.prepareStatement("insert into hall_booked values(?,?,?,?)");
        stmt.setString(1,request.getParameter("txt_it"));
        stmt.setString(2,request.getParameter("entc_date"));
        stmt.setString(3,request.getParameter("from_time"));
        stmt.setString(4,request.getParameter("to_time"));

        stmt.executeUpdate();


    }catch (SQLException e){
        e.printStackTrace();
    }
%>