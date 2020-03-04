<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redha Airways</title>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<%  
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String lastName = request.getParameter("lastName");
		String firstName = request.getParameter("firstName");
		String tel = request.getParameter("tel");
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = DriverManager.getConnection
		("jdbc:mysql://localhost/redhoairways" , "root", "kucing3");		
		Statement statement = connection.createStatement();
		
		ResultSet rs = statement.executeQuery("update counterofficer set staff_email = '"+email+"', staff_pass = '"+password+"'"
				+", staff_last_name ='"+lastName+"', staff_first_name = '"+firstName+"', staff_tel = '"+tel+"'");
		response.sendRedirect("viewStaff.jsp");
	%>
	<jsp:forward page="viewStaff.jsp"></jsp:forward>
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>