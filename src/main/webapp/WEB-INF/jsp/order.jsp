<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>

<head>
	<title>Order List</title>
</head>

<body>
<jsp:include page="main.jsp"/> 
	<h2>Order List</h2>
	
	<security:authorize access="hasRole('barista')">
	<input type="button" value="New Order"
			onclick="window.location.href='/orders/register'">
	</security:authorize>

	<p>
	<table>
	<tbody>
		<tr>
			<th>Id</th>
			<th>Customer Name</th>
			<th> Contact Number </th>
			<th> Products </th>
			<th> quantity </th>
			<th> Price </th>
			<th> Due Date </th>
			<th> Total </th>
			<th> Status </th>
			<security:authorize access="hasRole('barista')"><th>Action</th></security:authorize>
		</tr>
		
		<!-- loop for displaying each user -->
		<c:forEach var="tempOrder" items="${order}">
		
		<!-- link "update" user using user id -->
		<c:url var="updateOrder" value="/orders/update" >
			<c:param name="orderId" value="${tempOrder.id }"></c:param>
		</c:url>		
		
		<!-- link "delete" user using user id -->
		<c:url var="deleteOrder" value="/orders/delete" >
			<c:param name="orderId" value="${tempOrder.id }"></c:param>
		</c:url>
		
		<tr>
			<td>${tempOrder.id}</td>
			<td>${tempOrder.customerName}</td>
			<td>${tempOrder.contactNumber}</td>
			<td>${tempOrder.products}</td>
			<td>${tempOrder.quantity}</td>
			<td>${tempOrder.price}</td>
			<td>${tempOrder.duedate}</td>
			<td>${tempOrder.total}</td>
			<td>${tempOrder.status}</td>
			
			<security:authorize access="hasRole('barista')">
			<td><a href="${updateOrder}">Edit</a>
				<a href="${deleteOrder}"
				onclick="if(!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a></td>
				</security:authorize>
		</tr>
		
		</c:forEach>	
	</tbody>
	</table>
	</p>
	
	<input type="button" value="Back"
			onclick="window.location.href='/'">
	
	
</body>

</html>