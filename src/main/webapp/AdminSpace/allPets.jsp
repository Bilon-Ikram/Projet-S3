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
        #petsL {
        	color: #fff;
    		background: var(--dark);
    		border-color: #fff;
        }
        
        #allPets {
            color: #fff;
    		background: var(--dark);
        }
	</style>

<title>Liste des animaux</title>
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
			style="width: 90%; margin-left: auto; margin-right: auto; font-size: 0.94em;margin-top:2em;">
			<thead style="position: sticky;top: 0">
			<tr style="background: #F2EECA;">
				<th>Type</th>
				<th>Race</th>
				<th>Nom</th>
				<th>Sexe</th>
				<th style="text-align: center;">Date de naissance</th>
				<th style="text-align: center;">Photo</th>
				<th>Prix</th>
				<th>Statut</th>
				<th style="text-align: center;">Modifier</th>
				<th style="text-align: center;">Supprimer</th>	
			</tr>
			</thead>
			<c:forEach var="pet" items="${all}" varStatus="boucle">
				<tr>

					<td><c:out value="${pet.getType()}" /></td>

					<td><c:out value="${pet.getRace()}" /></td>

					<td><c:out value="${pet.getNom()}" /></td>

					<td><c:out value="${pet.getSexe()}" /></td>

					<td style="text-align: center;"><c:out value="${pet.getDateNaissance()}" /></td>
					<div class="modal fade" id='petPhotoModal<c:out value="${pet.getNom()}" />' tabindex="-1" aria-labelledby="petPhotoModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" style="width: 400px;">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="petPhotoModalLabel"><c:out value="${pet.getNom()}" /></h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<img src='<c:out value="${PetsImages}${pet.getPhoto()}"/>' class="rounded mx-auto d-block" style="width: 90%; height: 250px;">
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary">Changer</button>
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
								</div>
							</div>
						</div>
					</div>
					<td style="text-align: center;"><button type="button" style="padding: 0.2em 0.6em; font-size :0.95em;" class="btn btn-success" data-bs-toggle="modal" data-bs-target='#petPhotoModal<c:out value="${pet.getNom()}" />'>Voir</button></td>
					
					<td><c:out value="${pet.getPrix()}" /></td>
					<td><c:out value="${pet.getStatut()}" /></td>
					
					<div class="modal fade" id='editModal<c:out value="${pet.getNom()}" />' data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
						<div class="modal-dialog ">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="editModalLabel">Validation du suppression</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									Êtes-vous sûr de vouloir supprimer cet enregistrement ?
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger">
										<a style="text-decoration:none;color:white;" href='Pets?action=del&id=<c:out value="${pet.getId()}" />&img=<c:out value="${pet.getPhoto()}" />'>Oui</a>
									</button>
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
										Non
									</button>
								</div>
							</div>
						</div>
					</div>
					
					<td style="text-align: center;">
						<button type="button" style="padding: 0.2em 0.6em; font-size :0.95em;" class="btn btn-warning">
							<a style="text-decoration:none;color:white;" href="Pets?action=edit&id=<c:out value='${pet.getId()}' />">Edit</a>
						</button>
					</td>
					
					
					
					
					<div class="modal fade" id='delModal<c:out value="${pet.getNom()}" />' data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="delModalLabel" aria-hidden="true">
						<div class="modal-dialog ">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="delModalLabel">Validation du suppression</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									Êtes-vous sûr de vouloir supprimer cet enregistrement ?
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger">
										<a style="text-decoration:none;color:white;" href='Pets?action=del&id=<c:out value="${pet.getId()}" />&img=<c:out value="${pet.getPhoto()}" />'>Oui</a>
									</button>
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
										Non
									</button>
								</div>
							</div>
						</div>
					</div>
					<td style="text-align: center;"><button type="button" style="padding: 0.2em 0.6em; font-size :0.95em;" class="btn btn-danger" data-bs-toggle="modal" data-bs-target='#delModal<c:out value="${pet.getNom()}" />'>Delete</button></td>

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
