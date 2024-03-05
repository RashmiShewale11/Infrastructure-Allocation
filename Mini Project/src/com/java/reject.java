package com.java;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/reject")
public class reject extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {



            String event_id = request.getParameter("event_id");
            String reason = request.getParameter("remark");
            System.out.println(reason);
            Connection con = myDB.getCon();

            //PrintWriter out = response.getWriter();

            PreparedStatement stmt = con.prepareStatement("update events set flag = 2, remark = ? where event_id=?");
            stmt.setString(1,reason);
            stmt.setInt(2, Integer.parseInt(event_id));

            if (stmt.executeUpdate() != 0) {
                response.sendRedirect("/admin.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
