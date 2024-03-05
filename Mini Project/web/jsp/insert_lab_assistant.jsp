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

<%
    Connection con = myDB.getCon();
    String assistant_id = request.getParameter("id");
    String assistant_name = request.getParameter("name");
    String mob_no = request.getParameter("mob_no");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String lab_id = request.getParameter("lab_id1");
    String capacity = request.getParameter("capacity1");
    String dept = request.getParameter("dept1");
    int count = 0;
    try {
        PreparedStatement stmt, stmt1;
        stmt = con.prepareStatement("select assistant_id from assistant where assistant_id = ?");
        stmt.setString(1, assistant_id);
        ResultSet rs = stmt.executeQuery();
        HttpSession session1 = request.getSession();
        if (rs.next()) {
            count++;
        }
        stmt1 = con.prepareStatement("select lab_no from Labs where lab_no = ?");
        stmt1.setString(1, lab_id);
        ResultSet rs1 = stmt1.executeQuery();

        if (rs1.next()) {
            count++;
        }
        if (count == 0) {
            stmt = con.prepareStatement("insert into assistant values(?,?,?,?,?)");
            stmt1 = con.prepareStatement("insert into Labs values(?,?,?,?)");
            stmt.setString(1, assistant_id);
            stmt.setString(2, assistant_name);
            stmt.setString(3, mob_no);
            stmt.setString(4, email);
            stmt.setString(5, password);
            stmt1.setString(1, lab_id);
            stmt1.setString(2, assistant_id);
            stmt1.setString(3, capacity);
            stmt1.setString(4, dept);
            stmt.executeUpdate();
            stmt1.executeUpdate();
            response.sendRedirect("/mainadmin.jsp");

        } else {
            session1.setAttribute("err", "userlab");
            response.sendRedirect("/mainadmin.jsp");
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }


%>

