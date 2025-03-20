package com.bookstore.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<String[]> cart = (List<String[]>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Get book details from form
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String price = request.getParameter("price");

        // Add book to cart
        cart.add(new String[]{title, author, price});
        session.setAttribute("cart", cart);
        session.setAttribute("cartCount", cart.size());

        response.sendRedirect("books.jsp");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<String[]> cart = (List<String[]>) session.getAttribute("cart");

        // Check if remove action is requested
        String action = request.getParameter("action");
        if ("remove".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            if (cart != null && index >= 0 && index < cart.size()) {
                cart.remove(index);
            }
            session.setAttribute("cart", cart);
            session.setAttribute("cartCount", cart.size());
        }

        response.sendRedirect("cart.jsp");
    }
}

    