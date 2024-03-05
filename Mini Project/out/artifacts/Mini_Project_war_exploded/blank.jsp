<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getSession().getAttribute("user_name") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Update Lab Details</title>

    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">
<%
    try {

        String user = (String) session.getAttribute("user_name");
        Connection con = myDB.getCon();
        PreparedStatement stmt = con.prepareStatement("select * from Labs inner join lab_time lt on Labs.lab_no = lt.lab_no where Labs.assistant_id = ?");
        PreparedStatement stmt1 = con.prepareStatement("select assistant_name from assistant where assistant_id=?");
        PreparedStatement stmt2 = con.prepareStatement("select * from Labs where assistant_id=?");
        stmt1.setString(1, user);
        stmt.setString(1, user);
        stmt2.setString(1, user);
        ResultSet rs = stmt.executeQuery();
        ResultSet rs1 = stmt1.executeQuery();
        ResultSet rs2 = stmt2.executeQuery();
        String lab_no = null;
        String user_name = null;
        rs1.next();
        rs2.next();
%>

<nav class="navbar navbar-expand navbar-dark bg-dark fixed-top">

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle">
        <i class="fas fa-bars"></i>
    </button>

    <a class="navbar-brand mr-1" href="admin.jsp">Welcome <%=rs1.getString("assistant_name")%> !</a>
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
                    <a href="admin.jsp">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Update Lab Details</li>
                <li>
                    <button class="btn" style="margin-left: 650px;" onclick="toscroll()">Insert New Records</button>
                </li>
            </ol>

            <!-- Page Content -->
            <h1>Update Lab Details</h1>
            <hr>
            <% while (rs.next()) { %>
            <form action="/updateServlet" method="post">
                <div class="card">
                    <div class="card-header">
                        Update the Lab
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-5">
                                <label style="width:200px;">Lab Name:</label>&nbsp;<input type="text" id="lab_name"
                                                                                          name="lab_name"
                                                                                          value="<%=rs.getString("lab_no")%>"
                                                                                          style="width:200px" y readonly>
                            </div>
                            <div class="col-2"></div>
                            <div class="col-5">
                                <label style="width:200px;">Time From:</label>&nbsp;<input type="time"
                                                                                           id="lab_from_time"
                                                                                           name="lab_from_time"
                                                                                           value="<%=rs.getString("from_time")%>"
                                                                                           style="width:200px;"
                                                                                           readonly>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-5">
                                <label style="width:200px;">Capacity:</label>&nbsp;<input type="text" id="lab_capacity"
                                                                                          name="lab_capacity"
                                                                                          value="<%=rs.getString("capacity")%>"
                                                                                          style="width:200px;" readonly>
                            </div>
                            <div class="col-2"></div>
                            <div class="col-5">
                                <label style="width:200px;">Time To:</label>&nbsp;<input type="time" id="lab_to_time"
                                                                                         name="lab_to_time"
                                                                                         value="<%=rs.getString("to_time")%>"
                                                                                         style="width:200px;" readonly>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-5">
                                <label style="width:200px;">Day:</label><input type="text" id="lab_day" name="lab_day"
                                                                               value="<%=rs.getString("day")%>"
                                                                               style="width:200px;"
                                                                               readonly>
                            </div>
                            <div class="col-2"></div>
                            <div class="col-5">
                            </div>
                        </div>
                    </div>
                    <div class="card-footer" align="center">
                        <button class="btn btn-primary fa fa-edit" id="edit" type="button" onclick="enable1()">
                            &nbsp;Edit
                        </button>
                        <button class="btn btn-success fa fa-save" type="submit">&nbsp;Save</button>
                    </div>
                </div>
            </form>
            <% }%>
            <br>
            <form action="jsp/insert_new_lab.jsp" method="post">
                <div class="card" id="new_lab_details">
                    <div class="card-header">
                        Insert Lab Data
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-5">
                                <label style="width:200px;">Lab Name:</label>&nbsp;<input type="text" id="lab_name1"
                                                                                          name="lab_name1"
                                                                                          value="<%=rs2.getString("lab_no")%>"
                                                                                          style="width:200px" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-5">
                                <label style="width:200px;">Time From:</label>&nbsp;<input type="time"
                                                                                           id="lab_from_time1"
                                                                                           name="lab_from_time1"
                                                                                           style="width:200px;"
                                                                                           required>
                            </div>
                            <div class="col-2"></div>
                            <div class="col-5">
                                <label style="width:200px;">Time To:</label>&nbsp;<input type="time" id="lab_to_time1"
                                                                                         name="lab_to_time1"
                                                                                         style="width:200px;" required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-5">
                                <label style="width:200px;">Day:</label>
                                <select id="lab_day1" name="lab_day1" style="width:200px;">
                                    <option>Monday</option>
                                    <option>Tuesday</option>
                                    <option>Wednesday</option>
                                    <option>Thursday</option>
                                    <option>Friday</option>
                                    <option>Saturday</option>
                                    <option>Sunday</option>
                                </select>
                            </div>
                            <div class="col-2"></div>
                            <div class="col-5">
                            </div>
                        </div>
                    </div>
                    <div class="card-footer" align="center">
                        <button class="btn btn-success" type="submit">Insert</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /.content-wrapper -->

</div>
<!-- /#wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>


<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin.min.js"></script>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<script>
    var i = 0;
    function enable1() {
        if (i == 0) {
            $('#lab_from_time').prop('readonly', false);
            $('#lab_to_time').prop('readonly', false);
            $('#lab_capacity').prop('readonly', false);
            $('#lab_mobile').prop('readonly', false);
            $('#lab_day').prop('readonly', false);
            i++;
        } else {
            $('#lab_from_time').prop('readonly', true);
            $('#lab_to_time').prop('readonly', true);
            $('#lab_capacity').prop('readonly', true);
            $('#lab_mobile').prop('readonly', true);
            $('#lab_day').prop('readonly', true);
            i--;

        }
    }


    function toscroll(e) {
        $([document.documentElement, document.body]).animate({
            scrollTop: $("#new_lab_details").offset().top - 60
        }, 1000);
    }
</script>

</body>

</html>
