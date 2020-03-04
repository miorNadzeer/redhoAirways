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
	<h2>View booking based on departure location</h2>
	<form method = "POST" action = "viewBookAL.jsp">
	<table>
		<tr>
			<td>Select flight Origin</td>
    		<td colspan="3"><select name="origin">
                    	<option value="-1">Please select</option>
                        <option value="Alor Setar">Alor Setar</option>
                        <option value="Penang">Penang</option>
						<option value="Kuala Lumpur">Kuala Lumpur</option>
						<option value="Kuching">Kuching</option>
						<option value="Kota Kinabalu">Kota Kinabalu</option>
                      </select></td>
                      <td><input type="submit" name="submit"/></td></tr>
	</table>
	</form>
	<%  
		Connection connection = DriverManager.getConnection
		("jdbc:mysql://localhost/redhoairways" , "root", "kucing3");		
		Statement statement = connection.createStatement();
		
		String origin = request.getParameter("origin");
		ResultSet rs = statement.executeQuery("SELECT * FROM bookflight WHERE flightOrigin = '" + origin + "'");
	
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
			<th>Customer name</th>
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
				<td> <%= rs.getString(15) %> <%= rs.getString(14) %></td>
				<td> RM<%= rs.getDouble(19) %></td>
        	</tr>
            
         <% totalCharge = totalCharge + rs.getDouble(19); %>
        <% } %>
		<p><% out.println("Total charge from "+origin+" = RM"+totalCharge);  %></p>
		<% }%>
		</table>
		<a href="viewBookA.jsp">Return to view book page</a>
		<p><a href="adminMain.html">Back to main page</a></p>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>