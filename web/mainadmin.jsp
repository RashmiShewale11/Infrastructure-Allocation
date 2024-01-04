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
    <style>
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: #474e5d;
            padding-top: 50px;
        }
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
        }
        .close {
            position: absolute;
            right: 35px;
            top: 15px;
            font-size: 40px;
            font-weight: bold;
            color: #f1f1f1;
        }

        .close:hover,
        .close:focus {
            color: #f44336;
            cursor: pointer;
        }

        /* Clear floats */
        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }
    </style>
</head>

<%
    Connection con = myDB.getCon();
%>

<body id="page-top">
<nav class="navbar navbar-expand navbar-dark bg-dark fixed-top">
    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>
    <a class="navbar-brand mr-1" href="admin.jsp">Welcome Admin !</a>

    <a class="ml-auto" href="logout.jsp"><i class="fas fa-sign-out-alt"></i></a>
</nav>


<div align="center">
    <br><br><br>
    <div class="card mb-3">
        <div class="card-header">Details
            <button style="margin-left: 200px" class="btn" onclick="toscroll()"><a href="#"><i class="fa fa-plus-square" aria-hidden="true"></i></a></button>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table id="tab1" class="table table-bordered" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Assistant_id</th>
                        <th>Name</th>
                        <th>Mobile No</th>
                        <th>Mail Id</th>
                        <th>Password</th>
                        <th>Lab_No</th>
                        <th>Edit/Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        try {
                            //Connection con = myDB.getCon();
                            if (con != null) {
                                PreparedStatement stmt = con.prepareStatement("select * from assistant_info inner join lab_details detail on assistant_info.assistant_id = detail.assistant_id");
                                ResultSet rs = stmt.executeQuery();
                                while (rs.next()) {
                                        out.print("<tr>");
                                        out.print("<td>");
                                        out.print(rs.getString("assistant_id"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(rs.getString("assistant_name"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(rs.getString("mob_no"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(rs.getString("email"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(rs.getString("password"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(rs.getString("detail.lab_no"));
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print("<button type='button' class=' fa fa-edit btn btn-success' onclick='openEvent1(this)' data-eid1='" + rs.getString("assistant_id") + "'></button> ");
                                        out.println("&nbsp");
                                        //out.print("<button type='button' class=' fa fa-trash btn btn-danger' onclick='openEvent2(this)' data-eid2='" + rs.getString("assistant_id") + "'></button>");
                                        //TODO delete option
                                        out.print("</td>");
                                        out.print("</tr>");
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
<br><br>
<div class="container-fluid" id="insert_assistant" style="box-shadow: 20px 20px 20px #888888; width:820px; height:auto;">
    <form method="post" action="/jsp/insert_lab_assistant.jsp">
        <div class="row mt-2">
            <div class="col-md-6">
                <label class="mylabel">Assistant Id</label>
            </div>
            <div class="col-md-6">
                <input type="text" id="id" name="id">
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-6">
                <label class="mylabel">Assistant Name</label>
            </div>
            <div class="col-md-6">
                <input type="text" id="name" name="name">
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-6">
                <label class="mylabel">Mobile Number</label>
            </div>
            <div class="col-md-6">
                <input type="tel" id="mob_no" maxlength="10" name="mob_no">
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-6">
                <label class="mylabel">Mail ID</label>
            </div>
            <div class="col-md-6">
                <input type="email" id="email" name="email">
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-6">
                <label class="mylabel">Password</label>
            </div>
            <div class="col-md-6">
                <input type="password" id="password" name="password">
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-6">
                <label class="mylabel">Lab_ID</label>
            </div>
            <div class="col-md-6">
                <input type="text" id="lab_id1" name="lab_id1">
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-6">
                <label class="mylabel">Capacity</label>
            </div>
            <div class="col-md-6">
                <input type="text" id="capacity1" name="capacity1">
            </div>
        </div>
        <div class="row mt-2">
        <div class="col-md-6">
            <label class="mylabel">Department</label>
        </div>
        <div class="col-md-6">
            <select name="dept1" class="custom-select" id="dept1" required>
                <option value="2">Computer Technology</option>
                <option value="1">Information Technology</option>
                <option value="3">Electronics and TeleCommunication</option>
            </select>
        </div>
        </div>
        <br>
        <div>
            <center><button class="btn btn-success">Insert</button></center>
        </div>
    </form>
</div>
<br><br><br>
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

<!-- For Edit Information-->
<div id="edit1" class="modal ml-auto mr-auto">
    <span onclick="document.getElementById('edit1').style.display='none'" class="close" title="Close Modal">&times;</span>
    <form class="modal-content" action="/jsp/edit_assistant.jsp" method="post" style="width: 600px; height:500px;">
        <div class="container " align="center" >
            <h1 align="center">Edit</h1>
            <p>Edit Information of Lab_assistant</p>
            <hr>
            <label style="width: 200px;text-align: left;"><b>Assistant_id</b></label>
            <input type="text" placeholder="Enter Assistant_id" name="assistant_id1" id="assistant_id1" value="" readonly required>
            <br><br>
            <label style="width: 200px;text-align: left;"><b>Name</b></label>
            <input type="text" placeholder="Enter Name" name="assistant_name1" id="assistant_name1" required>
            <br><br>
            <label style="width: 200px; text-align: left;"><b>Mobile Number</b></label>
            <input type="tel" placeholder="Enter Mobile Number" name="mob_no1" id="mob_no1" maxlength="10" required>
            <br><br>
            <label style="width: 200px;text-align: left;"><b>Mail ID</b></label>
            <input type="text" placeholder="Enter Email" name="email1" id="email1" required>
            <br><br>
            <label style="width: 200px;text-align: left;"><b>Password</b></label>
            <input type="password" placeholder="Enter password" name="password1" id="password1" required>
            <br><br>
            <div class="clearfix">
                <button type="submit" class="btn btn-success fa fa-save">Save</button>
                <button type="button" onclick="document.getElementById('edit1').style.display='none'" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </form>
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
        $('#tab1').DataTable();
    });

    function openEvent1(e) {

        var no1 = $(e).data("eid1");
        document.getElementById('edit1').style.display='block'
        document.getElementById("assistant_id1").value=no1;
        console.log("assistant_id" + no1);
        //window.location = "jsp/edit_assistant.jsp?assistant_id=" + no1;
    }

    // function openEvent2(e) {
    //
    //     var no2 = $(e).data("eid2");
    //     console.log("assistant_id" + no2);
    //     window.location = "/jsp/delete_assistant.jsp?assistant_id=" + no2;
    //
    // }

    function toscroll(e) {
        $([document.documentElement, document.body]).animate({
            scrollTop: $("#insert_assistant").offset().top - 60
        }, 1000);
    }

    // Get the modal
    var modal = document.getElementById('edit1');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }


</script>


</body>

</html>
