<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1" import = "dataconnection.JDBC" import = "java.sql.Connection" 
    import = "businessmodel.ImplementMethods" import = "businessmodel.userbean" import ="businessmodel.ToDoMethods" import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>textform</title>
<style type="text/css">
@CHARSET "utf-8";
body{
	background-color: #F7F7F7;
}

#mytable{
    border: 1px solid #ccc;
    background-color: #fff;
}
</style>
</head>
<body>
<!-- <h3> Text wurde Abgespeichert!</h3> -->
<%
JDBC myjdbc = new JDBC();
Connection connection = myjdbc.connect();

ToDoMethods two = new ImplementMethods(connection);

java.util.List<userbean> newtext = two.addnewtext();

myjdbc.closeconnection();
%>
<table id ="mytable">
<tr>
<th>text</th>
</tr>
<%  
    for(userbean c:newtext){
%>
<tr>
<td><%= c.getText()%></td>
</tr>
<%} %>
</table>
</body>
</html>