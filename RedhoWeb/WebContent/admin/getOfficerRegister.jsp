<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="redho.Officer"%>
<jsp:useBean id="officerId" class="redho.Officer" scope="session">
	<jsp:setProperty name="officerId" property="*" />
</jsp:useBean>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redha Airways</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h2>Staff registration</h2>
	<table>
		<th>You entered the following data</th>
				<tr>
					<td>Email	: </td>
					<td><%= officerId.getEmail() %></td>
				</tr>
				<tr>
					<td>Password	: </td>
					<td><%= officerId.getPassword()  %></td>
				</tr>
                <tr>
					<td>Last name	: </td>
					<td><%= officerId.getLastName() %></td>
				</tr>
                <tr>
					<td>First name	: </td>
					<td><%= officerId.getFirstName() %></td>
				</tr>
				<tr>
					<td>IC	: </td>
					<td><%= officerId.getIc() %></td>
				</tr>
                <tr>
					<td>Date of birth	: </td>
					<td><%= officerId.getDob() %></td>
				</tr>
				<tr>
					<td>Start date	: </td>
					<td><%= officerId.getStartDate() %></td>
				</tr>
                <tr>
					<td>Telephone No	: </td>
					<td><%= officerId.getTel()  %></td>
				</tr>


		<!-- Set the action for processing the answers -->
		<form method="post" action="StoreOfficer.jsp">
		<tr>
			<td><input type="submit" value="Confirm"></td>
		</tr>
		</form>
	</table>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>