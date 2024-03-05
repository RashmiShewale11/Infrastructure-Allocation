package com.java;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class myDB {

    static Connection con;

    public static Connection getCon() {

        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SL3", "shubham", "shubham");
        } catch (ClassNotFoundException ex) {
        //    Logger.getLogger(myDB.class.getName()).log(Level.SEVERE, null, ex);
          //  System.out.println(ex);
        } catch (SQLException ex) {
            //Logger.getLogger(myDB.class.getName()).log(Level.SEVERE, null, ex);
            //System.out.println(ex);
        }
        return con;
    }


}
