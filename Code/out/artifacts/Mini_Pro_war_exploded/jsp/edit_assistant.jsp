<%--
  Created by IntelliJ IDEA.
  User: rashmi
  Date: 8/10/18
  Time: 4:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>--%>
<%--<head>--%>
<%--</head>--%>
<%--<body>--%>

<%--</body>--%>
<%--</html>--%>
<%
    try {
        int i=0;
        String assistant_id = request.getParameter("assistant_id1");
        String assistant_name=request.getParameter("assistant_name1");
        String mob_no=request.getParameter("mob_no1");
        String email=request.getParameter("email1");
        String password=request.getParameter("password1");
        Connection con = myDB.getCon();
        PreparedStatement stmt = con.prepareStatement("update assistant_info set assistant_name=?,mob_no=?,email=?,password=? where assistant_id=?");
        stmt.setString(1,assistant_name);
        stmt.setString(2,mob_no);
        stmt.setString(3,email);
        stmt.setString(4,password);
        stmt.setString(5,assistant_id);
        i=stmt.executeUpdate();
        response.sendRedirect("/mainadmin.jsp");
    } catch (Exception e) {

    }

%>
