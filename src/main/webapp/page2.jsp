<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log out</title>
</head>
<body>
	<%
	//This block of code (3 first lines) prevents Back button after Logout 
	//To add in all pages secured by sessions
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); //http 1.1
	response.setHeader("Pragma", "no-cache"); //http 1.0
	response.setHeader("Expires", "0");  //Proxies
	
	if (session.getAttribute("CIN")==null || session.getAttribute("Nom")==null || session.getAttribute("Prénom")==null){
		response.sendRedirect("Login");
		
	}
	else{
	%>
	<h1>Change the page</h1>
	<a href="home.jsp">Retour</a>

	 <% }%>
</body>
</html>