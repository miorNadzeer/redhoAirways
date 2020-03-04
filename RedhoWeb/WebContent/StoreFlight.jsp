<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="redho.Flight"%>
<jsp:useBean id="flightId" class="redho.Flight" scope="session"></jsp:useBean>
<jsp:useBean id="storeDataID" class="redho.StoreFlight" scope="application"></jsp:useBean>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redha Airways</title>
</head>
<body>
	<%   
		out.println("Successfully book");
		storeDataID.flightStore(flightId);
    %>
    </br>
    <a href="customerMain.html">Back to main page</a>
</body>
</html>