<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.InputStream" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String user=(String) session.getAttribute("user_name");
    Connection con=myDB.getCon();
    try{
        String mail=request.getParameter("email");
        String mob=request.getParameter("mobile");


        PreparedStatement stmt=con.prepareStatement("update teachers set email_id=?,mob_no=?,photo=?");
        stmt.setString(1,mail);
        stmt.setString(2,mob);

        InputStream is = null;
        Part fp = request.getPart("pic");
        System.out.println(fp);
        if (fp != null) {
            System.out.println(fp.getName());
            System.out.println(fp.getSize());
            System.out.println(fp.getContentType());
            is = fp.getInputStream();

            stmt.setBlob(3, is);

        }


            int i=stmt.executeUpdate();
        if(i>0)
            response.sendRedirect("/booking.jsp");
    }
    catch (Exception e){
        e.printStackTrace();
    }

%>