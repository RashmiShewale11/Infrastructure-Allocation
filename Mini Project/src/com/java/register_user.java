package com.java;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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


                PreparedStatement stmt = con.prepareStatement("select mis_id from teachers where mis_id = ?");
                stmt.setString(1, mis_id);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    PrintWriter out = response.getWriter();
                    HttpSession session = request.getSession();
                    session.setAttribute("err","user");
                    response.sendRedirect("/sign_up.jsp");

                } else {


                    stmt = con.prepareStatement("insert into teachers(mis_id, fname, mname, lname, mob_no, email_id, password) values (?,?,?,?,?,?,?)");
                    stmt.setString(1, mis_id);
                    stmt.setString(2, fname);
                    stmt.setString(3, mname);
                    stmt.setString(4, lname);
                    stmt.setString(5, mobile);
                    stmt.setString(6, email);
                    stmt.setString(7, pass);

                    int i = stmt.executeUpdate();

                    if (i > 0) {
                        response.sendRedirect("/index.jsp");
                    } else {
                        PrintWriter out = response.getWriter();
                        out.print("<html><p style= color:'red'>");
                        out.print("Try Again!!");
                        out.print("</p></html>");
                        response.sendRedirect("/sign_up.jsp");
                    }

                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }
}
