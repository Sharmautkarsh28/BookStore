package com.bookstore.servlet;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<String[]> cart = (List<String[]>) session.getAttribute("cart");

        if (cart != null && !cart.isEmpty()) {
            
            // Clear the cart after purchase
            session.removeAttribute("cart");
            session.setAttribute("cartCount", 0);

            // Redirect to confirmation page
            response.sendRedirect("order_success.jsp");
        } else {
            response.sendRedirect("cart.jsp?error=Your cart is empty!");
        }
    }
}