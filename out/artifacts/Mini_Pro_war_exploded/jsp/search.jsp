<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.Date" %>

<div>
    <table id="tab1" class="cell-border stripe hover row-border " style="width:100%;">
        <thead>
        <tr>
            <th></th>
            <th>Lab Name</th>
            <th>From</th>
            <th>To</th>


        </tr>
        </thead>
        <tbody>
        <%
            String dt = request.getParameter("date");
            session.setAttribute("date", dt);


            Date date;
            String date1;
            int day;
            try {
                date1 = request.getParameter("date");
//                out.print(date1);
//                System.out.println(date1);
                date = new SimpleDateFormat("yyyy-MM-dd").parse(date1);
                day = date.getDay();
                Connection con = myDB.getCon();
                PreparedStatement stmt = con.prepareStatement("select * from lab_time inner join" +
                        " lab_details on lab_time.lab_no = lab_details.lab_no " +
                        "where lab_time.avail_day = ?");
                /*PreparedStatement stmt1=con.prepareStatement("select * from event_description")*/
                stmt.setInt(1, day);
                ResultSet rs = stmt.executeQuery();
//                out.print("<form method='post' action='labs.jsp' >");
                while (rs.next()) {
                    out.print("<tr>");
                    out.print("<td style='width:100px;'>");
                    out.print("<img src='data:image/png; base64," + Base64.getEncoder().encodeToString(rs.getBytes("photo")) + "' style='height:50px;width:50px'");
                    out.print("</td>");
                    out.print("<td>");
                    out.print("<button class='mybtn' onclick='openLabDetails(this)' data-lab='" + rs.getString("lab_id") + "'>");
                    out.print("<h4>" + rs.getString(2) + "</h4>");
                    out.print("</td>");
                    out.print("<td>");
                    out.print("<h4>" + rs.getString("from_time") + "</h4>");
                    out.print("</td>");
                    out.print("<td>");
                    out.print("<h4>" + rs.getString("to_time") + "</h4>");
                    out.print("</td>");
                    out.print("</tr>");
                }

//                    out.print("</form>");
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        </tbody>
    </table>


</div>
<!-- Page level plugin JavaScript-->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<script type="text/javascript">
    $(document).ready(function () {
        $('#tab1').DataTable();
    });

</script>

<script>

    function openLabDetails(e) {
        var lab_no = $(e).data("lab");
        $("#labs").load("jsp/labs.jsp?lab_name=" + lab_no);
        console.log("Lab NO:" + lab_no);
        $("#labs").show();
        $([document.documentElement, document.body]).animate({
            scrollTop: $("#labs").offset().top - 60
        }, 2000);
    }
</script>
