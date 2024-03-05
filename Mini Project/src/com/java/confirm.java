package com.java;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/confirm")
public class confirm extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            String date;
            String start_time, end_time;
            String lab_no;
            String event_id = request.getParameter("event_id");
            Connection con = myDB.getCon();


            PreparedStatement stmt2 = con.prepareStatement("select date,lab_no,start_time,end_time from events where event_id=?");
            PreparedStatement stmt = con.prepareStatement("update events set flag = 1, remark='Approved!' where event_id=?");
            stmt.setInt(1, Integer.parseInt(event_id));
            stmt2.setInt(1, Integer.parseInt(event_id));
            ResultSet rs = stmt2.executeQuery();
            rs.next();
            lab_no = rs.getString("lab_no");
            date = rs.getString("date");
            start_time = rs.getString("start_time");
            end_time = rs.getString("end_time");

            if ("A3-001".equals(lab_no) || "A3-002".equals(lab_no) || "A1-004".equals(lab_no) || "F-001".equals(lab_no)) {
                PreparedStatement stmt1 = con.prepareStatement("insert into booked_hall values (?,?,?,?)");
                stmt1.setString(1,lab_no);
                stmt1.setString(2,date);
                stmt1.setString(3,start_time);
                stmt1.setString(4,end_time);
                stmt1.executeUpdate();

                if (stmt.executeUpdate() != 0) {
                    response.sendRedirect("/admin.jsp");
                }

            } else {
                PreparedStatement stmt1 = con.prepareStatement("insert into lab_booked values (?,?)");

                stmt1.setString(1, lab_no);
                stmt1.setString(2, date);

                stmt1.executeUpdate();

                if (stmt.executeUpdate() != 0) {
                    response.sendRedirect("/admin.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
