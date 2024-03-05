<%--
<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>

<%
    if (request.getSession().getAttribute("user_name") == null) {
        response.sendRedirect("index.jsp");
    }
    try {
        String user = (String) session.getAttribute("user_name");
        Connection con = myDB.getCon();
        PreparedStatement stmt = con.prepareStatement("select * from teacher_info where mis_id=?");
        PreparedStatement stmt1 = con.prepareStatement("select count(event_id) from event_description where mis_id = ? and flag <> 0");
        stmt1.setString(1, user);
        ResultSet rs, rs1;
        stmt.setString(1, user);
        rs = stmt.executeQuery();
        rs1 = stmt1.executeQuery();
        rs1.next();
        String fuser = null;
        String muser = null;
        String luser = null;
        String email_id = null;
        String mob = null;

        if (rs.next()) {
            fuser = rs.getString("fname");
            muser = rs.getString("mname");
            luser = rs.getString("lname");
            email_id = rs.getString("email_id");
            mob = rs.getString("mob_no");

        }

        /*PreparedStatement stmt1 = con.prepareStatement("select * from seminar_time where  hall_no='A3-001' and from_time not IN ((select fm from hall_timeslot where no like '%A3-001%'))");
        ResultSet rs1 = stmt1.executeQuery();*/

        PreparedStatement stmt2 = con.prepareStatement("select * from seminar_time where hall_no='A1-004' and from_time not IN ((select fm from hall_timeslot where no like '%A1-004%'))");
        ResultSet rs2 = stmt2.executeQuery();

        PreparedStatement stmt3 = con.prepareStatement("select * from seminar_time where hall_no='A3-002' and from_time not IN ((select fm from hall_timeslot where no like '%A3-002%'))");
        ResultSet rs3 = stmt3.executeQuery();

        PreparedStatement stmt4 = con.prepareStatement("select * from seminar_time where hall_no='F-001' and from_time not IN ((select fm from hall_timeslot where no like '%F-001%'))");
        ResultSet rs4 = stmt4.executeQuery();
%>
<html>
<title>Booking</title>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/css/mdb.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js">

    <scrpit type="text/javascrpit" scr="https://code.jquery.com/jquery-3.3.1.js"></scrpit>


    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->

    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/js/mdb.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>

    <link rel="stylesheet" href="css/main.css">
</head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    html, body, h1, h2, h3, h4, h5, h6 {
        font-family: "Roboto", sans-serif
    }

    .mySlides {
        display: none;
    }

    .hide {
        display: none;
    }

    .tab {
        overflow: hidden;
        border: 1px solid #ccc;
        background-color: #f1f1f1;
    }

    /* Style the buttons inside the tab */
    .tab button {
        background-color: inherit;
        float: left;
        border: none;
        outline: none;
        cursor: pointer;
        padding: 14px 75px;
        transition: 0.3s;
        font-size: 17px;
    }

    /* Change background color of buttons on hover */
    .tab button:hover {
        background-color: #ddd;
    }

    /* Create an active/current tablink class */
    .tab button.active {
        background-color: #ccc;
    }

    /* Style the tab content */
    .tabcontent {
        /*display: none;*/
        padding: 6px 12px;
        border: 1px solid #ccc;
        border-top: none;
    }


</style>

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
            <li class="nav-item mt-2">
                <a href="jsp/user_book_history.jsp" id="alertsDropdown">
                    <i class=" fa fa-history fa-fw fa-lg"></i>
                    <span class="badge badge-danger"><%=rs1.getString(1)%></span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout.jsp" data-toggle="tooltip" title="LogOut"><i
                        class="fa fa-sign-out fa-rotate-180 fa-lg" aria-hidden="true"></i></a>
            </li>

            <!-- Dropdown -->
        </ul>
        <!-- Links -->
    </div>
    <!-- Collapsible content -->
</nav>


<!-- Page Container -->
<div class="w3-content w3-margin-top" style="max-width:1400px;margin-top: 20px">

    <!-- The Grid -->
    <div class="w3-row-padding" style="margin-top: 70px">

        <!-- Left Column -->
        <div class="w3-third" style="height: 400px;width: 350px">

            <div class="w3-white w3-text-grey w3-card-4" style="height:auto; min-height: 600px">
                <div class="w3-display-container">
                    <center>
                        <div>
                            <img class="w3-circle mt-2"
                                 src="data:image/png; base64,<%=Base64.getEncoder().encodeToString(rs.getBytes(8))%>"
                                 width="150" height="180"
                                 border="3"
                            />
                        </div>

                    </center>
                </div>

                <div class="w3-container">
                    <p>
                    <h2><%=fuser%> <%=muser%> <%=luser%>
                    </h2>
                    </p>

                    <p><i class="fa fa-key fa-fw w3-margin-right w3-large w3-text-teal"></i><%=user%>
                    </p>
                    <p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i><%=email_id%>
                    </p>
                    <p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i><%=mob%>
                    </p>
                    <hr>
                    <a href="jsp/user_book_history.jsp">
                        <button class="w3-large w3-text-theme" style="border: none;background: transparent"><b><i
                                class="fa fa-history fa-fw w3-margin-right w3-text-teal"></i>View History</b>
                        </button>
                    </a>
                    <br>
                    <br>

                    &lt;%&ndash;<a href="jsp/edit_teacher.jsp">&ndash;%&gt;
                    <button id="edit" class="w3-large" onclick="openForm()"
                            style="text-align: left;width: 100%;background: transparent;border: none"><b><i
                            class="fa fa-pencil fa-fw w3-margin-right w3-text-teal"></i>Update Personal Details</b>
                    </button>
                    <div class="form-popup" id="myForm1">
                        <form action="/updateTeacher" method="post" class="form-container"
                              enctype="multipart/form-data">

                            <label><b>Email</b></label>
                            <input class="w3-input" type="text" placeholder="Enter Email" name="email"
                                   value="<%=email_id%>">

                            <label><b>Mobile Number</b></label>
                            <input class="w3-input" type="text" placeholder="Enter Mobile" name="mobile"
                                   value="<%=mob%>">


                            <label><b>Password</b></label>
                            <input class="w3-input" type="password" placeholder="Enter Password" name="pass"
                                   value="<%=rs.getString("set_password")%>">

                            <label><b>Upload Photo</b></label>
                            <input type="file" name="pic">

                            <button type="submit" class="btn btn-outline-primary">Update</button>
                            <button type="button" class="btn cancel btn-outline-warning" onclick="closeForm()">Close
                            </button>
                        </form>
                    </div>
                    &lt;%&ndash;</a>&ndash;%&gt;
                    <br>
                    <br>
                </div>
            </div>
            <br>
            <!-- End Left Column -->
        </div>


        <!-- Right Column -->
        <div class="w3-twothird" style="width: 900px ">

            <!--images-->
            <div class="mySlides w3-display-container w3-center">
                <img src="img/pic3.jpg" style="width:100%;height: 350px;margin-right:80px;">
            </div>

            <div class="mySlides w3-display-container w3-center">
                <img src="img/pic5.JPG" style="width:100%;height: 350px;margin-right:80px;">
            </div>

            <div class="mySlides w3-display-container w3-center">
                <img src="img/pic4.jpeg" style="width:100%;height: 350px;margin-right:80px;">
            </div>

            <div class="mySlides w3-display-container w3-center">
                <img src="img/pic7.jpg" style="width:100%;height: 350px;margin-right:80px;">
            </div>

            <div class="mySlides w3-display-container w3-center">
                <img src="img/pic1.JPG" style="width:100%;height: 350px;margin-right:80px;">
            </div>
            <br><br>

            <!--End of images-->

            <div class="w3-container w3-card w3-white">

                <h2 class="w3-text-grey w3-padding-10"><i
                        class="fa fa-cube fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Book a Lab</h2>

                <!--Div for radio buttons-->
                <div class="row">
                    <div class="col-6">
                        <input type="radio" name="book" id="book_lab" value="book_lab"
                               onclick="show1();"><label><strong>Book a Lab</strong></label>
                    </div>
                    &lt;%&ndash;<div class="col-2"></div>&ndash;%&gt;
                    <div class="col-3">
                        <input type="radio" name="book" id="book_seminar" value="book_seminar"
                               onclick="show2();"><label><strong>Book Seminar Hall</strong></label>
                    </div>
                    <br>
                    <br>
                </div>


                <!--Div for booking lab-->
                <div id="lab_book" class="hide">
                    <div class="main" id="main">
                        <form id="myForm">
                            <div class="row">
                                <!--Search Button-->
                                <label>Search Labs by Date :</label>
                                <input class="my-input" type="date" name="date" id="date" required style="width: 200px">

                                <button class=" fa fa-search btn-primary" data-toggle="tooltip"
                                        style="border-radius: 50%; padding-left: 15px; padding-right: 15px"
                                        title="Search"
                                        type="submit">
                                </button>
                                <br/>
                                <span style="color: red;font-size: small" id="errdt"></span>


                            </div>
                        </form>
                    </div>


                    <!---Loads Search.jsp-->

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="container-fluid" id="lab_name"
                                 style="margin-top: 50px;margin-bottom: 50px; width: 95%; ">

                            </div>
                        </div>
                    </div>
                </div>
                <!--End of Div for booking labs-->


                <!--Div for booking seminar hall-->
                <div id="seminar_book" class="hide">
                    <div class="tab">
                        <button class="tablinks" onclick="openCity(event, 'it')">IT</button>
                        <button class="tablinks" onclick="openCity(event, 'comp')">COMPUTER</button>
                        <button class="tablinks" onclick="openCity(event, 'entc')">ENTC</button>
                        <button class="tablinks" onclick="openCity(event, 'audi')">AUDITORIUM</button>
                    </div>
                    <!----------------------------------------------------------------------------------->
                    <div id="it" class="tabcontent" style="display: none">
                        <div>
                            <form id="itform">
                                <div class="row ml-1">
                                    <h3>IT Seminar Hall</h3> <input type="text"
                                                                    style="background: transparent;font-size: 20px;border: none"
                                                                    value="A3-001" id="txt_it" name="txt_it">
                                </div>
                                <div class="row">

                                    <label>Search by Date :</label><input class="my-input" type="date" name="it_date"
                                                                          id="it_date" required style="width: 200px">
                                    <button type="submit" class="fa fa-search btn btn-primary"
                                    &lt;%&ndash;onclick="openEvent1(this)"&ndash;%&gt;></button>

                                </div>
                            </form>
                            <span style="color: red;font-size: small" id="errit"></span>
                        </div>

                        <div class="container-fluid" id="ittemp"
                             style=" margin-bottom: 50px; width: 95%; height:auto">
                            Available Slots<br>
                        </div>

                    </div>
                    <!----------------------------------------------------------------------------------->
                    <div id="comp" class="tabcontent" style="display: none">
                        <form action="/jsp/search_comp.jsp" method="post">
                            <div class="row ml-1">
                                <h3>Computer Seminar Hall</h3> <input type="text"
                                                                      style="background: transparent;font-size: 20px;border: none"
                                                                      value=" A1-004" id="txt_comp" name="txt_comp">
                            </div>
                            <div class="row">

                                <label>Search by Date :</label><input class="my-input" type="date" name="comp_date"
                                                                      id="comp_date" required style="width: 200px">
                                <button type="button" class="fa fa-search btn btn-primary" &lt;%&ndash;onclick="openEvent2(this)"&ndash;%&gt;>
                            </div>

                            <div id="comptemp">
                                <div class="mt-3 ml-1">
                                    <%
                                        while (rs2.next()) {
                                    %>

                                    <input type="checkbox" name="comp_hall" value="<%=rs2.getString("from_time")%>"
                                           name="<%=rs2.getString("from_time")%>"> <%=rs2.getString("from_time")%>
                                    - <%=rs2.getString("to_time")%><br/>
                                    <br>
                                    <% }%>
                                    <button class="btn btn-primary btn-success" type="submit">Book</button>
                                </div>
                            </div>
                        </form>
                        <span style="color: red;font-size: small" id="errcomp"></span>
                    </div>
                    <!----------------------------------------------------------------------------------->
                    <div id="entc" class="tabcontent" style="display: none">
                        <form action="/jsp/search_entc.jsp" method="post">
                            <div class="row ml-1">
                                <h3>ENTC Seminar Hall</h3> <input type="text"
                                                                  style="background: transparent;font-size: 20px;border: none"
                                                                  value=" A3-002" id="txt_entc" name="txt_entc">
                            </div>

                            <div class="row">

                                <label>Search by Date :</label><input class="my-input" type="date" name="entc_date"
                                                                      id="entc_date" required style="width: 200px">
                                <button type="button" class="fa fa-search btn btn-primary" onclick="openEvent3(this)">

                            </div>
                            <div id="entctemp">
                                <div class="mt-3 ml-1">
                                    <%

                                        while (rs3.next()) {

                                    %>

                                    <input type="checkbox" name="entc_hall" value="<%=rs3.getString("from_time")%>"
                                           name="<%=rs3.getString("from_time")%>"> <%=rs3.getString("from_time")%>
                                    - <%=rs3.getString("to_time")%><br/>
                                    <br>
                                    <% }%>
                                    <button class="btn btn-primary btn-success" type="submit">Book</button>
                                </div>
                            </div>
                        </form>
                        <span style="color: red;font-size: small" id="errentc"></span>
                    </div>
                    <!----------------------------------------------------------------------------------->
                    <div id="audi" class="tabcontent" style="display: none">
                        <form action="/jsp/search_audi.jsp" method="post">
                            <div class="row ml-1">
                                <h3>Auditorium</h3> <input type="text"
                                                           style="background: transparent;font-size: 20px;border: none"
                                                           value=" F-001" id="txt_audi" name="txt_audi">
                            </div>
                            <div class="row">

                                <label>Search by Date :</label><input class="my-input" type="date" name="audi_date"
                                                                      id="audi_date" required style="width: 200px">
                                <button type="button" class="fa fa-search btn btn-primary" onclick="openEvent4(this)">

                            </div>
                            <div id="auditemp">
                                <div class="mt-3 ml-1">
                                    <%

                                        while (rs4.next()) {

                                    %>

                                    <input type="checkbox" name="audi_hall" value="<%=rs4.getString("from_time")%>"
                                           name="<%=rs4.getString("from_time")%>"> <%=rs4.getString("from_time")%>
                                    - <%=rs4.getString("to_time")%><br/>
                                    <br>
                                    <% }%>
                                    <button class="btn btn-primary btn-success" type="submit">Book</button>
                                </div>
                            </div>
                        </form>
                        <span style="color: red;font-size: small" id="erraudi"></span>
                        <br>
                        &lt;%&ndash;TODO change the label of seminar hall as per database&ndash;%&gt;
                    </div>
                    <!--End of Div for booking seminar hall-->
                </div>

                <br><br>
                <div class="w3-container w3-card w3-white">

                    <div class="row" id="labs">


                    </div>

                    <!-- <div style="width: 100%; height:300px"></div>-->


                    <!-- End Right Column -->
                </div>

                <!-- End Grid -->
            </div>

            <!-- End Page Container -->
        </div>
    </div>

    <footer class="w3-container w3-teal w3-center w3-margin-top" style="max-height: 100px">
        <div style="height: 100px; max-height: 100px">

        </div>
    </footer>
        <%
        }catch (SQLException e){
        e.printStackTrace();
        }
%>


    <script type="text/javascript">

        $(function () {
            $("#myForm").submit(function (e) {
                e.preventDefault();


                var sendDate = document.getElementById('date').value;
                sendDate = new Date(Date.parse(sendDate.replace(/-/g, ' ')))
                var today = new Date();
                today.setHours(0, 0, 0, 0);

                if (sendDate < today) {
                    document.getElementById("errdt").innerHTML = "Please enter date greater than or equal to today!";
                    document.getElementById("lab_name").style.display = "none";
                }
                else {
                    document.getElementById("errdt").innerHTML = "";
                    $("#lab_name").load("jsp/search.jsp?" + $("#myForm").serialize());
                    document.getElementById("lab_name").style.display = "block";
                    if ($('#labs').length) {
                        $("#labs").hide();

                    }
                }
            });
        });


        document.getElementById("date").valueAsDate = new Date();
        document.getElementById("it_date").valueAsDate = new Date();
        document.getElementById("comp_date").valueAsDate = new Date();
        document.getElementById("entc_date").valueAsDate = new Date();
        document.getElementById("audi_date").valueAsDate = new Date();
    </script>


    <script type="text/javascript">
        $(function () {
            $("#itform").submit(function (e) {

                e.preventDefault();
                $("#ittemp").load("jsp/it.jsp?" + $("#itform").serialize());

            });

        });


    </script>


    <script>
        var myIndex = 0;
        carousel();

        function carousel() {
            var i;
            var x = document.getElementsByClassName("mySlides");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            myIndex++;
            if (myIndex > x.length) {
                myIndex = 1
            }
            x[myIndex - 1].style.display = "block";
            setTimeout(carousel, 4000); // Change image every 2 seconds
        }
    </script>
    <script>
        function openForm() {
            document.getElementById("myForm1").style.display = "block";
            // document.getElementById("edit").style.background="green";
            document.getElementById("edit").style.border = "thin solid #0000FF";
//            document.getElementById("edit").style.borderColor="green";

        }

        function closeForm() {
            document.getElementById("myForm1").style.display = "none";
            document.getElementById("edit").style.border = "0px";

        }
    </script>

    <script>
        document.onload = document.getElementById("myForm1").style.display = "none";
    </script>


    <!--Script to hide and show div's for labs and seminar hall-->
    <script type="text/javascript">

        function show1() {
            document.getElementById('lab_book').style.display = 'block';
            document.getElementById('seminar_book').style.display = 'none';
        }

        function show2() {
            document.getElementById('lab_book').style.display = 'none';
            document.getElementById('seminar_book').style.display = 'block';
        }

    </script>

    <!--script for seminar hall tabs-->
    <script>
        function openCity(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }


    </script>


</body>
</html>--%>


<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>

<%
    if (request.getSession().getAttribute("user_name") == null) {
        response.sendRedirect("index.jsp");
    }
    try {
        String user = (String) session.getAttribute("user_name");
        Connection con = myDB.getCon();
        PreparedStatement stmt = con.prepareStatement("select * from teachers where mis_id=?");
        PreparedStatement stmt1 = con.prepareStatement("select count(event_id) from events where mis_id = ? and flag <> 0");
        stmt1.setString(1, user);
        ResultSet rs, rs1;
        stmt.setString(1, user);
        rs = stmt.executeQuery();
        rs1 = stmt1.executeQuery();
        rs1.next();
        String fuser = null;
        String muser = null;
        String luser = null;
        String email_id = null;
        String mob = null;

        if (rs.next()) {
            fuser = rs.getString("fname");
            muser = rs.getString("mname");
            luser = rs.getString("lname");
            email_id = rs.getString("email_id");
            mob = rs.getString("mob_no");

        }

        /*PreparedStatement stmt1 = con.prepareStatement("select * from seminar_time where  hall_no='A3-001' and from_time not IN ((select fm from hall_timeslot where no like '%A3-001%'))");
        ResultSet rs1 = stmt1.executeQuery();*/

        PreparedStatement stmt2 = con.prepareStatement("select * from seminar_hall_time where hall_no='A1-004' and from_time not IN ((select from_time from booked_hall where hall_no like '%A1-004%'))");
        ResultSet rs2 = stmt2.executeQuery();

        PreparedStatement stmt3 = con.prepareStatement("select * from seminar_hall_time where hall_no='A3-002' and from_time not IN ((select from_time from booked_hall where hall_no like '%A3-002%'))");
        ResultSet rs3 = stmt3.executeQuery();

        PreparedStatement stmt4 = con.prepareStatement("select * from seminar_hall_time where hall_no='F-001' and from_time not IN ((select from_time from booked_hall where hall_no like '%F-001%'))");
        ResultSet rs4 = stmt4.executeQuery();
%>
<html>
<title>Booking</title>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/css/mdb.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js">

    <scrpit type="text/javascrpit" scr="https://code.jquery.com/jquery-3.3.1.js"></scrpit>


    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->

    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/js/mdb.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>

    <link rel="stylesheet" href="css/main.css">
</head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    html, body, h1, h2, h3, h4, h5, h6 {
        font-family: "Roboto", sans-serif
    }

    .mySlides {
        display: none;
    }

    .hide {
        display: none;
    }

    .tab {
        overflow: hidden;
        border: 1px solid #ccc;
        background-color: #f1f1f1;
    }

    /* Style the buttons inside the tab */
    .tab button {
        background-color: inherit;
        float: left;
        border: none;
        outline: none;
        cursor: pointer;
        padding: 14px 75px;
        transition: 0.3s;
        font-size: 17px;
    }

    /* Change background color of buttons on hover */
    .tab button:hover {
        background-color: #ddd;
    }

    /* Create an active/current tablink class */
    .tab button.active {
        background-color: #ccc;
    }

    /* Style the tab content */
    .tabcontent {
        /*display: none;*/
        padding: 6px 12px;
        border: 1px solid #ccc;
        border-top: none;
    }


</style>

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
            <li class="nav-item mt-2">
                <a href="jsp/user_book_history.jsp" id="alertsDropdown">
                    <i class=" fa fa-history fa-fw fa-lg"></i>
                    <span class="badge badge-danger"><%=rs1.getString(1)%></span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout.jsp" data-toggle="tooltip" title="LogOut"><i
                        class="fa fa-sign-out fa-rotate-180 fa-lg" aria-hidden="true"></i></a>
            </li>

            <!-- Dropdown -->
        </ul>
        <!-- Links -->
    </div>
    <!-- Collapsible content -->
</nav>


<!-- Page Container -->
<div class="w3-content w3-margin-top" style="max-width:1400px;margin-top: 20px">

    <!-- The Grid -->
    <div class="w3-row-padding" style="margin-top: 70px">

        <!-- Left Column -->
        <div class="w3-third" style="height: 400px;width: 350px">

            <div class="w3-white w3-text-grey w3-card-4" style="height:auto; min-height: 600px">
                <div class="w3-display-container">
                    <center>
                        <div>
                            <%
                                if(rs.getBytes(8)==null){
                                    out.print("<img class='w3-circle mt-2' src='/img/default.png' width='150' height='180' border='3'>");
                                }else{%>

                                    <%--out.print("<img class='w3-circle mt-2' src='data:image/png; base64,"+Base64.getEncoder().encodeToString(rs.getBytes(8))+"width='150' height='180' border='3' />");--%>
                                <%--}--%>
                            <img class="w3-circle mt-2"
                                 src="data:image/png; base64,<%=Base64.getEncoder().encodeToString(rs.getBytes(8))%>"
                                 width="150" height="180"
                                 border="3"
                            />
                            <%
                                }
                            %>


                        </div>

                    </center>
                </div>

                <div class="w3-container">
                    <p>
                    <h2><%=fuser%> <%=muser%> <%=luser%>
                    </h2>
                    </p>

                    <p><i class="fa fa-key fa-fw w3-margin-right w3-large w3-text-teal"></i><%=user%>
                    </p>
                    <p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i><%=email_id%>
                    </p>
                    <p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i><%=mob%>
                    </p>
                    <hr>
                    <a href="jsp/user_book_history.jsp">
                        <button class="w3-large w3-text-theme" style="border: none;background: transparent"><b><i
                                class="fa fa-history fa-fw w3-margin-right w3-text-teal"></i>View History</b>
                        </button>
                    </a>
                    <br>
                    <br>

                    <%--<a href="jsp/edit_teacher.jsp">--%>
                    <button id="edit" class="w3-large" onclick="openForm()"
                            style="text-align: left;width: 100%;background: transparent;border: none"><b><i
                            class="fa fa-pencil fa-fw w3-margin-right w3-text-teal"></i>Update Personal Details</b>
                    </button>
                    <div class="form-popup" id="myForm1">
                        <form action="/updateTeacher" method="post" class="form-container"
                              enctype="multipart/form-data">

                            <label><b>Email</b></label>
                            <input class="w3-input" type="text" placeholder="Enter Email" name="email"
                                   value="<%=email_id%>">

                            <label><b>Mobile Number</b></label>
                            <input class="w3-input" type="text" placeholder="Enter Mobile" name="mobile"
                                   value="<%=mob%>">


                            <label><b>Password</b></label>
                            <input class="w3-input" type="password" placeholder="Enter Password" name="pass"
                                   value="<%=rs.getString("password")%>">

                            <label><b>Upload Photo</b></label>
                            <input type="file" name="pic">

                            <button type="submit" class="btn btn-outline-primary">Update</button>
                            <button type="button" class="btn cancel btn-outline-warning" onclick="closeForm()">Close
                            </button>
                        </form>
                    </div>
                    <%--</a>--%>
                    <br>
                    <br>
                </div>
            </div>
            <br>
            <!-- End Left Column -->
        </div>


        <!-- Right Column -->
        <div class="w3-twothird" style="width: 900px ">

            <!--images-->
            <div class="mySlides w3-display-container w3-center">
                <img src="img/pic3.jpg" style="width:100%;height: 350px;margin-right:80px;">
            </div>

            <div class="mySlides w3-display-container w3-center">
                <img src="img/pic5.JPG" style="width:100%;height: 350px;margin-right:80px;">
            </div>

            <div class="mySlides w3-display-container w3-center">
                <img src="img/pic4.jpeg" style="width:100%;height: 350px;margin-right:80px;">
            </div>

            <div class="mySlides w3-display-container w3-center">
                <img src="img/pic7.jpg" style="width:100%;height: 350px;margin-right:80px;">
            </div>

            <div class="mySlides w3-display-container w3-center">
                <img src="img/pic1.JPG" style="width:100%;height: 350px;margin-right:80px;">
            </div>
            <br><br>

            <!--End of images-->

            <div class="w3-container w3-card w3-white">

                <h2 class="w3-text-grey w3-padding-10"><i
                        class="fa fa-cube fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Book a Lab</h2>

                <!--Div for radio buttons-->
                <div class="row">
                    <div class="col-6">
                        <input type="radio" name="book" id="book_lab" value="book_lab"
                               onclick="show1();"><label><strong>Book a Lab</strong></label>
                    </div>
                    <%--<div class="col-2"></div>--%>
                    <div class="col-3">
                        <input type="radio" name="book" id="book_seminar" value="book_seminar"
                               onclick="show2();"><label><strong>Book Seminar Hall</strong></label>
                    </div>
                    <br>
                    <br>
                </div>


                <!--Div for booking lab-->
                <div id="lab_book" class="hide">
                    <div class="main" id="main">
                        <form id="myForm">
                            <div class="row">
                                <!--Search Button-->
                                <label>Search Labs by Date :</label>
                                <input class="my-input" type="date" name="date" id="date" required style="width: 200px">

                                <button class=" fa fa-search btn-primary" data-toggle="tooltip"
                                        style="border-radius: 50%; padding-left: 15px; padding-right: 15px"
                                        title="Search"
                                        type="submit">

                                </button>
                                <br>

                            </div>
                            <span id="errdt" style="color: red;font-size: medium;"></span>
                        </form>
                    </div>


                    <!---Loads Search.jsp-->

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="container-fluid" id="lab_name"
                                 style="margin-top: 50px;margin-bottom: 50px; width: 95%; ">

                            </div>
                        </div>
                    </div>
                </div>
                <!--End of Div for booking labs-->


                <!--Div for booking seminar hall-->
                <div id="seminar_book" class="hide">
                    <div class="tab">
                        <button class="tablinks" onclick="openHall(event, 'it')">IT</button>
                        <button class="tablinks" onclick="openHall(event, 'comp')">COMPUTER</button>
                        <button class="tablinks" onclick="openHall(event, 'entc')">ENTC</button>
                        <button class="tablinks" onclick="openHall(event, 'audi')">AUDITORIUM</button>
                    </div>
                    <!----------------------------------------------------------------------------------->
                    <div id="it" class="tabcontent" style="display: none">
                        <div>
                            <form id="itform">
                                <div class="row ml-1">
                                    <h3>IT Seminar Hall</h3> <input type="text"
                                                                    style="background: transparent;font-size: 20px;border: none"
                                                                    value="A3-001" id="txt_it" name="txt_it">
                                </div>
                                <div class="row">

                                    <label>Search by Date :</label><input class="my-input" type="date" name="it_date"
                                                                          id="it_date" required style="width: 200px">
                                    <button type="submit" class="fa fa-search btn btn-primary"></button>

                                </div>
                            </form>
                            <span id="errit" style="color: red;font-size: medium;"></span>
                        </div>

                        <div class="container-fluid" id="ittemp"
                             style=" margin-bottom: 50px; width: 95%; height:auto">

                        </div>

                    </div>
                    <!----------------------------------------------------------------------------------->
                    <div id="comp" class="tabcontent" style="display: none">
                        <div>
                            <form id="compform">
                                <div class="row ml-1">
                                    <h3>Computer Seminar Hall</h3> <input type="text"
                                                                          style="background: transparent;font-size: 20px;border: none"
                                                                          value=" A1-004" id="txt_comp" name="txt_comp">
                                </div>
                                <div class="row">

                                    <label>Search by Date :</label><input class="my-input" type="date" name="comp_date"
                                                                          id="comp_date" required style="width: 200px">
                                    <button type="submit" class="fa fa-search btn btn-primary"></button>
                                </div>

                            </form>
                            <span id="errcomp" style="color: red;font-size: medium;"></span>
                        </div>
                        <div class="container-fluid" id="comptemp"
                             style=" margin-bottom: 50px; width: 95%; height:auto">

                        </div>
                    </div>
                    <!----------------------------------------------------------------------------------->
                    <div id="entc" class="tabcontent" style="display: none">
                        <div>
                            <form id="entcform">
                                <div class="row ml-1">
                                    <h3>ENTC Seminar Hall</h3> <input type="text"
                                                                      style="background: transparent;font-size: 20px;border: none"
                                                                      value=" A3-002" id="txt_entc" name="txt_entc">
                                </div>

                                <div class="row">

                                    <label>Search by Date :</label><input class="my-input" type="date" name="entc_date"
                                                                          id="entc_date" required style="width: 200px">
                                    <button type="submit" class="fa fa-search btn btn-primary"></button>

                                </div>
                            </form>
                            <span id="errentc" style="color: red;font-size: medium;"></span>
                        </div>
                        <div class="container-fluid" id="entctemp"
                             style=" margin-bottom: 50px; width: 95%; height:auto">

                        </div>
                    </div>
                    <!----------------------------------------------------------------------------------->
                    <div id="audi" class="tabcontent" style="display: none">
                        <div>
                            <form id="audiform">
                                <div class="row ml-1">
                                    <h3>Auditorium</h3> <input type="text"
                                                               style="background: transparent;font-size: 20px;border: none"
                                                               value=" F-001" id="txt_audi" name="txt_audi">
                                </div>
                                <div class="row">

                                    <label>Search by Date :</label><input class="my-input" type="date" name="audi_date"
                                                                          id="audi_date" required style="width: 200px">
                                    <button type="submit" class="fa fa-search btn btn-primary"></button>

                                </div>
                            </form>
                            <span id="erraudi" style="color: red;font-size: medium;"></span>
                        </div>
                        <div class="container-fluid" id="auditemp"
                             style=" margin-bottom: 50px; width: 95%; height:auto">

                        </div>
                    </div>
                    <!----------------------------------------------------------------------------------->
                    <!--End of Div for booking seminar hall-->
                </div>

                <br><br>
                <div class="w3-container w3-card w3-white">

                    <div class="row" id="labs">


                    </div>

                    <!-- <div style="width: 100%; height:300px"></div>-->


                    <!-- End Right Column -->
                </div>

                <!-- End Grid -->
            </div>

            <!-- End Page Container -->
        </div>
    </div>

    <footer class="w3-container w3-teal w3-center w3-margin-top" style="max-height: 100px">
        <div style="height: 100px; max-height: 100px">

        </div>
    </footer>
        <%
        }catch (SQLException e){
        e.printStackTrace();
        }
%>


    <script type="text/javascript">
        $(function () {
            $("#myForm").submit(function (e) {
                e.preventDefault();


                var sendDate = document.getElementById('date').value;
                sendDate = new Date(Date.parse(sendDate.replace(/-/g, ' ')))
                var today = new Date();
                today.setHours(0, 0, 0, 0);

                if (sendDate < today) {
                    document.getElementById("errdt").innerHTML = "Please enter date greater than or equal to today!";
                    document.getElementById("lab_name").style.display = "none";
                }
                else {
                    document.getElementById("errdt").innerHTML = "";
                    $("#lab_name").load("jsp/search.jsp?" + $("#myForm").serialize());
                    document.getElementById("lab_name").style.display = "block";
                    if ($('#labs').length) {
                        $("#labs").hide();

                    }
                }
            });
        });

        document.getElementById("date").valueAsDate = new Date();
        document.getElementById("it_date").valueAsDate = new Date();
        document.getElementById("comp_date").valueAsDate = new Date();
        document.getElementById("entc_date").valueAsDate = new Date();
        document.getElementById("audi_date").valueAsDate = new Date();
    </script>


    <script type="text/javascript">
        $(function () {
            $("#itform").submit(function (e) {
                e.preventDefault();

                var sendDate = document.getElementById('it_date').value;
                sendDate = new Date(Date.parse(sendDate.replace(/-/g, ' ')))
                var today = new Date();
                today.setHours(0, 0, 0, 0);

                if (sendDate < today) {
                    document.getElementById("errit").innerHTML = "Please enter date greater than or equal to today!";
                    document.getElementById("ittemp").style.display = "none";
                }
                else {
                    document.getElementById("errit").innerHTML = "";
                    $("#ittemp").load("jsp/it.jsp?" + $("#itform").serialize());
                    document.getElementById("ittemp").style.display = "block";

                }

            });

        });


    </script>

    <script type="text/javascript">
        $(function () {
            $("#compform").submit(function (e) {
                e.preventDefault();

                var sdt = document.getElementById('comp_date').value;
                sdt = new Date(Date.parse(sdt.replace(/-/g, ' ')))
                var today = new Date();
                today.setHours(0, 0, 0, 0);

                if (sdt < today) {
                    document.getElementById("errcomp").innerHTML = "Please enter date greater than or equal to today!";
                    document.getElementById("comptemp").style.display = "none";
                }
                else {
                    document.getElementById("errcomp").innerHTML = "";
                    $("#comptemp").load("jsp/comp.jsp?" + $("#compform").serialize());
                    document.getElementById("comptemp").style.display = "block";

                }

            });

        });


    </script>

    <script type="text/javascript">
        $(function () {
            $("#entcform").submit(function (e) {
                e.preventDefault();

                var sdt = document.getElementById('entc_date').value;
                sdt = new Date(Date.parse(sdt.replace(/-/g, ' ')))
                var today = new Date();
                today.setHours(0, 0, 0, 0);

                if (sdt < today) {
                    document.getElementById("errentc").innerHTML = "Please enter date greater than or equal to today!";
                    document.getElementById("entctemp").style.display = "none";
                }
                else {
                    document.getElementById("errentc").innerHTML = "";
                    $("#entctemp").load("jsp/entc.jsp?" + $("#entcform").serialize());
                    document.getElementById("entctemp").style.display = "block";

                }

            });

        });


    </script>

    <script type="text/javascript">
        $(function () {
            $("#audiform").submit(function (e) {
                e.preventDefault();

                var sdt = document.getElementById('audi_date').value;
                sdt = new Date(Date.parse(sdt.replace(/-/g, ' ')))
                var today = new Date();
                today.setHours(0, 0, 0, 0);

                if (sdt < today) {
                    document.getElementById("erraudi").innerHTML = "Please enter date greater than or equal to today!";
                    document.getElementById("auditemp").style.display = "none";
                }
                else {
                    document.getElementById("erraudi").innerHTML = "";
                    $("#auditemp").load("jsp/audi.jsp?" + $("#audiform").serialize());
                    document.getElementById("auditemp").style.display = "block";

                }

            });

        });


    </script>


    <script>
        var myIndex = 0;
        carousel();

        function carousel() {
            var i;
            var x = document.getElementsByClassName("mySlides");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            myIndex++;
            if (myIndex > x.length) {
                myIndex = 1
            }
            x[myIndex - 1].style.display = "block";
            setTimeout(carousel, 4000); // Change image every 2 seconds
        }
    </script>
    <script>
        function openForm() {
            document.getElementById("myForm1").style.display = "block";
            // document.getElementById("edit").style.background="green";
            document.getElementById("edit").style.border = "thin solid #0000FF";
//            document.getElementById("edit").style.borderColor="green";

        }

        function closeForm() {
            document.getElementById("myForm1").style.display = "none";
            document.getElementById("edit").style.border = "0px";

        }
    </script>

    <script>
        document.onload = document.getElementById("myForm1").style.display = "none";
    </script>


    <!--Script to hide and show div's for labs and seminar hall-->
    <script type="text/javascript">

        function show1() {
            document.getElementById('lab_book').style.display = 'block';
            document.getElementById('seminar_book').style.display = 'none';
        }

        function show2() {
            document.getElementById('lab_book').style.display = 'none';
            document.getElementById('seminar_book').style.display = 'block';
        }

    </script>

    <!--script for seminar hall tabs-->
    <script>
        function openHall(evt, hallName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(hallName).style.display = "block";
            evt.currentTarget.className += " active";
        }


    </script>


</body>
</html>