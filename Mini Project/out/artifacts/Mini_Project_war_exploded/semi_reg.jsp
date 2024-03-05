<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: shubham
  Date: 14/10/18
  Time: 3:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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

    /* Extra styles for the cancel button */
    .cancelbtn {
        padding: 14px 20px;
        background-color: #f44336;
    }

    .signupbtn {
        padding: 14px 20px;
        background-color: #4CAF50;
    }

    /* Float cancel and signup buttons and add an equal width */
    .cancelbtn, .signupbtn {

        width: 25%;
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

    .clearfix::after {
        content: "";
        clear: both;
        display: table;
    }

    hr {
        border: 1px solid #009688;
        margin-bottom: 25px;

    }

</style>
</head>
<body>

<%
    String hall_no = request.getParameter("hall_no1");
    String arr[] = request.getParameterValues("hall");
    //session.setAttribute("timeslots",arr);


    String tm = null;

    for (String s : arr)
        tm = s;

    //System.out.println(tm);
    DateFormat t = new SimpleDateFormat("hh:mm:ss");
    Date dt = t.parse(tm);
    String s;

    int hr = dt.getHours();
    System.out.println("HRS: " + hr);
    hr = hr + 1;
    System.out.println("HRS: " + hr);
    if (hr == 9)
        s = "0" + hr + ":0" + String.valueOf(dt.getMinutes()) + ":0" + String.valueOf(dt.getSeconds());
    else if(hr==1)
        s = "13" + ":0" + String.valueOf(dt.getMinutes()) + ":0" + String.valueOf(dt.getSeconds());
    else
        s = hr + ":0" + String.valueOf(dt.getMinutes()) + ":0" + String.valueOf(dt.getSeconds());
    //Date dt1=dt.

%>

<div id="registration">
    <%--<span style="margin-top: 50px;" class="close"--%>
    <%--title="Close">&times;</span>--%>
    <form class="modal-content" method="post" action="/jsp/reg.jsp" style="border:1px solid #ccc;width: 600px">
        <div class="container" style="width: 550px">
            <h1 align="center"><strong>REGISTRATION FORM</strong></h1>
            <hr>

            <!--Lab_name-->
            <div class="form-group" align="left">
                <label><strong>Seminar Hall Number:</strong></label>
                <input type="text" id="lab_name" name="lab_name"
                       value="<%=hall_no%>"
                       style="width:150px;" readonly>
            </div>

            <div class="row">

                <div class="col-md-4">
                    <div class="form-group" align="left">
                        <label><strong>Start Date</strong></label>
                        <input type="date" value="<%=session.getAttribute("datee")%>" name="start_dt"
                               style="width: 150px;" readonly>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group" align="left">
                        <label> <strong>From</strong></label>&nbsp;<input type="time" name="start_time"
                                                                          style="width: 150px;"
                                                                          value="<%=arr[0]%>" readonly>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group" align="left">
                        <label><strong>To</strong></label>&nbsp;<input type="time" name="end_time" style="width: 150px;"
                                                                       value="<%=s%>" readonly><br>
                    </div>
                </div>

            </div>

            <div class="form-group" align="left">
                <label for="eventname"><strong>Event Name</strong></label><input type="text" class="form-control"
                                                                                 id="eventname"
                                                                                 placeholder="Enter Event Name"
                                                                                 style="width:250px;"
                                                                                 name="eventname" required>
            </div>
            <hr>
            <!--End of Upper Part-->

            <h4 style="color: #6c757d">Student Co-ordinate Information</h4><br>
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group" align="left">
                        <label for="studrn" class="required"><strong>Roll Number</strong></label>
                        <input type="tel" class="form-control" id="studrn" placeholder="Roll Number"
                               name="studrn" style="width:150px;" required>
                    </div>
                </div>
                <div class="col-md-2"></div>
                <div class="col-md-7">
                    <div class="form-group" align="left">
                        <label><strong>Name</strong></label>
                        <input type="text" class="form-control" id="studname" placeholder="Enter Name"
                               name="studname" style="width:250px;" required>
                    </div>
                </div>
            </div>


            <div class="form-group" align="left">
                <label for="studmail"><strong>Mail</strong></label>
                <input type="email" class="form-control" id="studmail" placeholder="Enter Mail"
                       name="studmail"
                       style="width:400px;" required>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group" align="left">
                        <label for="studmn"><strong>Mobile Number</strong></label>
                        <input type="tel" class="form-control" id="studmn" placeholder="Enter Mobile Number"
                               name="studmn" style="width:200px;" maxlength="10" required>
                    </div>
                </div>
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <div class="form-group" align="left">
                        <label><strong>Department</strong></label>
                        <select name="dept" class="custom-select" required>
                            <option value="Computer Technology">Computer Technology</option>
                            <option value="Information  Technology">Information Technology</option>
                            <option value="Electronics and TeleCommunication">Electronics and
                                TeleCommunication
                            </option>
                        </select>
                    </div>
                </div>
            </div>

            <h4 align="center" style="color: #6c757d">Event Details</h4><br>

            <div class="form-group" align="left">
                <label><strong>Description</strong></label><br>
                <textarea rows="5" cols="48"
                          placeholder="Enter full description about the event (No of attendees,organizers etc)."
                          name="descp"></textarea>
            </div>


            <div class="clearfix">
                <center>
                    <button onclick="alertbox()" class="cancelbtn btn-danger ml-auto "><strong>Cancel</strong>
                    </button>
                    <button type="submit" class=" btn-success signupbtn ml-auto "><strong>Request</strong></button>
                </center>
            </div>
        </div>

    </form>
</div>

<script>
    function alertbox() {
        if (confirm("All changes will lost!")) document.location = "/booking.jsp";
    }
</script>
</body>
</html>