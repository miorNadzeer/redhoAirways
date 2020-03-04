<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="redho.Customer"%>
<jsp:useBean id="customerId" class="redho.Customer" scope="session">
	<jsp:setProperty name="customerId" property="*" />
</jsp:useBean>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redha Airways</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<h2>Customer registration</h2>
	<table>
		<th>You entered the following data</th>
				<tr>
					<td>Email	: </td>
					<td><%= customerId.getEmail() %></td>
				</tr>
				<tr>
					<td>Password	: </td>
					<td><%= customerId.getPassword()  %></td>
				</tr>
                <tr>
					<td>ID	: </td>
					<td><%= customerId.getId() %></td>
				</tr>
                <tr>
                	<td>Title	: </td>
					<td><%= customerId.getTitle() %></td>
				</tr>
                <tr>
					<td>Last name	: </td>
					<td><%= customerId.getLastName() %></td>
				</tr>
                <tr>
					<td>First name	: </td>
					<td><%= customerId.getFirstName() %></td>
				</tr>
                <tr>
					<td>Nationality	: </td>
					<td><%= customerId.getNationality() %></td>
				</tr>
                <tr>
					<td>Telephone No	: </td>
					<td><%= customerId.getTel()  %></td>
				</tr>


		<!-- Set the action for processing the answers -->
		<form method="post" action="StoreCustomer.jsp">
		<tr>
			<td><input type="submit" value="Confirm"></td>
		</tr>
		</form>
	</table>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>