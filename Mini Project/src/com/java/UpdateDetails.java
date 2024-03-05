package com.java;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
//              <img src="data:image/png;base64,<%=Base64.getEncoder().encodeToString(set.getBytes(3))%>" class="b"/>
@WebServlet("/updateServlet")
public class UpdateDetails extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Connection con = myDB.getCon();


                PreparedStatement stmt = con.prepareStatement("update lab_time set from_time = ?, to_time=?, day = ? where lab_no=?");
                PreparedStatement stmt1 = con.prepareStatement("update Labs set capacity = ? where lab_no = ?");

                stmt.setString(1, request.getParameter("lab_from_time"));
                stmt.setString(2, request.getParameter("lab_to_time"));
                stmt.setString(3, request.getParameter("lab_day"));
                stmt.setString(4, request.getParameter("lab_name"));

                stmt1.setString(1, request.getParameter("lab_capacity"));
                stmt1.setString(2, request.getParameter("lab_name"));

                int i = stmt.executeUpdate();
                int i1 = stmt1.executeUpdate();
                if(i>0 && i1>0)
                    response.sendRedirect("/blank.jsp");



        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}