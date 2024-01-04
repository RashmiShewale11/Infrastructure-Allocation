<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
    <link rel="stylesheet" href="../css/main.css">
</head>


<%

    String dt = (String) session.getAttribute("date");
    //  out.print(dt);
    System.out.println(dt);

    String lab_name = request.getParameter("lab_name");
    Connection con = null;
    try {
        con = myDB.getCon();
        PreparedStatement ps = con.prepareStatement("select * from lab_time inner join lab_details detail on lab_time.lab_no = detail.lab_no inner join assistant_info on detail.assistant_id = assistant_info.assistant_id  inner join dept_info di on detail.dept_id = di.dept_id   where lab_id= ?");
        ps.setString(1, lab_name);
        ResultSet rs = ps.executeQuery();


        //out.print("<div style='height:;'></div>");
        out.print("<div class='container-fluid' id='temp_lab' style='box-shadow: 20px 20px 20px #888888; width:820px; height:auto;background: url(img/logo.png) no-repeat left center;'>");
        String std = null;
        String etd = null;
        String lab_no = null;
        while (rs.next()) {
            lab_no = rs.getString("lab_no");
            std = rs.getString("from_time");
            etd = rs.getString("to_time");

%>
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

    /*button {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
    }

    button:hover {
        opacity:1;
    }*/

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


<body>

<div class="row mt-2">
    <div class="col-md-6">
        <label class="mylabel">Lab Name</label>
    </div>
    <div class="col-md-6">
        <input type="text" value="<%=lab_no%>" readonly>
    </div>
</div>
<div class="row mt-2">
    <div class="col-md-6">
        <label class="mylabel">Capacity</label>
    </div>
    <div class="col-md-6">
        <input type="text" value="<%=rs.getString("capacity")%>" readonly>
    </div>
</div>
<div class="row mt-2">
    <div class="col-md-6">
        <label class="mylabel">Department</label>
    </div>
    <div class="col-md-6">
        <input type="text" value="<%=rs.getString("dept_name")%>" readonly>
    </div>
</div>
<div class="row mt-2">
    <div class="col-md-6">
        <label class="mylabel">HOD Name</label>
    </div>
    <div class="col-md-6">
        <input type="text" value="<%=rs.getString("hod_name")%>" readonly>
    </div>
</div>
<div class="row mt-2">
    <div class="col-md-6">
        <label class="mylabel">Assistant Name</label>
    </div>
    <div class="col-md-6">
        <input type="text" value="<%=rs.getString("assistant_name")%>" readonly>
    </div>
</div>
<div class="row mt-2 ">
    <div class="col-md-6">
        <label class="mylabel">Assistant Mobile Number </label>
    </div>
    <div class="col-md-6">
        <input type="text" value="<%=rs.getString("mob_no")%>" readonly>
    </div>
</div>
<div class="row mt-2 pb-4">
    <div class="col-md-6">
        <label class="mylabel">Assistant Email</label>
    </div>
    <div class="col-md-6">
        <input type="text" value="<%=rs.getString("email")%>" readonly>
    </div>
</div>
<div>
    <center>
        <button class="btn btn-success" onclick="document.getElementById('registration').style.display='block'">Book&nbsp;<i
                class="fa fa-lock"></i></button>
    </center>
</div>


<div id="registration" class="modal">
    <span onclick="document.getElementById('registration').style.display='none'" style="margin-top: 50px;" class="close"
          title="Close">&times;</span>
    <form class="modal-content" method="post" action="/jsp/reg.jsp" style="border:1px solid #ccc;width: 600px">
        <div class="container" style="width: 550px">
            <h1 align="center"><strong>REGISTRATION FORM</strong></h1>
            <hr>

            <!--Lab_name-->
            <div class="form-group" align="left">
                <label><strong>Lab Name:</strong></label>
                <input type="text" id="lab_name" name="lab_name"
                       value="<%=lab_no%>"
                       style="width:150px;" readonly>
            </div>

            <div class="row">

                <div class="col-md-4">
                    <div class="form-group" align="left">
                        <label><strong>Start Date</strong></label>
                        <input type="date" value="<%=dt%>" name="start_dt" style="width: 150px;" readonly>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group" align="left">
                        <label> <strong>From</strong></label>&nbsp;<input type="time" name="start_time"
                                                                          style="width: 150px;"
                                                                          value="<%=std%>" readonly>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group" align="left">
                        <label><strong>To</strong></label>&nbsp;<input type="time" name="end_time" style="width: 150px;"
                                                                       value="<%=etd%>" readonly><br>
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
                <textarea rows="5" cols="62"
                          placeholder="Enter full description about the event (No of attendees,organizers etc)."
                          name="descp"></textarea>
            </div>




            <div class="clearfix">
                <center>
                    <button onclick="document.getElementById('registration').style.display='none'"
                            class="cancelbtn btn-danger ml-auto "><strong>Cancel</strong>
                    </button>
                    <button type="submit" class=" btn-success signupbtn ml-auto "><strong>Request</strong></button>
                </center>
            </div>
        </div>

    </form>
</div>

<%
            out.print("</div>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

%>

</body>
</html>


<script>
    // Get the modal
    var modal = document.getElementById('registration');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>




