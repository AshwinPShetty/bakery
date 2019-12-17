<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>

<head>
	<title>Bakery</title>
</head>

<body>

	<h2>Bakery</h2>
	
	<h4> Sign In </h4>
		
		<form:form action="/authenticateTheUser" 
							method="POST" >
			<p>
			<!-- User name -->
			Username
			<input type="text" name="username" class="wrap-input100"/>
			</p>
			
			<p>
			<!-- Password -->
			Password
			<input type="password" name="password" class="wrap-input100" />
			</p>
			
			
			<p>
			<!-- Login/Submit Button -->
			<button type="submit" class="login100-form-btn">Sign In</button>
			</p> 
 
		

		</form:form>

</body>
</html>