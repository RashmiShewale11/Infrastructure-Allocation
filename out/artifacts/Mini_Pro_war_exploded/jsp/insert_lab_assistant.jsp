<%--
  Created by IntelliJ IDEA.
  User: rashmi
  Date: 8/10/18
  Time: 5:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.InputStream" %>

<%
  Connection con = myDB.getCon();
    String assistant_id = request.getParameter("id");
    String assistant_name = request.getParameter("name");
    String mob_no = request.getParameter("mob_no");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String lab_id=request.getParameter("lab_id1");
    String capacity=request.getParameter("capacity1");
    String dept= request.getParameter("dept1");

    try {

    PreparedStatement stmt = con.prepareStatement("insert into assistant_info values(?,?,?,?,?)");
    PreparedStatement stmt1 = con.prepareStatement("insert into lab_details values(?,?,?,?)");
    stmt.setString(1, assistant_id);
    stmt.setString(2, assistant_name);
    stmt.setString(3, mob_no);
    stmt.setString(4, email);
    stmt.setString(5, password);
    stmt1.setString(1, lab_id);
    stmt1.setString(2,assistant_id);
    stmt1.setString(3,capacity);
    stmt1.setString(4,dept);
    stmt.executeUpdate();
    stmt1.executeUpdate();

  } catch (SQLException e) {
    e.printStackTrace();
  }

    response.sendRedirect("/mainadmin.jsp");

%>

