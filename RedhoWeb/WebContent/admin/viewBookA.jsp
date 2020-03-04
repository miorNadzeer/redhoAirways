<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%-- <% Class.forName("com.mysql.jdbc.Driver"); %>
 --%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redha Airways</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h2>View all booking</h2>
	<table border="0">
			<tr><td><a href=viewBookAO.jsp>View by staff</a></td></tr>
			<tr><td><a href=viewBookAL.jsp>View by location</a></td></tr>
		</table>
	<%  
		//Connection connection = DriverManager.getConnection
		//("jdbc:mysql://localhost/redhoairways" , "root", "");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/clubdb" , "root", "");
		Statement statement = connection.createStatement();
		
		//ResultSet rs = statement.executeQuery("select * from bookFlight");
		ResultSet rs = statement.executeQuery("select * from details");
		
	%>
	<table border="1">
		<tr>
			<th>Book ID</th>
			<th>Class</th>
			<th>Type</th>
			<th>Origin</th>
			<th>Destination</th>
			<th>Depart date</th>
		<!-- 	<th>Depart time</th>
			<th>Return date</th>
			<th>Return time</th>
			<th>No of adult</th>
			<th>No of child</th>
			<th>Additional weight</th>
			<th>Inflight meal</th>
			<th>Customer name</th>
			<th>Nationality</th>
			<th>Ic No</th>
			<th>Flight charge</th> -->
		<tr>
		<% double totalCharge = 0.0;
 			while(rs.next()){ %>
		<tr>
                <td> <%= rs.getString(1) %></td>
                <td> <%= rs.getString(2) %></td>
                <td> <%= rs.getString(3) %></td>
                <td> <%= rs.getString(4) %></td>
                <td> <%= rs.getString(5) %></td>
                <td> <%= rs.getString(6) %></td>
     <%--            <td> <%= rs.getString(7) %></td>
				<td> <%= rs.getString(8) %></td>
				<td> <%= rs.getString(9) %></td>
				<td> <%= rs.getInt(10) %></td>
				<td> <%= rs.getInt(11) %></td>
				<td> <%= rs.getDouble(12) %></td>
				<td> <%= rs.getString(13) %></td>
				<td> <%= rs.getString(15) %> <%= rs.getString(14) %></td>
				<td> <%= rs.getString(17) %></td>
				<td> <%= rs.getString(16) %></td>
				<td> RM<%= rs.getDouble(19) %></td> --%>
        	</tr>
            
         <% totalCharge = totalCharge + rs.getDouble(19); %>
        <% } %>
		<p><% out.println("Total charge from all booking RM"+totalCharge);  %></p>
		</table>
		<p><a href="adminMain.html">Back to main page</a></p>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>