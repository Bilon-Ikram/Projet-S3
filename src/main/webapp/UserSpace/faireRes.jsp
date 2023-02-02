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
        #res {
        	color: #fff;
    		background: var(--dark);
    		border-color: #fff;
        }
        
        #addRes {
            color: #fff;
    		background: var(--dark);
        }        
        
        .inner-content {
			display:flex;
			/*border: 1px solid red;*/
			
        
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
        	padding-left:330px;
        }
        
		.result-grid {
			/*border: 1px solid blue;*/
			padding:1em 0;
		}
		
        .pet-card {
        	border:1px solid red;
        	
        }
	</style>

<title>Faire une demande d'achat</title>
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
	<%@ include file='dashboardUser.jsp'%>
	<div class="inner-content">
		<div class="search-pet-form">
		<h5 class="text-center" style="color:green;">Animaux disponibles</h5>
	<form id="form" method="post" action="Pets?action=dispoPets">
		 <label for="typePet" class="form-label">Type :</label>
         <select class="form-select" name="typePet" id="typePet" onchange="showDiv(this)" style="background-color:#eeeeee4d;" >
         	<option >Choisir</option>
         	<option value="Chat" <c:if test="${type== 'Chat'}"><c:out value="selected" /></c:if>> Chat</option>
            <option value="Chien" <c:if test="${type== 'Chien'}"><c:out value="selected" /></c:if>>Chien</option>
         </select>

         <div id="raceChat">
	         <label for="raceChatS" class="form-label mt-2">Race :</label>
	         <select class="form-select" name="raceChat" id="raceChatS" style="background-color:#eeeeee4d;">
	         	<option >Choisir</option>
	         	<option value="Bengal" <c:if test="${race== 'Bengal'}"><c:out value="selected" /></c:if>>Bengal</option>
	            <option value="Maine Coon" <c:if test="${race== 'Maine Coon'}"><c:out value="selected" /></c:if>>Maine Coon</option>
	            <option value="Sacré de Birmanie" <c:if test="${race== 'Sacré de Birmanie'}"><c:out value="selected" /></c:if>>Sacré de Birmanie</option>
	         </select>
         </div>
         <div id="raceChien" style="display:none;">
         <label for="raceChienS" class="form-label mt-2" >Race :</label>
         <select class="form-select" name="raceChien" id="raceChienS" style="background-color:#eeeeee4d;">
         	<option  >Choisir</option>
         	<option value="Boxer" <c:if test="${race== 'Boxer'}"><c:out value="selected" /></c:if>>Boxer</option>
            <option value="Golden Retreiver" <c:if test="${race== 'Golden Retreiver'}"><c:out value="selected" /></c:if>>Golden Retreiver</option>
         </select>
         </div>

         <label for="sexePet" class="form-label mt-2">Sexe :</label><br>
         <input style="margin-left:48px;" class="form-check-input" type="radio" name="sexePet" id="femelle" value="femelle" <c:if test="${sexe== 'femelle'}"><c:out value="checked" /></c:if> required>
         <label class="col-sm-4 form-check-label" for="femelle">Femelle</label>
         
         <input class="form-check-input" type="radio" name="sexePet" id="male" value="male" <c:if test="${sexe== 'male'}"><c:out value="checked" /></c:if> required>
         <label class="form-check-label" for="male">Male  </label>  

         
         <div id="ageChat">
	         <label for="agePet" class="form-label mt-2">Age :</label>
	         <select class="form-select" name="ageChat" id="agePet" style="background-color:#eeeeee4d;">
	         	<option>Choisir</option>
	         	<option value="Chaton" <c:if test="${age== 'Chaton'}"><c:out value="selected" /></c:if>>Chaton</option>   <!-- Chatton/Chiot -->
	            <option value="Adulte" <c:if test="${age== 'Adulte'}"><c:out value="selected" /></c:if>>Adulte</option>
	         </select>
         </div>
         
         <div id="ageChien" style="display:none;">
	         <label for="agePet" class="form-label mt-2">Age :</label>
	         <select class="form-select" name="ageChien" id="agePet" style="background-color:#eeeeee4d;">
	         	<option>Choisir</option>
	         	<option value="Chiot" <c:if test="${age== 'Chiot'}"><c:out value="selected" /></c:if>>Chiot</option>   <!-- Chatton/Chiot -->
	         	<option value="Adulte" <c:if test="${age== 'Adulte'}"><c:out value="selected" /></c:if>>Adulte</option>
	         </select>
         </div>

                        
         <div class="text-center mt-3"><button type="submit" class="btn btn-danger" >Chercher</button></div>
         
         
     </form>
     
     </div>
     <div class="search-result">
     	<div class="result-grid">
			<div class="row">
			<c:if test="${firsTime=='vrai'}">
				<h5 style="margin-top:1.3em;text-align:center;">Veuillez remplir le formulaire pour visualiser les animaux</h5>
				<h5 style="text-align:center;">diponibles à réserver !</h5>
			</c:if>
			<c:if test="${size==0}">
				<h5 style="margin-top:1.3em;text-align:center;color:red;">Aucun animal domestique disponible correspondant à votre reherche !</h5>
				<h5 style="text-align:center;">Veuillez choisir d'autres critères.</h5>
			</c:if>
			<c:forEach var="pet" items="${all}" varStatus="boucle">
			  <div class="col-sm-4 mt-2">
			    <div class="card">
			      <div class="card-body">
			        <img src='<c:out value="${PetsImages}${pet.getPhoto()}"/>' class="rounded mx-auto d-block" style="width: 100%; height: 140px;">
			          <div class="detail-pet" style="padding-left:3em;padding-top:0.5em;padding-bottom:0.5em;">	
			          	<table>
			          		<tr>
			          			<td><B>Nom</B></td>
			          			<td><B>:</B> <c:out value="${pet.getNom()}"/> </td>
			          			
			          		<tr>
			          		<tr>
			          			<td><B>Prix</B></td>
			          			<td><B>:</B> <c:out value="${pet.getPrix()}"/></td>
			          		</tr>
			          	</table>			          
					  </div>
					  <div style="text-align:center">
					  	<a href='Pets?action=validRes&id=<c:out value="${pet.getId()}"/>' class="btn btn-dark" data-bs-toggle="modal" data-bs-target='#petModal<c:out value="${boucle.count}" />' >Réserver</a>
					  </div>
					<div class="modal fade" id='petModal<c:out value="${boucle.count}" />' tabindex="-1" aria-labelledby="petModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" style="width: 360px;">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title text-center" id="petModalLabel">Validation réservation :</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>							
								<div class="modal-body">
	            					<img src='<c:out value="${PetsImages}${pet.getPhoto()}"/>' class="rounded mx-auto d-block" style="width: 80px; height: 80px;">
									<div class="info-pet" style="width:70%;margin-top:8px;margin-left:70px;margin-right:auto;border=1px solid red;">
										<div class="row">
											<div class="col-md-4">
												<B>Race </B>
											</div>
											
											<div class="col-md-8">
												<B>:</B> <c:out value="${pet.getRace()}" />
											</div>										
										</div>
										<div class="row">
											<div class="col-md-4">
												<B>Sexe </B>
											</div>
											
											<div class="col-md-8">
												<B>:</B> <c:out value="${pet.getSexe()}" />
											</div>										
										</div>										
										<div class="row">
											<div class="col-md-4">
												<B>Nom </B>
											</div>
											
											<div class="col-md-8">
												<B>:</B> <c:out value="${pet.getNom()}" />
											</div>										
										</div>										
										<div class="row">
											<div class="col-md-4">
												<B>DDN </B>
											</div>
											
											<div class="col-md-8">
												<B>:</B> <c:out value="${pet.getDateNaissance()}" />
											</div>										
										</div>	
										
										<div class="row">
											<div class="col-md-4">
												<B>Prix </B>
											</div>
											
											<div class="col-md-8">
												<B>:</B> <c:out value="${pet.getPrix()}" />
											</div>										
										</div>										
																			
									</div>

								</div>
								<div class="modal-footer">
								<button type="button" class="btn btn-success" ><a style="text-decoration:none;color:white;" href='Reserv?action=ajouRes&idPet=<c:out value="${pet.getId()}"/>&cin=<%= session.getAttribute("cinU")%>'>Valider</a></button>								
								
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
								</div>
							</div>
						</div>
					</div>					  
			        
			      </div>
			    </div>
			  </div>			  
			  </c:forEach>	
			 
			 			  			  
		   </div>
     	</div>

     </div>

	</div>

	</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="js/main.js"></script>
	     <script type="text/javascript">
		function showDiv(select){
		   if(select.value=="Chien"){
			 document.getElementById('raceChat').style.display = "none";
		     document.getElementById('raceChien').style.display = "block";
		     
		     document.getElementById('ageChat').style.display = "none";
		     document.getElementById('ageChien').style.display = "block";
		    
		   } else{
			   document.getElementById('raceChat').style.display = "block";
		       document.getElementById('raceChien').style.display = "none";
		       
			   document.getElementById('ageChat').style.display = "block";
			   document.getElementById('ageChien').style.display = "none";
		   }
		} 
		
		function showChien(){
			var typePet=document.getElementById('typePet');
			if(typePet.value=="Chien"){
				 document.getElementById('raceChat').style.display = "none";
			     document.getElementById('raceChien').style.display = "block";
			     
			     document.getElementById('ageChat').style.display = "none";
			     document.getElementById('ageChien').style.display = "block";
			}
		}
		
		function check(){
			var typePet=document.getElementById('typePet');
			var raceChat=document.getElementById('raceChat');
			var raceChien=document.getElementById('raceChien');
			var ageChat=document.getElementById('ageChat');
			var ageChien=document.getElementById('ageChien');
			if(typePet!=null && (raceChat!=null || raceChien!=null) && (ageChat!=null || ageChien!=null)){
				document.getElementById("form").method="POST";
				document.getElementById("form").action="Pets?action=dispoPets";
				document.getElementById("form").submit();
			}
			else{
				if (typePet==null){
					alert("Veuillez choisir un type !");
				}
				else{
					if(raceChat==null || raceChien==null){
						alert("Veuillez choisir une race !");
					}
					if(ageChat==null || ageChien==null){
						alert("Veuillez choisir un age!");
					}				
				}
			}
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
	<%
	}
	%>
</body>
</html>