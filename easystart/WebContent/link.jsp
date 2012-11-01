<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1" import = "dataconnection.JDBC" import = "java.sql.Connection" 
    import = "businessmodel.ImplementMethods" 
    import = "businessmodel.userbean" 
    import = "businessmodel.ToDoMethods"
    import = "businessmodel.Link" 
    import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>zu anderen link</title>
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

<%
JDBC myjdbc = new JDBC();
Connection connection = myjdbc.connect();

ToDoMethods third = new ImplementMethods(connection);

java.util.List<String> mylink = third.addlink();
List<Link> myLinks = third.getLinks();
myjdbc.closeconnection();
%>

<div id ="mytable"> 

<h3>Zu anderen Seiten</h3> 
 <%
 for (Iterator<Link> i = myLinks.iterator(); i.hasNext();){%>
	 <a href ="<%=i.next().getDescription()%>" target = "blank"  title = "<%=i.next().getTitle()%>"><%=i.next().getUrl()%></a><br>
 <%}%>
</div>
</body>
</html>