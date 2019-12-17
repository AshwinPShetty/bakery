<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
	<title>Bakery</title>
</head>

<body>
	
	
	<div class="topnav">
  <a class="active" href="${pageContext.request.contextPath}/orders">Orders</a>
  
  <security:authorize access="hasRole('admin')">
  <a href="${pageContext.request.contextPath}/users">Users</a>
  </security:authorize>
  
  <a href="${pageContext.request.contextPath}/productDetails/0">Products</a>
  
  <a href="<c:url value="/logout" />">Logout</a> 

</div>
  
 
	
</body>
</html>