<%@ page import="java.sql.Connection" %>
<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.PreparedStatement" %>

<%
    try {
        Connection con = myDB.getCon();
        String user = (String) session.getAttribute("user_name");
        PreparedStatement stmt = con.prepareStatement("update assistant_info set assistant_name=?,mob_no=?,email=? where assistant_id=?");
        stmt.setString(1, request.getParameter("nm"));
        stmt.setString(2, request.getParameter("mn"));
        stmt.setString(3, request.getParameter("mail"));
        stmt.setString(4, user);
        stmt.executeUpdate();
        response.sendRedirect("/blank1.jsp");
    }catch (Exception e)
    {
        e.printStackTrace();
    }
%>

