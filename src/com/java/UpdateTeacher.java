package com.java;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/updateTeacher")
@MultipartConfig(maxFileSize = 16177215)
public class UpdateTeacher extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user_name");
        Connection con = myDB.getCon();
        try {
            String mail = request.getParameter("email");
            String mob = request.getParameter("mobile");
            String pass = request.getParameter("password");

            InputStream is = null;
            Part fp = request.getPart("pic");
            System.out.println(fp);
            if (fp.getSize() != 0) {
                PreparedStatement stmt = con.prepareStatement("update teacher_info set email_id=?,mob_no=?,photo=?,set_password=?");
                stmt.setString(1, mail);
                stmt.setString(2, mob);
                System.out.println(fp.getName());
                System.out.println(fp.getSize());
                System.out.println(fp.getContentType());
                is = fp.getInputStream();
                stmt.setBlob(3, is);
                stmt.setString(4, pass);
                int i = stmt.executeUpdate();
                if (i > 0)
                    response.sendRedirect("/booking.jsp");
            } else {
                PreparedStatement stmt = con.prepareStatement("update teacher_info set email_id=?,mob_no=?,set_password=?");
                stmt.setString(1, mail);
                stmt.setString(2, mob);
                stmt.setString(3, pass);
                int i = stmt.executeUpdate();
                if (i > 0)
                    response.sendRedirect("/booking.jsp");

            }


        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}