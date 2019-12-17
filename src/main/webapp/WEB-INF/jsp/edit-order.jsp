<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
	<title>Edit Order </title>
</head>


<body>
<jsp:include page="main.jsp"/> 
	<h2>Edit Order</h2>
	
	<form:form modelAttribute="order" method="POST" >
	
	<!-- associate data with userId -->
	<form:hidden path="id"/>
	
	<table>
		<tbody>
			<tr>
			<th>Customer Name</th>
			<td><form:input type="text" path="customerName" required="true"/></td>
			</tr>	
						
			<tr>
			<th>Contact Number</th>
			<td><form:input type="text" path="contactNumber" required="true"/></td>
			</tr>
			
			<tr>
			<th>Products</th>
			<td>
				<form:select path="products" name="exerciseId" id="wgtmsr">
				<c:forEach items="${products}" var="products">
					<form:option value="${products.productName}">${products.productName}</form:option>
				</c:forEach>
				</form:select>
			</td>
			</tr>
			
			
			<tr>
			<th>Price</th>
			<td><form:input type="text" path="price" required="true"/></td>
			</tr>
			
			<tr>
			<th>Due Date</th>
			<td><form:input type="text" path="duedate" required="true"/></td>
			</tr>
			
			<tr>
			<th>Total</th>
			<td><form:input type="text" path="total" required="true"/></td>
			</tr>
			
			
			<tr>
			<th>Status</th>
			<td><form:input type="text" path="status" required="true"/></td>
			</tr>
			
			<tr>
			<td><input type="submit" Value="Update"/></td>
			</tr>
			
		</tbody>
	</table>
	</form:form>

	<a href="${pageContext.request.contextPath}/orders">Cancel</a>
	
	
</body>

</html>