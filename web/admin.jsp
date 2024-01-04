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

    <title>SB Admin - Dashboard</title>

    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">

</head>

<%
    // try {
    String user = (String) session.getAttribute("user_name");
    Connection con = myDB.getCon();
    PreparedStatement stmt1 = con.prepareStatement("select * from assistant_info where assistant_id=?");
    PreparedStatement stmt = con.prepareStatement("select count(*) as event_count from event_description where flag=0 and assistant_id=?");
    stmt1.setString(1, user);
    stmt.setString(1, user);
    ResultSet rs1 = stmt1.executeQuery();
    ResultSet rs = stmt.executeQuery();
    String event_count = null;
    while (rs.next()) {
        event_count = rs.getString(1);
    }
    String name = null;
    while (rs1.next()) {
        name = rs1.getString("assistant_name");
    }
%>

<body id="page-top">


<nav class="navbar navbar-expand navbar-dark bg-dark fixed-top">
    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>
    <a class="navbar-brand mr-1" href="admin.jsp">Welcome <%=name%> !</a>


    <a class="ml-auto" href="logout.jsp"><i class="fas fa-sign-out-alt"></i></a>

</nav>


<div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="admin.jsp">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="admin.jsp">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="blank.jsp">
                <i class="fas fa-fw fa-edit"></i>
                <span>Update Lab Details</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="blank1.jsp">
                <i class="fas fa-fw fa-user-edit"></i>
                <span>Update User Details</span></a>
        </li>
    </ul>

    <div id="content-wrapper">

        <div class="container-fluid">

            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Overview</li>
            </ol>

            <!-- Icon Cards-->
            <div class="row">
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-primary o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fas fa-fw fa-comments"></i>
                            </div>
                            <div class="mr-5"><%=event_count%> New Request(s) ! <i
                                    class="float-right fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-warning o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fas fa-fw fa-list"></i>
                            </div>
                            <div class="mr-5">History</div>
                        </div>
                        <a onclick="toscroll()" class="card-footer text-white clearfix small z-1" href="#">
                            <i class="float-right fas fa-angle-right"></i>
                        </a>
                    </div>
                </div>

                <div class="col-xl-3 col-sm-6 mb-3">

                </div>
                <div class="col-xl-3 col-sm-6 mb-3">

                </div>
            </div>
            <!-- Area Chart Example-->
            <!-- DataTables Example -->
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
                                <th>Accept / Reject</th>

                            </tr>
                            </thead>
                            <tbody>
                            <%
                                try {
                                    //Connection con = myDB.getCon();
                                    if (con != null) {
                                        PreparedStatement stmt2 = con.prepareStatement("select * from event_description where assistant_id=?");
                                        stmt2.setString(1, user);
                                        ResultSet rs2 = stmt2.executeQuery();

                                        while (rs2.next()) {
                                            if (rs2.getInt("flag") == 0) {
                                                out.print("<tr>");
                                                out.print("<td>");
                                                out.print(rs2.getString("event_name"));
                                                out.print("</td>");
                                                out.print("<td>");
                                                out.print(rs2.getString("dept"));
                                                out.print("</td>");
                                                out.print("<td>");
                                                out.print(rs2.getString("description"));
                                                out.print("</td>");
                                                out.print("<td>");
                                                out.print("<button type='button' class=' fa fa-check btn btn-success' onclick='openEvent1(this)' data-eid1='" + rs2.getString("event_id") + "' ></button> ");
                                                out.println("&nbsp");
                                                out.print("<button type='button' class=' fa fa-close btn btn-danger' onclick='openEvent2(this)' data-eid2='" + rs2.getString("event_id") + "'>");

                                                out.print("</td>");
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

            <!-- Division to show history-->
            <div class="card mb-3" id="history">
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
                                            PreparedStatement stmt3 = con.prepareStatement("select * from event_description where assistant_id=?");
                                            stmt3.setString(1, user);
                                            ResultSet rs3 = stmt3.executeQuery();

                                            while (rs3.next()) {
                                                if (rs3.getInt("flag") != 0) {

                                                    out.print("<tr>");
                                                    out.print("<td>");
                                                    out.print(rs3.getString("event_name"));
                                                    out.print("</td>");
                                                    out.print("<td>");
                                                    out.print(rs3.getString("dept"));
                                                    out.print("</td>");
                                                    out.print("<td>");
                                                    out.print(rs3.getString("description"));
                                                    out.print("</td>");

                                                    if (rs3.getInt("flag") == 1) {

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
            </div>
        </div>
        <!-- /.container-fluid -->

        <!-- Sticky Footer -->
        <footer class="sticky-footer">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright © Your Website 2018</span>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.content-wrapper -->

</div>
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
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Page level plugin JavaScript-->
<script src="vendor/datatables/jquery.dataTables.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#tab2').DataTable();
    });

    function openEvent1(e) {
        var event_no1 = $(e).data("eid1");
        console.log("Event_id" + event_no1);
        window.location = "/confirm?event_id=" + event_no1;
    }

    function openEvent2(e) {

        var event_no2 = $(e).data("eid2");
        console.log("Event_id" + event_no2);
        window.location = "/reject?event_id=" + event_no2;

    }

    function toscroll(e) {
        $([document.documentElement, document.body]).animate({
            scrollTop: $("#history").offset().top - 60
        }, 1000);
    }

</script>


</body>

</html>
