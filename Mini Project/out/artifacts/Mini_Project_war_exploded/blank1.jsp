<%@ page import="java.sql.Connection" %>
<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
    if (request.getSession().getAttribute("user_name") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">

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
    Connection con= myDB.getCon();

    String user = (String) session.getAttribute("user_name");


    PreparedStatement stmt=con.prepareStatement("select * from assistant where assistant_id=?");
    stmt.setString(1,user);

    ResultSet rs=stmt.executeQuery();
    String name=null;
    String mob=null;
    String email=null;

    while(rs.next())
    {
        name=rs.getString("assistant_name");
        mob=rs.getString("mob_no");
        email=rs.getString("email");
    }

%>


<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>

    <a class="navbar-brand mr-1" href="admin.jsp">Welcome <%=name%> !</a>
    <a class="ml-auto" href="logout.jsp"><i class="fas fa-sign-out-alt"></i></a>

    <!-- Navbar -->

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
                <li class="breadcrumb-item active">Update User Details</li>
            </ol>

            <!-- Page Content -->
            <h1>Update User Details</h1>
            <hr>
            <form action="/updateUser" method="post">
                <div class="card">
                    <div class="card-header">
                        Update the Personal
                    </div>
                    <div class="card-body">
                    </div>
                    <div class="card-header">
                        <div class="row mb-1">
                            <div class="col-3">
                                <label> MIS ID :</label>&nbsp;<input type="text" id="mis_id" name="mis_id" value="<%=user%>" readonly>
                            </div>
                            <div class="col-3">
                                <label> Name :</label>&nbsp;<input type="text" id="nm" name="nm" value="<%=name%>" readonly>
                            </div>
                            <div class="col-3">
                                <label>Mobile No. :</label>&nbsp;<input type="text" id="mn" name="mn" value="<%=mob%>" readonly>
                            </div>
                            <div class="col-3">
                                <label>E-Mail :</label>&nbsp;<input type="text" id="mail" name="mail" value="<%=email%>" readonly>
                            </div>
                        </div><br>
                        <button class="btn btn-primary fa fa-edit" id="edit" type="button" onclick="enable()">
                            &nbsp;Edit
                        </button>
                        <button class="btn btn-success fa fa-save" type="submit">&nbsp;Save</button>
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
<script>
    var i = 0;
    $('#edit').click(function () {
        if (i == 0) {
            $('#nm').prop('readonly', false);
            $('#mn').prop('readonly', false);
            $('#mail').prop('readonly', false);
            i++;
        } else {
            $('#nm').prop('readonly', true);
            $('#mn').prop('readonly', true);
            $('#mail').prop('readonly', true);
            i--;

        }
    });
</script>


</body>

</html>
