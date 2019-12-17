<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
	<title>User List</title>
</head>

<body>
<jsp:include page="main.jsp"/>  
	<h2>User List</h2>
	
	<input type="button" value="New User"
			onclick="window.location.href='/users/register'">

	<table>
	<tbody>
		<tr>
			<th>Email</th>
			<th>Name</th>
			<th>Role</th>
			<th>Action</th>
		</tr>
		
		<!-- loop for displaying each user -->
		<c:forEach var="tempUser" items="${users}">
		
		<!-- link "update" user using user id -->
		<c:url var="updateUser" value="/users/update" >
			<c:param name="userId" value="${tempUser.id }"></c:param>
		</c:url>		
		
		<!-- link "delete" user using user id -->
		<c:url var="deleteUser" value="/users/delete" >
			<c:param name="userId" value="${tempUser.id }"></c:param>
		</c:url>
		
		<tr>
			<td>${tempUser.email}</td>
			<td>${tempUser.firstName} ${tempUser.lastName}</td>
			<td>${tempUser.role}</td>
			
			<td><a href="${updateUser}">Edit</a>
				<a href="${deleteUser}"
				onclick="if(!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a></td>
		</tr>
		
		</c:forEach>	
	</tbody>
	</table>
	
	<input type="button" value="Back"
			onclick="window.location.href='/'">
	
	
</body>

</html>