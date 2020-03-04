<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %><%
   String name = request.getParameter( "username" );
   session.setAttribute( "theName", name );
%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redha Airways</title>
</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h2>Login</h2>
        <% 
            Connection connection = DriverManager.getConnection
            	("jdbc:mysql://localhost/redhoairways" , "root", "kucing3");

            Statement statement = connection.createStatement();

            String username=request.getParameter("username");
            String password=request.getParameter("password");
            PreparedStatement pst=connection.prepareStatement("Select user_type from user where username = ? and password = ? ");
            pst.setString(1,username);
            pst.setString(2,password);
            ResultSet rst=pst.executeQuery();
            if(rst.next()){
            	String type=rst.getString("user_type");
            	if("Admin".equals(type)){%>
                	<jsp:forward page="adminMain.html"/><%
                } 
               	else if("Counter officer".equals(type)){%>
                  	<jsp:forward page="officerMain.html"/><%
                }
               	else if("Customer".equals(type)){%>
              		<jsp:forward page="customerMain.html"/><%
            	}
                   
            }
            else{%>
      			<p>Invalid username or password</p><%
            }   
          
        %>
        <table border="0">
			<form method="post" action="login.jsp">
				<tr>
					<td>Username: </td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>Password: </td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td><input type = "submit" name = "Submit" value = "Submit"></td>
				</tr>
			</form>
		</table>
		<br>Don't have account?
        <a href="custRegistration.html">Register here. (Customer only)</a>
        <jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>