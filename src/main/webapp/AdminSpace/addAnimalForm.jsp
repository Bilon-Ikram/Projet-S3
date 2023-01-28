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
        #addPet {
            color: #fff;
    		background: var(--dark);
        }
    </style>
    
<title>Add a pet record</title>
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
            <form id="form" enctype="multipart/form-data" action="Pets?action=add" method="post">
                <!-- Card header -->
                <div class="card-header" style="background: #F2EECA;">
                    <h4 class="fw-bold text-center">Ajouter un animal domestique</h4>
                </div>

                <!-- Card body -->
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="typePet" class="form-label">Type</label>
                                <select class="form-select" name="typePet" id="typePet">
                                    <option value="Chat">Chat</option>
                                    <option value="Chien">Chien</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="racePet" class="form-label">Race</label>
                                <input type="text" class="form-control" id="racePet" name="racePet" required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="nomPet" class="form-label">Nom</label>
                                <input type="text" class="form-control" id="nomPet" name="nomPet" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="sexePet" class="form-label">Sexe</label><br>
                                <input class="form-check-input" type="radio" name="sexePet" id="femelle" value="femelle" required>
                                <label class="col-sm-4 form-check-label" for="femelle">
                                    Femelle
                                </label>
                                <input class="form-check-input" type="radio" name="sexePet" id="male" value="male" required>
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
                                <input type="date" class="form-control" id="datePet" name="datePet" min="2001-01-01" max="${dateCourrante}" required>
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
                                <input type="text" class="form-control" id="prixPet" name="prixPet" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="statutPet" class="form-label">Statut</label>
                                <select class="form-select" name="statutPet"  id="statutPet" aria-label=".form-select-sm example">
                                    <option value="Acheté" >Acheté</option>
                                    <option value="Disponible" >Disponible</option>
                                    <option value="Réservé" >Réservé</option>
                                    <option value="Vendu" >Vendu</option>
                                </select>
                            </div>
                        </div>
                    </div>


                <!-- Card footer -->
                <div class="card-footer text-center">
                <button type="submit" class="btn btn-danger me-4">Ajouter</button>
                <button type="button" class="btn btn-primary "><a style="text-decoration:none;color:white;" href='Pets'>Annuler</a></button>                   
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