package com.bookstore.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.bookstore.util.DBConnection;

@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = null;
        try {
            con = DBConnection.getConnection();

            // Handle delete request
            String deleteId = request.getParameter("deleteId");
            if (deleteId != null) {
                // Delete book
                PreparedStatement stmt = con.prepareStatement("DELETE FROM books WHERE id=?");
                stmt.setInt(1, Integer.parseInt(deleteId));
                stmt.executeUpdate();
            } else {
                // Handle add book request
                String title = request.getParameter("title");
                String author = request.getParameter("author");
                String priceStr = request.getParameter("price");

                if (title != null && author != null && priceStr != null) {
                    double price = Double.parseDouble(priceStr);
                    PreparedStatement stmt = con.prepareStatement("INSERT INTO books (title, author, price) VALUES (?, ?, ?)");
                    stmt.setString(1, title);
                    stmt.setString(2, author);
                    stmt.setDouble(3, price);
                    stmt.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) try { con.close(); } catch (Exception e) { e.printStackTrace(); }
        }

        response.sendRedirect("admin_dashboard.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // You can use doGet to display books or handle other operations if needed.
        response.sendRedirect("admin_dashboard.jsp");
    }
}