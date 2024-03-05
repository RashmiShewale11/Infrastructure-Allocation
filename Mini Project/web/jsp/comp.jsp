<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.java.myDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<style>

    .container {
        display: block;
        position: relative;
        padding-left: 35px;
        margin-bottom: 12px;
        cursor: pointer;
        font-size: 22px;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    /* Hide the browser's default checkbox */
    .container input {
        position: absolute;
        opacity: 0;
        cursor: pointer;
        height: 0;
        width: 0;
    }

    /* Create a custom checkbox */
    .checkmark {
        position: absolute;
        top: 0;
        left: 0;
        height: 25px;
        width: 25px;
        background-color: #eee;
    }

    /* On mouse-over, add a grey background color */
    .container:hover input ~ .checkmark {
        background-color: #ccc;
    }

    /* When the checkbox is checked, add a blue background */
    .container input:checked ~ .checkmark {
        background-color: #2196F3;
    }

    /* Create the checkmark/indicator (hidden when not checked) */
    .checkmark:after {
        content: "";
        position: absolute;
        display: none;
    }

    /* Show the checkmark when checked */
    .container input:checked ~ .checkmark:after {
        display: block;
    }

    /* Style the checkmark/indicator */
    .container .checkmark:after {
        left: 9px;
        top: 5px;
        width: 5px;
        height: 10px;
        border: solid white;
        border-width: 0 3px 3px 0;
        -webkit-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        transform: rotate(45deg);
    }
</style>

<body>


<%

    String date1;

    try {
        date1 = request.getParameter("comp_date");
        session.setAttribute("datee", date1);
        System.out.println(date1);
        Connection con = myDB.getCon();

        PreparedStatement stmt1 = con.prepareStatement("select * from seminar_hall_time where  hall_no='A1-004' and from_time not IN ((select from_time from booked_hall where hall_no like '%A1-004%' and book_date = ?))");
        stmt1.setString(1, date1);
        ResultSet rs1 = stmt1.executeQuery();
%>
<form action="/semi_reg.jsp" method="post">
    <%
        //out.print("Available Slots:");
        out.print("<br/>");
        //int temp=0;
        while (rs1.next()) {
            //System.out.print(rs1.getString(2));

                out.print("<input type='checkbox' name='hall' value='" + rs1.getString(3) + "'name='" + rs1.getString(3) + "'>");
                out.print(rs1.getString("from_time") + " - " + rs1.getString("to_time"));
                out.print("<br/><hr>");


            }
    %>

    <input type="hidden" id="hall_no1" name="hall_no1" value="A1-004">

    <div>
        <center>
            <button class="btn btn-success">Book&nbsp;<i
                    class="fa fa-lock"></i></button>
        </center>
    </div>
</form>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
