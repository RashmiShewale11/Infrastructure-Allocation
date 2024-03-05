<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String dt = (String) session.getAttribute("date");
    //  out.print(dt);
    System.out.println(dt);
%>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="css/main.css">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/css/mdb.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <style>
        body {
            font-family: "Arial";
            color: #fff;
        }

    </style>
    <title>Form</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>

<nav class="navbar navbar-expand-lg navbar-dark primary-color fixed-top">

    <!-- Navbar brand -->
    <a class="navbar-brand" href="#"><i class="fa fa-institution" aria-hidden="true"></i>&nbsp;INFRASTRUCTURE ALLOCATION
    </a>

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
                <a class="nav-link" href="logout.jsp" data-toggle="tooltip" title="LogOut"><i
                        class="fa fa-sign-out fa-rotate-180 fa-lg" aria-hidden="true"></i></a>
            </li>
            <!-- Dropdown -->
        </ul>
        <!-- Links -->
    </div>
    <!-- Collapsible content -->
</nav>
<body style="background-color: #e0e3e7">
<div class="container-fluid" padding-left="100px" style="margin-top: 90px;">


    <div class="card-wrapper" style="width:550px; margin-left: 30%; margin-top:20px; margin-bottom: 20px; ">

        <div class="card-fat" style="background-color:white;">
            <div class="card-header" style="background-color: #199bbd;">
                <h2 align="center" style="color: black;">Registration Form</h2>
            </div>
            <div class="card-body" align="center">
                <form action="jsp/reg.jsp" method="post">
                    <div class="form-group" align="left">

                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group" align="left">
                                    <label>Lab Name:</label>
                                    <input type="text" id="lab_name" name="lab_name"
                                           value="<%=request.getParameter("lb")%>"
                                           style="width:150px;" readonly>
                                </div>
                            </div>
                            <div class="col-md-2"></div>
                            <div class="col-md-4">
                                <div class="form-group" align="left">
                                    <label>Start Date</label>
                                    <input type="date" value="<%=dt%>" name="start_dt" style="width: 150px;" readonly>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group" align="left">
                                    <label> From</label><br>
                                    <input type="time" name="start_time" style="width: 150px;"
                                           value="<%=request.getParameter("std")%>" readonly>
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-4">
                                <div class="form-group" align="left">
                                    <label>To</label><br>
                                    <input type="time" name="end_time" style="width: 150px;"
                                           value="<%=request.getParameter("etd")%>" readonly><br>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-7">
                                <div class="form-group" align="left">
                                    <label for="eventname">Event Name</label><input type="text" class="form-control"
                                                                                    id="eventname"
                                                                                    placeholder="Enter Event Name"
                                                                                    style="width:250px;"
                                                                                    name="eventname" required>
                                </div>
                            </div>
                        </div>

                        <h4 style="color: #6c757d">Student Co-ordinate Information</h4><br>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group" align="left">
                                    <label for="studrn" class="required">Roll Number</label>
                                    <input type="tel" class="form-control" id="studrn" placeholder="Roll Number"
                                           name="studrn" style="width:150px;" required>
                                </div>
                            </div>
                            <div class="col-md-2"></div>
                            <div class="col-md-7">
                                <div class="form-group" align="left">
                                    <label>Name</label>
                                    <input type="text" class="form-control" id="studname" placeholder="Enter Name"
                                           name="studname" style="width:250px;" required>
                                </div>
                            </div>
                        </div>


                        <div class="form-group" align="left">
                            <label for="studmail">Mail</label>
                            <input type="email" class="form-control" id="studmail" placeholder="Enter Mail"
                                   name="studmail"
                                   style="width:400px;" required>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group" align="left">
                                    <label for="studmn">Mobile Number</label>
                                    <input type="tel" class="form-control" id="studmn" placeholder="Enter Mobile Number"
                                           name="studmn" style="width:200px;" maxlength="10" required>
                                </div>
                            </div>
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                <div class="form-group" align="left">
                                    <label>Department</label>
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

                        <h4 style="color: #6c757d">Event Details</h4><br>

                        <div class="form-group" align="left">
                            <label>Description</label><br>
                            <textarea rows="5" cols="53"
                                      placeholder="Enter full description about the event (No of attendees,organizers etc)."
                                      name="descp"></textarea>
                        </div>


                        <div>
                            <center>
                                <button type="submit" class="btn button1 button4 btn-success"
                                        style="width:100px;height:50px;">Request
                                </button>
                                <a href="booking.jsp">
                                    <button class="btn button2 button4 btn-danger" style="width:100px;height:50px;">
                                        Cancel
                                    </button></center>
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
