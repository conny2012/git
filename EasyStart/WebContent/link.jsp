<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1" import = "dataconnection.JDBC" import = "java.sql.Connection" 
    import = "businessmodel.ImplementMethods" import = "businessmodel.userbean" import ="businessmodel.ToDoMethods" import="java.util.*"  import = "businessmodel.Link" %>
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

#header{

color: #039;
text-align:center;
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

<h4 id ="header">Zu anderen Seiten</h4> 

<!--  
      for(Iterator<String> meiniterator = mylink.iterator(); meiniterator.hasNext();){ 
    	String s = meiniterator.next(); 
-->

<%--  <a href ="<%=mylink.get(0)%>" target = "blank"  title = "<%=mylink.get(2)%>"><%=mylink.get(1)%></a><br> --%>
<!--  <br> -->
<%--  <a href ="<%=mylink.get(3)%>" target = "blank"  title = "<%=mylink.get(5)%>"><%=mylink.get(4)%></a><br> --%>
<!--  <br>  -->
<%--  <a href ="<%=mylink.get(6)%>" target = "blank"  title = "<%=mylink.get(8)%>"><%=mylink.get(7)%></a><br> --%>
<!--  <br>  -->
<%--  <a href ="<%=mylink.get(9)%>" target = "blank"  title = "<%=mylink.get(11)%>"><%=mylink.get(10)%></a><br> --%>
<!--  <br>  -->
<%--  <a href ="<%=mylink.get(12)%>" target = "blank" title = "<%=mylink.get(14)%>"><%=mylink.get(13)%></a><br> --%>
<!--  <br>  -->
<%--  <a href ="<%=mylink.get(15)%>" target = "blank" title = "<%=mylink.get(17)%>"><%=mylink.get(16)%></a><br>    --%>
  
  

 
<%-- <%} %> --%>
 <%
 for (Iterator<Link> i = myLinks.iterator(); i.hasNext();){%>
	 <a href ="<%=i.next().getUrl()%>" target = "blank"  title = "<%=i.next().getDescription()%>"><%=i.next().getTitle()%></a><br>
 <%}%>
</div>
</body>
</html>