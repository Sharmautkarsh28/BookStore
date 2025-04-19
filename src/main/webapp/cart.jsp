<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Shopping Cart</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

	
	<div class="navbar">
		<a href="books.jsp">Home</a> <a href="CartServlet">Cart (<%=session.getAttribute("cartCount") == null ? 0 : session.getAttribute("cartCount")%>)
		</a>
	</div>

	<h2>Your Shopping Cart</h2>

	<div class="table-container">
		<table>
			<tr>
				<th>Title</th>
				<th>Author</th>
				<th>Price</th>
				<th>Action</th>
			</tr>
			<%
			
			java.util.List<String[]> cart = (java.util.List<String[]>) session.getAttribute("cart");
			double total = 0;

			if (cart != null && !cart.isEmpty()) {
				for (int i = 0; i < cart.size(); i++) {
					String[] book = cart.get(i);
					total += Double.parseDouble(book[2]);
			%>
			<tr>
				<td><%=book[0]%></td>
				<td><%=book[1]%></td>
				<td>₹<%=book[2]%></td>
				<td>
					
					<form action="CartServlet" method="get">
						<input type="hidden" name="action" value="remove"> <input
							type="hidden" name="index" value="<%=i%>">
						<button type="submit" class="btn-delete">Delete</button>
					</form>
				</td>
			</tr>
			<%
			}
			%>
			<tr>
				<td colspan="2"><b>Total</b></td>
				<td><b>₹<%=total%></b></td>
				<td></td>
			</tr>
			<%
			} else {
			%>
			<tr>
				<td colspan="4">Your cart is empty</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>

	<%
	if (cart != null && !cart.isEmpty()) {
	%>
	
	<form action="BuyServlet" method="post">
		<button type="submit" class="btn-buy">Buy Now</button>
	</form>
	<%
	}
	%>

</body>
</html>
