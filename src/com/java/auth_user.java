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
import java.sql.SQLException;

public class auth_user extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String mis_id = req.getParameter("txt_id");
        String pass = req.getParameter("txt_pass");
        String type = req.getParameter("type");
        int flag = 0;

        PreparedStatement preparedStatement = null;
        /* myDB db = new myDB(); */
        Connection con = myDB.getCon();
        ResultSet resultSet = null;
        if (con != null) {
            try {
                HttpSession session = req.getSession();
                if ("user".equals(type)) {
                    //System.out.println("Helloooooooooooooooooooo");
                    session.setAttribute("errorMessage", "type");
                    resp.sendRedirect("/index.jsp");
                }


                if ("teacher".equals(type)) {
                    preparedStatement = con.prepareStatement("select mis_id,password from teacher_login where mis_id=? and password=?");
                    session.setAttribute("flag", "0");
                } else if ("admin".equals(type)) {
                    session.setAttribute("flag", "1");
                    preparedStatement = con.prepareStatement("select assistant_id,password from assistant_info where assistant_id=? and password=?");
                }

                if (preparedStatement != null) {
                    preparedStatement.setString(1, mis_id);
                    preparedStatement.setString(2, pass);
                    resultSet = preparedStatement.executeQuery();

                    if (resultSet.next()) {
                        String ch = (String) session.getAttribute("flag");
                        session.setAttribute("user_name", mis_id);
                        if ( "0".equals(ch)) {
                            resp.sendRedirect("/booking.jsp");
                        } else
                            resp.sendRedirect("/admin.jsp");
                    } else {
                        session.setAttribute("errorMessage", "Invalid");
                        session.setAttribute("user_name", null);
                        req.getRequestDispatcher("/index.jsp").forward(req, resp);
                    }

                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else {
            PrintWriter o = resp.getWriter();
            o.print("Connection Failed!");
        }

    }


}
