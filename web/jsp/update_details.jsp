<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%
    //TODO Add the update code.

    try {
        Connection con = myDB.getCon();
        PreparedStatement stmt = con.prepareStatement("update lab_time set from_time = ?, to_time=?, day = ? where lab_no=?");
        PreparedStatement stmt1 = con.prepareStatement("update lab_details set capacity = ? where lab_no = ?" );

        stmt.setString(1, request.getParameter("lab_from_time"));
        stmt.setString(2, request.getParameter("lab_to_time"));
        stmt.setString(3, request.getParameter("lab_day"));
        stmt.setString(4,request.getParameter("lab_name"));

        System.out.println(request.getParameter("lab_name"));
    //    System.out.println(request.getParameter("lab_from_time"));

        stmt1.setString(1, request.getParameter("lab_capacity"));
        stmt1.setString(2,request.getParameter("lab_name"));

        int i=stmt.executeUpdate();
        int i1=stmt1.executeUpdate();

        System.out.println(i +" "+i1);

        response.sendRedirect("/blank.jsp");
    }catch (Exception e){
        e.printStackTrace();
    }
%>