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
        .inner-content {
			display:flex;
			/*border: 1px solid red;*/
			
        
        }
        #res {
        	color: #fff;
    		background: var(--dark);
    		border-color: #fff;
        }
        
        #allRes {
            color: #fff;
    		background: var(--dark);
        }
        
        .search-pet-form{
        	border: 1px solid #e1e1e1;
        	width:20%;
        	position:fixed;
        	margin-top:1.6em;
        	background: white;
        	padding: 1em;
        	border-radius: 20px;
        	margin-left: 1em;
        

        }
        .search-result{
        	/*border: 1px solid green;*/
        	width:100%;
        	padding-left:300px;
        }
        
		.result-grid {
			/*border: 1px solid blue;*/
			padding:1em 0;
		}
		
        .pet-card {
        	border:1px solid red;
        	
        }
	</style>

<title>Liste des réservations</title>
</head>
<body onload="showChien()">
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
		<div class="search-pet-form">
		<h5 class="text-center" style="color:green;">Les réservations</h5>
		<form id="form" method="post" action='Reserv?action=allResAdmin'>
		
         <select class="form-select" name="statutRes" id="statutRes" style="margin-top:1em;background-color:#eeeeee4d;" >
         	<option >Statut</option>
         	<option value="En cours" <c:if test="${status== 'En cours'}"><c:out value="selected" /></c:if>>En cours</option>
         	<option value="Delai depasse" <c:if test="${status== 'Delai depasse'}"><c:out value="selected" /></c:if>>Délai dépassé</option>
            <option value="Payee" <c:if test="${status== 'Payee'}"><c:out value="selected" /></c:if>>Payée</option>
         </select>
           
         <div class="text-center mt-3"><button type="submit" class="btn btn-danger" >Chercher</button></div>
         
         
     </form>
     
     </div>
     <div class="search-result">
     	<c:if test="${firsTime=='vrai'}">
				<h5 style="margin-top:1.3em;text-align:center;">Veuillez remplir le formulaire pour visualiser les réservations selon leurs statut</h5>
			</c:if>
			<c:if test="${all.size()==0}">
				<h5 style="margin-top:1.3em;text-align:center;color:red;">Aucun résultat correspondant à votre reherche !</h5>
		</c:if>
		<table class="table table-bordered"
			style="width: 90%; margin-left: auto; margin-right: auto; font-size: 0.94em;margin-top:2em;">
			<thead style="position: sticky;top: 0">
			<tr style="background: #F2EECA;">
				
				<th style="text-align: center;">CIN</th>
				<th style="text-align: center;">Nom</th>
				<th style="text-align: center;">Prénom</th>
				<th style="text-align: center;">Animal</th>
				<th style="text-align: center;">Date réservation</th>
						
				<th style="text-align: center;">Action</th>

			</tr>
			</thead>
			<c:forEach var="petRes" items="${all}" varStatus="boucle">
				<tr>

					<td><c:out value="${petRes.getUser().getCinU()}" /></td>
					<td><c:out value="${petRes.getUser().getNomU()}" /></td>
					<td><c:out value="${petRes.getUser().getPrenomU()}" /></td>
					
					<td style="text-align: center;"><button type="button" style="padding: 0.2em 0.6em; font-size :0.95em;" class="btn btn-success" data-bs-toggle="modal" data-bs-target='#petModal<c:out value="${boucle.count}" />'>Voir</button></td>
					
					<td style="text-align: center;"><c:out value="${petRes.getRes().getDateRes()}" /></td>


					<div class="modal fade" id='petModal<c:out value="${boucle.count}" />' tabindex="-1" aria-labelledby="petModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" style="width: 350px;">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title text-center" id="petModalLabel">Détails animal :</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>							
								<div class="modal-body">
	            					<img src='<c:out value="${PetsImages}${petRes.getPet().getPhoto()}"/>' class="rounded mx-auto d-block" style="width: 80px; height: 80px;">
									<div class="info-pet" style="width:60%;margin-top:10px;margin-left:70px;margin-right:auto;border=1px solid red;">
										<div class="row">
											<div class="col-md-3">
												<B>Race </B>
											</div>
											
											<div class="col-md-9">
												<B>:</B> <c:out value="${petRes.getPet().getRace()}" />
											</div>										
										</div>
										<div class="row">
											<div class="col-md-3">
												<B>Sexe </B>
											</div>
											
											<div class="col-md-9">
												<B>:</B> <c:out value="${petRes.getPet().getSexe()}" />
											</div>										
										</div>										
										<div class="row">
											<div class="col-md-3">
												<B>Nom </B>
											</div>
											
											<div class="col-md-9">
												<B>:</B> <c:out value="${petRes.getPet().getNom()}" />
											</div>										
										</div>										
										<div class="row">
											<div class="col-md-3">
												<B>DDN </B>
											</div>
											
											<div class="col-md-9">
												<B>:</B> <c:out value="${petRes.getPet().getDateNaissance()}" />
											</div>										
										</div>	
										
										<div class="row">
											<div class="col-md-3">
												<B>Prix </B>
											</div>
											
											<div class="col-md-9">
												<B>:</B> <c:out value="${petRes.getPet().getPrix()}" />
											</div>										
										</div>										
																			
									</div>
									

							
									
								</div>
								<div class="modal-footer">
									
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
								</div>
							</div>
						</div>
					</div>
					
					<div class="modal fade" id='delModal<c:out value="${boucle.count}" />' data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="delModalLabel" aria-hidden="true">
						<div class="modal-dialog ">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="delModalLabel">Annulation de réservation</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									Êtes-vous sûr de vouloir annuler cette réservation ?
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger">
										<a style="text-decoration:none;color:white;" href='Reserv?action=canResAdmin&cin=<c:out value="${petRes.getUser().getCinU()}" />&id=<c:out value="${petRes.getPet().getId()}" />&statut=<c:out value="${petRes.getRes().getStatutRes()}" />'>Oui</a>
									</button>
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
										Non
									</button>
								</div>
							</div>
						</div>
					</div>					

					
					<td style="text-align: center;">
						<c:if test='${petRes.getRes().getStatutRes()=="En cours"}'>
							<button type="button" style="padding: 0.2em 0.6em; font-size :0.95em;" class="btn btn-dark">
								<a style="text-decoration:none;color:white;" href='Reserv?action=appRes&cin=<c:out value="${petRes.getUser().getCinU()}" />&id=<c:out value="${petRes.getPet().getId()}" />'>Approuver</a>
							</button>
							<button type="button" style="padding: 0.2em 0.6em; font-size :0.95em;" class="btn btn-danger" data-bs-toggle="modal" data-bs-target='#delModal<c:out value="${boucle.count}" />'>
								Ignorer
							</button>							
						</c:if>
						
						<c:if test='${petRes.getRes().getStatutRes()=="Payee"}'>
							<button type="button" style="padding: 0.2em 0.6em; font-size :0.95em;" class="btn btn-warning">
							<a style="text-decoration:none;color:white;" href="P">Voir facture</a>
							</button>
						</c:if>
						
						<c:if test='${petRes.getRes().getStatutRes()=="Delai depasse"}'>
							<button type="button" style="padding: 0.2em 0.6em; font-size :0.95em;" class="btn btn-danger" data-bs-toggle="modal" data-bs-target='#delModal<c:out value="${boucle.count}" />'>
								Ignorer
							</button>
						</c:if>						
					</td>
					
					
			

				</tr>
			</c:forEach>
		</table>
		
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