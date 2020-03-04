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
	<form method = "POST" action = "viewBookAO.jsp">
	<h2>View booking based on counter officer</h2>
	<table>
		<tr>
			<td>Select staff</td>
			<td><select name="officer">
                    	<option value="">Please select</option>
                        <option value="001">Amirul Farhan</option>
                        <option value="002">Muhammad Faiz</option>
						<option value="003">Sulaiha Atina</option>
                      </select></td>
		</tr>
		<tr><td/><td><input type="submit" name="submit"/></td></tr>
	</table>
	</form>
	<%  
		Connection connection = DriverManager.getConnection
		("jdbc:mysql://localhost/redhoairways" , "root", "kucing3");		
		Statement statement = connection.createStatement();
		
		String staff_id = request.getParameter("officer");
		ResultSet rs = statement.executeQuery("SELECT * FROM bookflight b JOIN counterofficer c " 
				+"ON b.staff_id = c.staff_id "
				+"WHERE b.staff_id = '" + staff_id + "'");
	
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
			<th>Customer Name</th>
			<th>Customer Nationality</th>
			<th>Customer Ic No</th>
			<th>Incharge officer</th>
			<th>Flight charge</th>
		<tr>
		<% 	double totalCharge = 0.0;
			while(rs.next()){ %>
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
				<td> <%= rs.getDouble(12) %></td>
				<td> <%= rs.getString(13) %></td>
				<td> <%= rs.getString(15) %> <%= rs.getString(14) %></td>
				<td> <%= rs.getString(17) %></td>
				<td> <%= rs.getString(16) %></td>
				<td> <%= rs.getString(24) %> <%= rs.getString(23) %></td>
				<td> RM<%= rs.getDouble(19) %></td>
            </tr>
         <% totalCharge = totalCharge + rs.getDouble(19); %>
        <% } %>
		<p><% out.println("Total charge from staff id = ("+staff_id+") is RM"+totalCharge);  %></p>
		<% }%>
		</table>
		<a href="viewBookA.jsp">Return to view book page</a>
		<p><a href="adminMain.html">Back to main page</a></p>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>