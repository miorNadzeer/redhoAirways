<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="redho.Officer"%>
<jsp:useBean id="officerId" class="redho.Officer" scope="session"></jsp:useBean>
<jsp:useBean id="storeDataId" class="redho.StoreOfficer" scope="application"></jsp:useBean>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redha Airways</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%    
      	storeDataId.storeOfficer(officerId);

     	 out.println("Full name: "+ officerId.getFirstName() + " " + officerId.getLastName()
     	 + "\nStaff Ic: "+ officerId.getIc()
     	 + "\nStaff is now registered in the database");
    %>
    <p><a href="registerOfficer.html">Add another staff</a></p>
    <p><a href="adminMain.html">Back to main page</a></p>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>