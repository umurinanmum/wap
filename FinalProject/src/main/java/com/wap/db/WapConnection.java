package com.wap.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class WapConnection {

    private static final String URL = "jdbc:postgresql://35.222.56.120:5432/wap";
    private static final String USER = "postgres";
    private static final String PASSWORD = "123654";

    public static Connection getConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
