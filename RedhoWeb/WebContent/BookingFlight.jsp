<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="redho.Flight"%>
<jsp:useBean id="flightId" class="redho.Flight" scope="session"></jsp:useBean>
<jsp:setProperty name="flightId" property="*" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redha Airways</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<%    
    if (flightId.getFlightFrom().equals(flightId.getFlightTo())) {
      out.println("Invalid destination!");
      return; // End the method
    }
    %>
	<p>You entered the following data</p>
	<p>
		Last name:
		<%= flightId.getFlightType() %></p>
	<p>
		First name:
		<%= flightId.getFlightClass() %></p>
	<p>
		MI:
		<%= flightId.getFlightFrom() %></p>
	<p>
		Telephone:
		<%= flightId.getFlightTo() %></p>
	<p>
		Email:
		<%= flightId.getAdult() %></p>
	<p>
		Address:
		<%= flightId.getChild() %></p>

	<!-- Set the action for processing the answers -->
	<form method="post" action="StoreStudent.jsp">
		<input type="submit" value="Confirm">
	</form>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>