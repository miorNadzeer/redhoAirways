<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="redho.Customer"%>
<jsp:useBean id="customerId" class="redho.Customer" scope="session"></jsp:useBean>
<jsp:useBean id="storeDataId" class="redho.StoreCust" scope="application"></jsp:useBean>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redha Airways</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h2>Store customer data</h2>
	<%    
      	storeDataId.storeCust(customerId);

     	 out.println(customerId.getFirstName() + " " + 
    		customerId.getLastName() + " is now registered in the database");
    %>
    <p><a href="login.html">Login here.</a></p>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>