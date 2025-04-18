package com.bookstore.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static final String URL = "jdbc:mysql://localhost:3306/book_store?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USER = "root";  // WorkBanch Name
    private static final String PASS = "2992003@****"; // Your WorkBench Password

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // Force-load the MySQL Driver
            System.out.println("✅ MySQL Driver Loaded Successfully!");
        } catch (ClassNotFoundException e) {
            System.out.println("❌ MySQL Driver Not Found!");
            e.printStackTrace();
            throw new SQLException("MySQL JDBC Driver not found!", e);
        }

        try {
            Connection con = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("✅ Database Connected Successfully!");
            return con;
        } catch (SQLException e) {
            System.out.println("❌ Database Connection Failed: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }
}
