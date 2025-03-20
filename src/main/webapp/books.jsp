<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*, com.bookstore.util.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
	

	<!-- Navbar with Cart Count -->
	<div class="navbar">
		<a href="books.jsp">Home</a> <a href="CartServlet">Cart (<%=session.getAttribute("cartCount") == null ? 0 : session.getAttribute("cartCount")%>)
		</a>
	</div>

	<h2>Available Books</h2>

	<div class="table-container">
		<table>
			<tr>
				<th>Title</th>
				<th>Author</th>
				<th>Price</th>
				<th>Action</th>
			</tr>
			<%
			// Always fetch books from the database
			List<String[]> bookList = new java.util.ArrayList<>();
			try (Connection con = DBConnection.getConnection()) {
				PreparedStatement stmt = con.prepareStatement("SELECT * FROM books");
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {
					bookList.add(
					new String[] { rs.getString("title"), rs.getString("author"), String.valueOf(rs.getDouble("price")) });
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			if (!bookList.isEmpty()) {
				for (String[] book : bookList) {
			%>
			<tr>
				<td><%=book[0]%></td>
				<td><%=book[1]%></td>
				<td>₹<%=book[2]%></td>
				<td>
					<form action="CartServlet" method="post">
						<input type="hidden" name="title" value="<%=book[0]%>">
						<input type="hidden" name="author" value="<%=book[1]%>">
						<input type="hidden" name="price" value="<%=book[2]%>">
						<button type="submit" class="btn">Add to Cart</button>
					</form>
				</td>
			</tr>
			<%
			}
			} else {
			%>
			<tr>
				<td colspan="4">No books available</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>

</body>
</html>