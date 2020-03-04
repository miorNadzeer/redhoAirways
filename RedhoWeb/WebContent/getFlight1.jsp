<%@ page import="redho.Flight"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="flightId" class="redho.Flight" scope="session">
	<jsp:setProperty name="flightId" property="*" />
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redha Airways</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<% 
	String flightType =  request.getParameter("type");
	String flightClass = request.getParameter("class");
	String flightFrom = request.getParameter("origin");
	String flightTo = request.getParameter("destination");
	String departDate = request.getParameter("ddate");
	String departTime = request.getParameter("dtime");
	String returnDate = request.getParameter("rdate");
	String returnTime = request.getParameter("rtime");
	int adult = Integer.parseInt(request.getParameter("adult"));
	int child = Integer.parseInt(request.getParameter("child"));
	double addWeight = Double.parseDouble(request.getParameter("weight"));
	String meal = request.getParameter("meal");
	String nationality = request.getParameter("nation");
	String lastName =request.getParameter("lastName");
	String firstName =request.getParameter("firstName");
	String id = request.getParameter("ic");
	String officer = request.getParameter("officer");
	
	flightId.setFlightType(flightType);
	flightId.setFlightClass(flightClass);
	flightId.setFlightFrom(flightFrom);
	flightId.setFlightTo(flightTo);
	flightId.setDepartDate(departDate);
	flightId.setDepartTime(departTime);
	flightId.setReturnDate(returnDate);
	flightId.setReturnTime(returnTime);
	flightId.setAdult(adult);
	flightId.setChild(child);
	flightId.setAddWeight(addWeight);
	flightId.setMeal(meal);
	flightId.setNationality(nationality);
	flightId.setLastName(lastName);
	flightId.setFirstName(firstName);
	flightId.setId(id);
	flightId.setOfficer(officer);
	double fare = flightId.ticketCharge();
	%>
	<table>
		<th>Your booking details</th>
				<tr>
					<td>Flight Type	: </td>
					<td><%= flightId.getFlightType() %></td>
				</tr>
				<tr>
					<td>Flight Class	: </td>
					<td><%= flightClass  %></td>
				</tr>
                <tr>
					<td>Flight Origin	: </td>
					<td><%= flightFrom %></td>
				</tr>
                <tr>
                	<td>Flight Destination	: </td>
					<td><%= flightTo %></td>
				</tr>
                <tr>
					<td>Depart date	: </td>
					<td><%= departDate %></td>
				</tr>
                <tr>
					<td>Depart time	: </td>
					<td><%= departTime %></td>
				</tr>
                <tr>
					<td>Return date	: </td>
					<td><%= returnDate %></td>
				</tr>
                <tr>
					<td>Return time	: </td>
					<td><%=  returnTime %></td>
				</tr>
				<tr>
					<td>Adult	: </td>
					<td><%=  adult %></td>
				</tr>
				<tr>
					<td>Child	: </td>
					<td><%= child  %></td>
				</tr>
				<tr>
					<td>Additional weight	: </td>
					<td><%= addWeight %></td>
				</tr>
				<tr>
					<td>Inflight meal	: </td>
					<td><%= meal  %></td>
				</tr>
				<tr>
					<td>Nationality	: </td>
					<td><%= nationality  %></td>
				</tr>
				<tr>
					<td>Last name	: </td>
					<td><%= lastName  %></td>
				</tr>
				<tr>
					<td>First name	: </td>
					<td><%= firstName  %></td>
				</tr>
				<tr>
					<td>Customer IC	: </td>
					<td><%= id  %></td>
				</tr>
				<tr>
					<td>Incharge officer	: </td>
					<td><%= officer  %></td>
				</tr>
				<tr>
					<td>Total charge	: </td>
					<td>RM<%= fare  %></td>
				</tr>
				


		<!-- Set the action for processing the answers -->
		<form method="post" action="StoreFlight.jsp">
		<tr>
			<td><input type="submit" value="Confirm"></td>
		</tr>
		</form>
	</table>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>