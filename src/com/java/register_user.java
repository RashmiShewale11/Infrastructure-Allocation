package com.java;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class register_user extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con;
       // myDB db = new myDB();
        con = myDB.getCon();
        String mis_id = request.getParameter("mis_id");
        String fname = request.getParameter("fname");
        String mname = request.getParameter("mname");
        String lname = request.getParameter("lname");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

        if (con != null) {

            try {

                PreparedStatement stmt = con.prepareStatement("insert into teacher_info values (?,?,?,?,?,?,?)");
                stmt.setString(1, mis_id);
                stmt.setString(2, fname);
                stmt.setString(3, mname);
                stmt.setString(4, lname);
                stmt.setString(5, mobile);
                stmt.setString(6, email);
                stmt.setString(7, pass);
                stmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else{
            PrintWriter out = response.getWriter();
            out.print("Connection Failed!!");
        }

    }
}
