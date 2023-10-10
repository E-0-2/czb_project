package common;

import java.sql.Connection;
import java.sql.DriverManager;


public class JDBConnect {

    public static Connection getConnection() {
        try {

            Class.forName("com.mysql.jdbc.Driver");

            //String url = "jdbc:mysql://netroot.iptime.org/czb_db?serverTimezone=UTC";
           String url= "jdbc:mysql://localhost:3306/czb_db?serverTimezone=UTC";

            String id ="root";
            //String id = "netroot";
            String pwd = "12341234";
            //String pwd = "iot1234@";
            return DriverManager.getConnection(url, id, pwd);


        }
        catch (Exception e) {            
            e.printStackTrace();
        }
        return null;
    }

}