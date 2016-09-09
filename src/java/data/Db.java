package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Db {

    private static String driver = "com.mysql.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost/cupcakeshop";
    private static String user = "testuser";
    private static String password = "testuser";

    public static Connection getConnection() {
        Connection conn = null;

        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            //se hele sekvenst til det gik galt
            ex.printStackTrace();
        }
        return conn;
    }
}
