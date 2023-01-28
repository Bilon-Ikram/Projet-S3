<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/style.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	<style>
		.content{
        	background-color: #edf5f582;
        }
        .table{
        	background-color:white;
        }
        #clients {
        	color: #fff;
    		background: var(--dark);
    		border-color: #fff;
        }
	</style>

<title>Liste des clients</title>
</head>
<body>
	<%
	//This block of code (3 first lines) prevents Back button after Logout 
	//To add in all pages secured by sessions
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); //http 1.1
	response.setHeader("Pragma", "no-cache"); //http 1.0
	response.setHeader("Expires", "0"); //Proxies

	if (session.getAttribute("cinU") == null || session.getAttribute("loginU") == null
			|| session.getAttribute("typeU") == null) {
		response.sendRedirect("Login");

	} else {
	%>
	<%@ include file='dashboard.jsp'%>
	<div class="inner-content">
		<table class="table table-bordered"
			style="width: 90%; margin-left: auto; margin-right: auto; font-size: 0.94em;margin-top:3em;">
			<thead style="position: sticky;top: 0">
			<tr style="background: #F2EECA;">
				<th>CIN</th>
				<th>Nom</th>
				<th>Prénom</th>
				<th>Sexe</th>
				<th>Téléphone</th>
				<th style="text-align:center;">Email</th>
				<th style="text-align:center;">Login</th>
				<th style="text-align:center;">Mot de passe</th>
			</tr>
			</thead>
			<c:forEach var="client" items="${all}" varStatus="boucle">
				<tr>

					<td><c:out value="${client.getCinU()}" /></td>

					<td><c:out value="${client.getNomU()}" /></td>

					<td><c:out value="${client.getPrenomU()}" /></td>

					<td><c:out value="${client.getSexeU()}" /></td>

					<td><c:out value="${client.getPhoneU()}" /></td>

					<td style="text-align:center;"><c:out value="${client.getEmailU()}" /></td>
					
					<td style="text-align:center;"><c:out value="${client.getLoginU()}" /></td>

					<td style="text-align:center;"><c:out value="${client.getPwdU()}" /></td>
					
				</tr>
			</c:forEach>
		</table>

	</div>

	</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="js/main.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
	<%
	}
	%>
</body>
</html>
