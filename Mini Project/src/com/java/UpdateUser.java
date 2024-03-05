package com.java;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/updateUser")
public class UpdateUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Connection con = myDB.getCon();
            String user = (String) session.getAttribute("user_name");
            PreparedStatement stmt = con.prepareStatement("update assistant set assistant_name=?,mob_no=?,email=? where assistant_id=?");
            stmt.setString(1, request.getParameter("nm"));
            stmt.setString(2, request.getParameter("mn"));
            stmt.setString(3, request.getParameter("mail"));
            stmt.setString(4, user);
            stmt.executeUpdate();
            response.sendRedirect("/blank1.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
