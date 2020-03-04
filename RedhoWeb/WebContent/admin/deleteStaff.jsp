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
<jsp:include page="header.jsp"></jsp:include>
<body>
	<form method = "POST" action = "deleteStaff.jsp">
	<table>
		<tr>
			<td>Select staff</td>
			<td><select name="officer">
                    	<option value="">Please select</option>
                        <option value="001">Amirul Farhan</option>
                        <option value="002">Muhammad Faiz</option>
						<option value="004">Sulaiha Atina</option>
						<option value="005">Alya Nadhirah</option>
						<option value="006">Wilia Amira</option>
                      </select></td>
		</tr>
		<tr><td/><td><input type="submit" name="submit"/></td></tr>
	</table>
	</form>
	<%  
		String id = request.getParameter("officer");
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = DriverManager.getConnection
		("jdbc:mysql://localhost/redhoairways" , "root", "kucing3");		
		Statement statement = connection.createStatement();
		statement.executeQuery("DELETE FROM counterofficer WHERE staff_id = '" + id + "'");
		out.println("Succesful delete staff");
	%>
	<p><a href="viewStaff.jsp">Back to last page</a></p>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>