<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Redha Airways</title>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<%  
		String id = request.getParameter("staff_id");
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = DriverManager.getConnection
		("jdbc:mysql://localhost/redhoairways" , "root", "kucing3");		
		Statement statement = connection.createStatement();
		
		ResultSet rs = statement.executeQuery("select * from counterOfficer where staff_id ='"+id+ "'");
		while(rs.next()){
	%>
  	<table border="0">
			<form method="post" action="updateOfficer.jsp">
				<tr>
					<td>Staff Email	: </td>
					<td><input type="text" name="email" value="<%=rs.getString(2)%>"/></td>
				</tr>
				<tr>
					<td>Staff Password	: </td>
					<td><input type="text" name="password" value="<%=rs.getString(3)%>"/></td>
				</tr>
                <tr>
					<td>Staff Last name	: </td>
					<td><input type="text" name="lastName" value="<%=rs.getString(4)%>"/></td>
				</tr>
                <tr>
					<td>Staff First name	: </td>
					<td><input type="text" name="firstName" value="<%=rs.getString(5)%>"/>/></td>
				</tr>
				<tr>
					<td>Staff telephone No	: </td>
					<td><input type="text" name="tel" value="<%=rs.getString(9)%>"/>/></td>
				</tr>
				<tr>
					<td/>
					<td><input type="submit" name="Update"/>
    				<input type="reset" name="reset"/></td>
				</tr>
			</form>
		</table>
		</div>
		<%} %>
		<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>