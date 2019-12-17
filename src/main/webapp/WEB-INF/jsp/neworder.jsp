<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<title>New Order </title>
</head>


<body>
<jsp:include page="main.jsp"/> 
	<h2>New Order</h2>
	
	
	<form:form modelAttribute="order" method="POST" >
	
	
	
	<table>
		<tbody>
			<tr>
			<th>Customer Name</th>
			<td><form:input type="text" path="customerName" required="true"/></td>
			</tr>
			
			<!--  <tr>
			<th>Contact Number</th>
			<td><form:input type="tel" path="contactNumber" required="true"/>
			<form:errors path="contactNumber"> </form:errors></td>
			</tr> -->
			 
			<!-- front end -->
			<tr>
			<th>Contact Number</th>
			<td><form:input type="tel" path="contactNumber"  id="contactNumber"  pattern="^\d{10}$" 
				onkeyup="return check()"  required="true"/> 
				<span id='message'></span>   </td>
			</tr> 
			
		<!-- java script -->
		<script type="text/javascript">
		function check(){
			if(document.getElementById('contactNumber').value.length == 10){
				document.getElementById('message').style.color = 'green';
			    document.getElementById('message').innerHTML = 'matching';
			}
			else{
				document.getElementById('message').style.color = 'red';
			    document.getElementById('message').innerHTML = 'Phone number should contain 10 digits' ;
			}
		}
		</script>  
				
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
			<th>Quantity</th>
			<td><form:input type="text" path="quantity" required="true"/>
			<font color="red">${error}</font></td>
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
			<td><input type="submit" Value="Submit"/></td>
			</tr>
			
		</tbody>
	</table>
	</form:form>

	<a href="${pageContext.request.contextPath}/orders">Cancel</a>
	
</body>

</html>