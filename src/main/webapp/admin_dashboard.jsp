<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, java.sql.*, com.bookstore.util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp");
    }
%>


<div class="admin-navbar">
    <a href="books.jsp">Home</a>
    <a href="AdminServlet?logout=true">Logout</a>
</div>

<div class="admin-container">
    <h2>Admin Dashboard</h2>

    <!-- Form to Add Books -->
    <div class="form-container">
        <h3>Add a New Book</h3>
        <form action="BookServlet" method="post">
            <input type="text" name="title" placeholder="Title" required>
            <input type="text" name="author" placeholder="Author" required>
            <input type="number" step="0.01" name="price" placeholder="Price" required>
            <button type="submit">Add Book</button>
        </form>
    </div>

    <!-- Display Books with Delete Option -->
    <div class="table-container">
        <h3>Manage Books</h3>
        <table class="admin-table">
            <tr><th>Title</th><th>Author</th><th>Price</th><th>Action</th></tr>
            <%
                List<String[]> bookList = new java.util.ArrayList<>();
                try (Connection con = DBConnection.getConnection()) {
                    PreparedStatement stmt = con.prepareStatement("SELECT * FROM books");
                    ResultSet rs = stmt.executeQuery();
                    while (rs.next()) {
                        bookList.add(new String[]{String.valueOf(rs.getInt("id")), rs.getString("title"), rs.getString("author"), String.valueOf(rs.getDouble("price"))});
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

                for (String[] book : bookList) {
            %>
            <tr>
                <td><%= book[1] %></td>
                <td><%= book[2] %></td>
                <td>₹<%= book[3] %></td>
                <td>
                    <form action="BookServlet" method="post">
                        <input type="hidden" name="deleteId" value="<%= book[0] %>">
                        <button type="submit" class="btn-remove">Delete</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </table>
    </div>

</div>

</body>
</html>