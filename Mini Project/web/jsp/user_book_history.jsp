<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Booking History</title>

    <!-- Bootstrap core CSS-->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Page level plugin CSS-->
    <link href="/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin.css" rel="stylesheet">

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>

<%
    // try {
    String user = (String) session.getAttribute("user_name");
    Connection con = myDB.getCon();
    PreparedStatement stmt;
    ResultSet rs;
%>

<body class="w3-light-grey">

<nav class="navbar navbar-expand-lg  fixed-top" style="background-color: #009688">

    <!-- Navbar brand -->
    <a class="navbar-brand" href="#"><i class="fa fa-institution" aria-hidden="true"></i>&nbsp;<strong>INFRASTRUCTURE
        ALLOCATION
    </strong></a>

    <!-- Collapse button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
            aria-controls="basicExampleNav"

            aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Collapsible content -->
    <div class="collapse navbar-collapse" id="basicExampleNav">

        <!-- Links -->
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="/booking.jsp" data-toggle="tooltip" title="History"><i
                        class="fa fa-home fa-lg" aria-hidden="true"></i></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/logout.jsp" data-toggle="tooltip" title="LogOut"><i
                        class="fa fa-sign-out fa-rotate-180 fa-lg" aria-hidden="true"></i></a>
            </li>

            <!-- Dropdown -->
        </ul>
        <!-- Links -->
    </div>
    <!-- Collapsible content -->
</nav>

<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-envelope fa-fw"></i>&nbsp;Requests
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table id="tab2" class="table table-bordered" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Event Name</th>
                    <th>Department</th>
                    <th>Event Description</th>
                    <th>Status</th>

                </tr>
                </thead>
                <tbody>
                <%
                    try {
                        //Connection con = myDB.getCon();
                        if (con != null) {
                            stmt = con.prepareStatement("select * from events where mis_id=?");
                            stmt.setString(1, user);
                            rs = stmt.executeQuery();

                            while (rs.next()) {

                                out.print("<tr>");
                                out.print("<td>");

                                out.print(rs.getString("event_name"));

                                out.print("</td>");
                                out.print("<td>");

                                out.print(rs.getString("dept"));

                                out.print("</td>");
                                out.print("<td>");

                                out.print(rs.getString("description"));

                                out.print("</td>");
                                out.print("<td>");
                                int flg = rs.getInt("flag");
                                if (flg == 0)
                                    out.print("<span style='color: #FFC300 ;font-weight:bold;'>" + "Pending" + "</span>");
                                else if (flg == 1) {
                                    out.print("<span style='color:green;font-weight:bold;'>" + "Confirmed " + "</span>");
                                    out.print("<button class=' fa fa-download btn ' onclick='openLabDetails(this)' data-event='" + rs.getString("event_id") + "'></button>");
                                } else {
                                    out.print("<span style='color:red;font-weight:bold;'>" + "Rejected" + "</span>");
                                    out.print("<p><b>Reason:</b>" + rs.getString("remark") + "</p>");
                                }
                                out.print("</td>");
                                out.print("</tr>");
                                out.print("</form>");

                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Division to show history-->
<%--<div class="card mb-3" id="history">
    <div class="card-header">
        <i class="fas fa-fw fa-list"></i>&nbsp;History
    </div>
    <div class="card-body">

       <div id="hist">
            <div class="table-responsive">
                <table id="tab3" class="table table-bordered" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Event Name</th>
                        <th>Department</th>
                        <th>Event Description</th>
                        <th>Accept / Reject</th>

                    </tr>
                    </thead>
                    <tbody>
                    <%
                        try {
                            //Connection con = myDB.getCon();
                            if (con != null) {
                                stmt = con.prepareStatement("select * from event_description");
                                rs = stmt.executeQuery();

                                while (rs.next()) {
                                    if (rs.getInt("flag") != 0) {

                                        out.print("<tr>");
                                        out.print("<td>");
                                        out.print(rs.getString("event_name"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(rs.getString("dept"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(rs.getString("description"));
                                        out.print("</td>");

                                        if (rs.getInt("flag") == 1) {

                                            out.print("<td>");
                                            out.print("<span style='color:green;font-weight:bold;'>" + "Confirmed" + "</span>");
                                            out.print("</td>");

                                        } else {
                                            out.print("<td>");
                                            out.print("<span style='color:red;font-weight:bold;'>" + "Rejected" + "</span>");
                                            out.print("</td>");
                                        }
                                        out.print("</tr>");

                                    }
                                }
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>--%>
</div>
<!-- /.container-fluid -->

<!-- /#wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Page level plugin JavaScript-->
<script src="/vendor/datatables/jquery.dataTables.js"></script>
<script src="/vendor/datatables/dataTables.bootstrap4.js"></script>

<!-- Custom scripts for all pages-->
<script src="/js/sb-admin.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#tab2').DataTable();
    });

</script>
<script>

    function openLabDetails(e) {
        var event_id = $(e).data("event");
        window.location = "generatepdf.jsp?event_id=" + event_id;
        console.log("Event No:" + event_id);
    }
</script>


</body>

</html>
