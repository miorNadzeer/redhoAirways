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
	<jsp:include page="/header.jsp"></jsp:include>
	<table border="0">
		</table>
	<%  
		Connection connection = DriverManager.getConnection
		("jdbc:mysql://localhost/redhoairways" , "root", "kucing3");		
		Statement statement = connection.createStatement();
		
		ResultSet rs = statement.executeQuery("select * from counterofficer");
	
	%>
	<table border="1">
		<tr>
			<th>Staff ID</th>
			<th>Last name</th>
			<th>First name</th>
			<th>IC</th>
			<th>Date of birth</th>
			<th>Email</th>
			<th>Telephone no.</th>
			<th>Start date</th>
		<tr>
		<% while(rs.next()){ %>
		<tr>
                <td> <%= rs.getString(1) %></td>
                <td> <%= rs.getString(4) %></td>
                <td> <%= rs.getString(5) %></td>
                <td> <%= rs.getString(6) %></td>
                <td> <%= rs.getString(7) %></td>
                <td> <%= rs.getString(2) %></td>
				<td> <%= rs.getString(9) %></td>
				<td> <%= rs.getString(8) %></td>
            </tr>
        <% } %>
        </table>
        <tr><td><a href="registerOfficer.html">Add staff</a></td></tr>
        <p><a href="adminMain.html">Back to main page</a></p>
</body>
</html>