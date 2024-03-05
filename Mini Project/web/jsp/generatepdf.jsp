    <%@ page import="com.java.myDB" %>
    <%@ page import="java.sql.*" %>
    <%
    try{
        //response.setContentType("application/pdf");
    response.setHeader("content-disposition", "attachment;filename=Lab");
    Connection con = myDB.getCon();
    String mis_id = (String) session.getAttribute("user_name");
    int event_id = Integer.parseInt(request.getParameter("event_id"));
    PreparedStatement stmt = con.prepareStatement("select * from events inner join teachers on events.mis_id = teachers.mis_id where events.mis_id = ? and events.event_id = ?");
    stmt.setString(1, mis_id);
    stmt.setInt(2, event_id);
    //Date date = new Date();
    ResultSet rs = stmt.executeQuery();
    rs.next();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Report</title>
</head>
<body>
<h1></h1>
<style>
    .crtf_div {
        width: 900px;
        height: auto;
        text-align: center;
        font-family: Arial, Helvetica, sans-serif;
        border: 1px solid #000;
        padding: 25px 0px;
    }

    .crtf_div p {
        width: 850px;
        height: auto;
        margin: 20px 25px;
        text-align: justify;
        font-size: 14px;
    }

    .crtf_head {
        width: 900px;
        height: auto;
        text-align: center;
        font-size: 16px;
        font-weight: bold;
    }

    .crtf_head .head_small {
        font-size: 12px;
    }

    .crtf_table {
        width: 850px;
        height: auto;
        margin: 10px 25px;
        border: 1px solid #000;
        text-align: left;
        font-size: 14px;
    }

    .crtf_table tr td input {
        width: 670px;
        height: 20px;
        border: 0px;
    }

    .crtf_table tr td textarea {
        width: 670px;
        height: 50px;
        border: 0px;
    }

    .crtf_list {
        width: auto;
        height: auto;
        margin: 10px 25px;
        text-align: justify;
        font-size: 14px;
    }

    .crtf_list ol li {
        width: auto;
        height: auto;
        margin-bottom: 10px;
    }
</style>
<center>
    <div class="crtf_div">
        <Div class="crtf_head">Pune Institue Of Computer Technology<br/>
            Dhankawdi, Pune-411043<br/>
            <div class="head_small">Tel. No. 7218867653, 8237317225</div>
        </Div>
        <br/>

        <table class="crtf_table" style="border:0px; text-align:center;">
            <tr>
                <%--<td>Dated: <b>&nbsp; &nbsp;<%=%>--%>
                </b></td>
            </tr>
        </table>
        <table class="crtf_table" border="1" cellspacing="0" cellpadding="5">
            <tr>
                <td width="150">Student Name:</td>
                <td><input type="text" name="name" value="<%=rs.getString("stud_name")%>"/></td>
            </tr>
            <tr>
                <td>Student Email:</td>
                <td><input type="text" name="email" value="<%=rs.getString("stud_email")%>"></td>
            </tr>
            <tr>
                <td>Mobile Number:</td>
                <td><input type="text" name="mobile" value="<%=rs.getString("mob_no")%>"/></td>
            </tr>

        </table>
        <p><b>Sub :- Approved Lab For Event</b></p>
        <p>&nbsp; &nbsp; &nbsp; This particular lab has been approved by the repesctive lab assistant for the event
            <b><%=rs.getString("event_name")%>
            </b></p>
        <p>The lab has been booked for <b>Date: <%=rs.getString("date")%>
        </b> from <b>Time: <%=rs.getString("start_time")%> to <%=rs.getString("end_time")%>
        </b></p>
        <div class="crtf_div">
            <p><b>Event Description:</b></p>
            <p>
                <%=rs.getString("description")%>
            </p>
        </div>
        <p><b>Conditions:</b></p>

        <div class="crtf_list">
            <ol type="i">
                <li>The respective Event Co-ordinator is responsible for any damage to the lab resoruces.</li>
                <li> The Event Co-ordinator should take care of the lab resources.</li>
            </ol>
        </div>
        <br/><br/>

        <table class="crtf_table" style="border:0px; line-height:20px;">
            <tr>
                <td><b>Submit Copy to:</b><br/>
                    1. The security guard<br/>
                    2. The security cabin<br/>
                </td>
                <td style="float:right; text-align:center;"><br/>
                    Event Co-ordinator<br/>
                    <%--<%=rs.getString("fname")%> <%=rs.getString("mname")%> <%=rs.getString("lname")%>--%>
                   <%=rs.getString("fname")%> <%=rs.getString("mname")%> <%=rs.getString("lname")%><br/><br/><br/>
                    <br/>
                </td>
            </tr>
        </table>
    </div>
</center>
<br><br>
<%
    }catch (SQLException e){
        e.printStackTrace();
    }
%>
</body>
</html>