<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redha Airways</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<form method = "POST" action = "viewBooking.jsp">
	<table>
		<tr>
			<td>Enter IC no.</td>
			<td><input type="text" name="ic"/></td>
		</tr>
		<tr><td/><td><input type="submit" name="submit"/></td></tr>
	</table>
	</form>
	<%  
		Connection connection = DriverManager.getConnection
		("jdbc:mysql://localhost/redhoairways" , "root", "kucing3");		
		Statement statement = connection.createStatement();
		
		String ic = request.getParameter("ic");
		ResultSet rs = statement.executeQuery("select * from bookFlight where cust_id = '" + ic +"'");
	if(request.getParameter("submit") != null){
	%>
	<table border="1">
		<tr>
			<th>Book ID</th>
			<th>Class</th>
			<th>Type</th>
			<th>Origin</th>
			<th>Destination</th>
			<th>Depart date</th>
			<th>Depart time</th>
			<th>Return date</th>
			<th>Return time</th>
			<th>No of adult</th>
			<th>No of child</th>
			<th>Additional weight</th>
			<th>Inflight meal</th>
			<th>Flight charge</th>
		<tr>
		<% while(rs.next()){ %>
		<tr>
                <td> <%= rs.getString(1) %></td>
                <td> <%= rs.getString(2) %></td>
                <td> <%= rs.getString(3) %></td>
                <td> <%= rs.getString(4) %></td>
                <td> <%= rs.getString(5) %></td>
                <td> <%= rs.getString(6) %></td>
                <td> <%= rs.getString(7) %></td>
				<td> <%= rs.getString(8) %></td>
				<td> <%= rs.getString(9) %></td>
				<td> <%= rs.getInt(10) %></td>
				<td> <%= rs.getInt(11) %></td>
				<td> <%= rs.getDouble(12) %>KG</td>
				<td> <%= rs.getString(13) %></td>
				<td> RM<%= rs.getDouble(19) %></td>
            </tr>
        <% }
		}%>
		</table>
		<a href="customerMain.html">Back to main page</a>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>