<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Login</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
	

	<div class="login-container">
		<h2>Admin Login</h2>
		<form action="AdminServlet" method="post">
			<input type="text" name="username" placeholder="Username" required>
			<input type="password" name="password" placeholder="Password"
				required>
			<button type="submit">Login</button>
		</form>
	</div>

</body>
</html>