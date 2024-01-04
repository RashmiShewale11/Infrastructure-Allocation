<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.js"></script>
</head>
<%
    Connection con = myDB.getCon();
    String ename = request.getParameter("eventname");
    int rn = Integer.parseInt(request.getParameter("studrn"));
    String sname = request.getParameter("studname");
    String mail = request.getParameter("studmail");
    String mob = request.getParameter("studmn");
    String dept = request.getParameter("dept");
    String descript = request.getParameter("descp");
    String sd = request.getParameter("start_dt");
    String st = request.getParameter("start_time");
    String ed = request.getParameter("end_dt");
    String et = request.getParameter("end_time");
    String mis_id = (String) session.getAttribute("user_name");
    String lab = request.getParameter("lab_name");
    int flag = 0;
    String lab_assi_id = null;

    try {


        PreparedStatement stmt1 = con.prepareStatement("select assistant_id from lab_details where lab_no=?");
        stmt1.setString(1, lab);
        ResultSet rs1 = stmt1.executeQuery();
        while (rs1.next()) {
            lab_assi_id = rs1.getString("assistant_id");
            System.out.println(lab_assi_id);
        }
        PreparedStatement stmt = con.prepareStatement("insert into event_description (lab_no, mis_id, assistant_id, stud_roll, stud_name, stud_email, mob_no, dept, description, start_date, start_time, end_date, end_time, flag, event_name)values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        stmt.setString(1, lab);
        stmt.setString(2, mis_id);
        stmt.setString(3, lab_assi_id);
        stmt.setInt(4, rn);
        stmt.setString(5, sname);
        stmt.setString(6, mail);
        stmt.setString(7, mob);
        stmt.setString(8, dept);
        stmt.setString(9, descript);
        stmt.setString(10, sd);
        stmt.setString(11, st);
        stmt.setString(12, ed);
        stmt.setString(13, et);
        stmt.setInt(14, flag);
        stmt.setString(15, ename);
        int count = stmt.executeUpdate();

%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

    $(document).ready(function () {

        var check = '<%=count%>'
        if (check > 0) {


            swal({title: "Your request has been submitted", type: "success"}, function () {
                window.location = "/booking.jsp";
            });
        } else {
            swal({title: "Opps!", text: "Error sending request, Try Again!", type: "warning"}, function () {
                window.location = "/booking.jsp"
            });
        }
    })


</script>
<%
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

</html>
