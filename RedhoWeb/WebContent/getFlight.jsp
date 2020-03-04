<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="redho.Flight"%>
<jsp:useBean id="flightId" class="redho.Flight" scope="session">
	<jsp:setProperty name="flightId" property="*" />
</jsp:useBean>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redha Airways</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h2>Booking details</h2>
	<table>
		<th>Your booking details</th>
				<tr>
					<td>Flight Type	: </td>
					<td><%= flightId.getFlightType() %></td>
				</tr>
				<tr>
					<td>Flight Class	: </td>
					<td><%= flightId.getFlightClass()  %></td>
				</tr>
                <tr>
					<td>Flight Origin	: </td>
					<td><%= flightId.getFlightFrom() %></td>
				</tr>
                <tr>
                	<td>Flight Destination	: </td>
					<td><%= flightId.getFlightTo() %></td>
				</tr>
                <tr>
					<td>Depart date	: </td>
					<td><%= flightId.getDepartDate() %></td>
				</tr>
                <tr>
					<td>Depart time	: </td>
					<td><%= flightId.getDepartTime() %></td>
				</tr>
                <tr>
					<td>Return date	: </td>
					<td><%= flightId.getReturnDate() %></td>
				</tr>
                <tr>
					<td>Return time	: </td>
					<td><%=  flightId.getReturnTime() %></td>
				</tr>
				<tr>
					<td>Adult	: </td>
					<td><%=  flightId.getAdult() %></td>
				</tr>
				<tr>
					<td>Child	: </td>
					<td><%= flightId.getChild()  %></td>
				</tr>
				<tr>
					<td>Additional weight	: </td>
					<td><%= flightId.getAddWeight() %></td>
				</tr>
				<tr>
					<td>Inflight meal	: </td>
					<td><%= flightId.getMeal()  %></td>
				</tr>
				<tr>
					<td>Nationality	: </td>
					<td><%= flightId.getNationality()  %></td>
				</tr>
				<tr>
					<td>Last name	: </td>
					<td><%= flightId.getLastName() %></td>
				</tr>
                <tr>
					<td>First name	: </td>
					<td><%= flightId.getFirstName() %></td>
				</tr>
				<tr>
					<td>Customer IC	: </td>
					<td><%= flightId.getId()  %></td>
				</tr>
				<tr>
					<td>Incharge officer	: </td>
					<td><%= flightId.getOfficer()  %></td>
				</tr>
				<tr>
					<td>Total charge	: </td>
					<td>RM<%= flightId.ticketCharge()  %></td>
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