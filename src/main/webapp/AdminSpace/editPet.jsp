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
        .card {
            width:80%;
            margin-left: auto;
            margin-right: auto;
        }
        .content{
        	background-color:#f0ffff82;
        	background-color:#edf5f582;
        }
        
        #petsL {
        	color: #fff;
    		background: var(--dark);
    		border-color: #fff;
        }
    </style>
    
    <script type="text/javascript">
		function update(){
				document.getElementById("form").method="POST";
				document.getElementById("form").action="Pets?action=update&id=<c:out value='${pet.getId()}' />";
				document.getElementById("form").submit();
		}
		
	</script>
<title>Edit Pet Animal Informations</title>
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
	<div class="container mt-5">
        <div class="card">
            <form id="form" enctype="multipart/form-data">
                <!-- Card header -->
                <div class="card-header" style="background: #F2EECA;">
                    <h4 class="fw-bold text-center">Modifier les informations d'un animal</h4>
                </div>

                <!-- Card body -->
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="typePet" class="form-label">Type</label>
                                <select class="form-select" name="typePet" id="typePet">
                                    <option value="Chat" <c:if test="${pet.getType()== 'cat'}"><c:out value="selected" /></c:if>>Chat</option>
                                    <option value="Chien" <c:if test="${pet.getType()== 'dog'}"><c:out value="selected" /></c:if>>Chien</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="racePet" class="form-label">Race</label>
                                <input type="text" class="form-control" id="racePet" name="racePet" value='<c:out value="${pet.getRace()}" />' required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="nomPet" class="form-label">Nom</label>
                                <input type="text" class="form-control" id="nomPet" name="nomPet" value='<c:out value="${pet.getNom()}" />' required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="sexePet" class="form-label">Sexe</label><br>
                                <input class="form-check-input" type="radio" name="sexePet" id="femelle" value="femelle" <c:if test="${pet.getSexe()== 'femelle'}"><c:out value="checked" /></c:if> required>
                                <label class="col-sm-4 form-check-label" for="femelle">
                                    Femelle
                                </label>
                                <input class="form-check-input" type="radio" name="sexePet" id="male" value="male" <c:if test="${pet.getSexe()== 'male'}"><c:out value="checked" /></c:if> required>
                                <label class="form-check-label" for="male">
                                    Male
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="datePet" class="form-label">Date de naissance</label>
                                <input type="date" class="form-control" id="datePet" name="datePet" min="2001-01-01" max="${dateCourrante}" value='<c:out value="${pet.getDateNaissance()}" />'required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="photoPet" class="form-label">Photo</label>
                                <input class="form-control" type="file" name="photoPet" id="photoPet">
                                <p>${extErr}</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="prixPet" class="form-label">Prix</label>
                                <input type="text" class="form-control" id="prixPet" name="prixPet" value='<c:out value="${pet.getPrix()}" />' required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="statutPet" class="form-label">Statut</label>
                                <select class="form-select" name="statutPet"  id="statutPet" aria-label=".form-select-sm example">
                                    <option value="Acheté" <c:if test="${pet.getStatut()== 'Acheté'}"><c:out value="selected" /></c:if>>Acheté</option>
                                    <option value="Disponible" <c:if test="${pet.getStatut()== 'Disponible'}"><c:out value="selected" /></c:if>>Disponible</option>
                                    <option value="Réservé" <c:if test="${pet.getStatut()== 'Réservé'}"><c:out value="selected" /></c:if>>Réservé</option>
                                    <option value="Vendu" <c:if test="${pet.getStatut()== 'Vendu'}"><c:out value="selected" /></c:if>>Vendu</option>
                                </select>
                            </div>
                        </div>
                    </div>


                <!-- Card footer -->
                <div class="card-footer text-center">
                <button type="button" class="btn btn-danger me-4" data-bs-toggle="modal" data-bs-target='#editModal'>Modifier</button>
                <button type="button" class="btn btn-primary "><a style="text-decoration:none;color:white;" href='Pets'>Annuler</a></button>
					<div class="modal fade" id='editModal' data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
						<div class="modal-dialog ">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="editModalLabel">Validation du modification</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									Êtes-vous sûr de vouloir modifier les informations de cet enregistrement ?
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger" onclick='update()'>
										Oui
									</button>
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
										Non
									</button>
								</div>
							</div>
						</div>
					</div>                    
                </div>
            </form>
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