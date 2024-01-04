package com.java;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/confirm")
public class confirm extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {


            String event_id = request.getParameter("event_id");
            Connection con = myDB.getCon();

            PreparedStatement stmt = con.prepareStatement("update event_description set flag = 1 where event_id=?");
            stmt.setInt(1, Integer.parseInt(event_id));

            if (stmt.executeUpdate() != 0) {
                response.sendRedirect("/admin.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
