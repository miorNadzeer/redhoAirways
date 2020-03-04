<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redha Airways</title>
</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
        <% 
            Connection connection = DriverManager.getConnection
            	("jdbc:mysql://localhost/redhoairways" , "root", "kucing3");

            Statement statement = connection.createStatement();

            String origin = request.getParameter("origin");
            String destination = request.getParameter("destination");
            String departdate = request.getParameter("ddate");
            String returndate = request.getParameter("rdate");

            ResultSet resultset1 = 
                statement.executeQuery("select * from flight where flightOrigin = '" + origin 
                + "' and flightDestination = '" + destination + "' and flightDepartDate = '" + departdate + "'") ; 
            
            ResultSet resultset2 = 
                    statement.executeQuery("select * from flight where flightOrigin = '" + origin 
                    + "' and flightDestination = '" + destination + "' and flightDepartDate = '" + returndate + "'") ;
        %>
		<table>
		<tr>
			<th>Flight ID</th>
			<th>Origin</th>
			<th>Destination</th>
			<th>Depart date</th>
			<th>Depart time</th>
			<th>Available seat</th>
		<tr>
		<% while(resultset1.next()){ %>
		<tr>
                <td> <%= resultset1.getString(1) %></td>
                <td> <%= resultset1.getString(2) %></td>
                <td> <%= resultset1.getString(3) %></td>
                <td> <%= resultset1.getDate(4) %></td>
                <td> <%= resultset1.getTime(5) %></td>
                <td> <%= resultset1.getInt(6) %></td>
            </tr>
        <% } %>

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