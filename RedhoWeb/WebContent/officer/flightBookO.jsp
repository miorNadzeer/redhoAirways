<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redha Airways</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<script>
function toggle() {
 if( document.getElementById("hidethis").style.display=='table-row' ){
   	document.getElementById("hidethis").style.display = 'none'; // set to table-row instead of an empty string
 }
 else{
   document.getElementById("hidethis").style.display = 'table-row';
 }
}
</script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h2>Flight booking</h2>
	<form method="post" action="getFlight1.jsp">
		<table width="542" border="0">
  <tr>
    <td width="127">Flight Type</td>
    <td colspan="3"><input type="radio" name="type" value="Round Trip" onClick="toggle();" checked="checked">Round Trip
    <input type="radio" name="type" value="One Way" onClick="toggle();">One Way</td>
  </tr>
  <tr>
    <td>Flight Class</td>
    <td colspan="3"><input type="radio" name="class" value="Business" checked="checked">Business
					<input type="radio" name="class" value="Economy">Economy</td>
  </tr>
  <tr>
    <td>Flight Origin</td>
    <td colspan="3"><select name="origin">
                    	<option value="-1">Please select</option>
                        <option value="Alor Setar">Alor Setar</option>
                        <option value="Penang">Penang</option>
						<option value="Kuala Lumpur">Kuala Lumpur</option>
						<option value="Kuching">Kuching</option>
						<option value="Kota Kinabalu">Kota Kinabalu</option>
                      </select></td>
  </tr>
  <tr>
    <td>Flight Destination</td>
    <td colspan="3"><select name="destination">
                    	<option value="-1">Please select</option>
                        <option value="Alor Setar">Alor Setar</option>
                        <option value="Penang">Penang</option>
						<option value="Kuala Lumpur">Kuala Lumpur</option>
						<option value="Kuching">Kuching</option>
						<option value="Kota Kinabalu">Kota Kinabalu</option>
                      </select></td>
  </tr>
  <tr>
    <td>Depart date</td>
    <td width="190"><input type="date" name="ddate" id="ddate"/></td>
    <td width="85">Depart time</td>
    <td width="112"><select name="dtime">
                    	<option value="-1">Please select</option>
                        <option value="0800">8AM</option>
                        <option value="1000">10AM</option>
						<option value="2100">9PM</option>
                      </select></td>
  </tr>
  <tr id="hidethis" style="display:table-row;">
    <td>Return date</td>
    <td><input type="date" name="rdate" id="rdate" /></td>
    <td>Return time</td>
    <td><select name="rtime">
                    	<option value="">Please select</option>
                        <option value="0800">8AM</option>
                        <option value="1000">10AM</option>
						<option value="2100">9PM</option>
                      </select></td>
  </tr>
  <tr>
    <td>Adult</td>
    <td colspan="3"><input type="number" name="adult"/></td>
  </tr>
  <tr>
    <td>Child</td>
    <td colspan="3"><input type="number" name="child"/></td>
  </tr>
  <tr>
    <td>Additional weight</td>
    <td colspan="3"><input name="weight" type="text"></td>
  </tr>
  <tr>
    <td>Inflight meal</td>
    <td colspan="3"><input type="radio" name="meal" value="Yes" checked="checked">Yes
					<input type="radio" name="meal" value="No">No</td>
  </tr>
  <tr>
  	<td>Nationality</td>
    <td colspan="3"><input type="radio" name="nation" value="Malaysia" checked="checked">Malaysia
					<input type="radio" name="nation" value="Foreigner">Foreigner</td>
  </tr>
  <tr>
		<td>Last name	: </td>
		<td><input type="text" name="lastName"/></td>
	</tr>
     <tr>
		<td>First name	: </td>
		<td><input type="text" name="firstName"/></td>
	</tr>
  <tr>
    <td>Customer IC</td>
    <td colspan="3"><input name="ic" type="text"></td>
  </tr>
  <tr>
    <td>Incharge officer ID</td>
    <td colspan="3"><input name="officer" type="text"></td>
  </tr>
  <tr>
   	<td/>
    <td><input type="submit" name="submit"/>
    	<input type="reset" name="reset"/></td>
  </tr>
</table>

	</form>
	<p><a href="officerMain.html">Back to main page</a></p>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>