<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
    pageEncoding="ISO-8859-2"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<title> Text form</title>
<link rel="stylesheet" type="text/css" href="css/form.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/functions.js"></script>
<title>form</title>

</head>

<body>


<div id = "container">
  
<div>

<form  name = "theform" action ="FormServlet"  method ="post" onsubmit="return isBlank();">
<img src="images/schreiben1.png" width="802" height="20" />
<textarea id= "textarea" name="text"  cols="97" rows="20"> 
</textarea><br />

<div id="apDiv1"><input type="image" src="images/save.jpg" alt="Submit Form" /></div>

</form>

</div>

<div id="apDiv3"><input type="image" src="images/drucken.jpg" onclick="printer()" /></div>

<div id="apDiv2"><input type="image" src="images/mail.jpg"/></div>

</div>

</body>
</html>