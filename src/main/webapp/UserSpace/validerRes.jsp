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
        
		.card {
            width:40%;
            margin-left: auto;
            margin-right: auto;
            margin-top:5em;
        }

	</style>

<title>Valider Réservation</title>
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
	<%@ include file='dashboardUser.jsp'%>
	<div class="inner-content">
		<div class="container mt-5">
        <div class="card">
                <!-- Card header -->
                <div class="card-header" style="background: #F2EECA;">
                    <h5 class="fw-bold text-center">Demande de réservation</h5>
                </div>
                <!-- Card body -->
	            <div class="card-body">
	            <img src='<c:out value="${PetsImages}${pet.getPhoto()}"/>' class="rounded mx-auto d-block" style="width: 80px; height: 80px;">
	            	<table  align=center>           	
	            		<tr>
	            			<td><b>Type </b></td>
	            			<td style="padding-left: 10px;"><b>: </b><c:out value="${pet.getType()}"/></td>
	            		</tr>
	            		
	            		<tr>
	            			<td><b>Race </b></td>

	            			<td style="padding-left: 10px;"><b>: </b> <c:out value="${pet.getRace()}"/></td>
	            		</tr>
	            		<tr>
	            			<td><b>Nom </b></td>
	            			<td style="padding-left: 10px;"><b>: </b> <c:out value="${pet.getNom()}"/></td>
	            		</tr>	
	            		<tr>
	            			<td><b>Sexe</b></td>
	            			<td style="padding-left: 10px;"><b>:</b> <c:out value="${pet.getSexe()}"/></td>
	            		</tr>	
	            		            		
	            		<tr>
	            			<td><b>DDN</b></td>
	            			<td style="padding-left: 10px;"><b>:</b> <c:out value="${pet.getDateNaissance()}"/></td>
	            		</tr>	
	            		<tr>
	            			<td><b>Prix</b></td>
	            			<td style="padding-left: 10px;"><b>:</b> <c:out value="${pet.getPrix()}"/></td>
	            		</tr>	            		            		            			            	
	            	</table>

				</div>

                <!-- Card footer -->
                <div class="card-footer text-center">
				<button type="button" class="btn btn-success" ><a style="text-decoration:none;color:white;" href='Reserv?action=ajouRes&idPet=<c:out value="${pet.getId()}"/>&cin=<c:out value="${cin}"/>'>Valider</a></button>              
                <button type="button" class="btn btn-primary "><a style="text-decoration:none;color:white;" href='Pets?action=searchPet'>Annuler</a></button>                   
                </div>
            
        </div>
	</div>
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