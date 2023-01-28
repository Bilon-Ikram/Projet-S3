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
	</style>

<title>Mon profile</title>
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
            <form id="form"  action="Login?action=upUser" method="post">
                <!-- Card header -->
                <div class="card-header" style="background: #F2EECA;">
                    <h4 class="fw-bold text-center">Mon profile</h4>
                </div>

                <!-- Card body -->
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="cinU" class="form-label">CIN</label>
								<input type="text" class="form-control" id="cinU" name="cinU" value='<c:out value="${user.getCinU()}" />' readonly required>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="nomU" class="form-label">Nom</label>
                                <input type="text" class="form-control" id="nomU" name="nomU" value='<c:out value="${user.getNomU()}" />' required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="prenomU" class="form-label">Prénom</label>
                                <input type="text" class="form-control" id="prenomU" name="prenomU" value='<c:out value="${user.getPrenomU()}" />' required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="sexeU" class="form-label">Sexe</label><br>
                                <input class="form-check-input" type="radio" name="sexeU" id="femelle" value="femelle" <c:if test="${user.getSexeU()== 'femelle'}"><c:out value="checked" /></c:if> required>
                                <label class="col-sm-4 form-check-label" for="femelle">
                                    Femelle
                                </label>
                                <input class="form-check-input" type="radio" name="sexeU" id="male" value="male" <c:if test="${user.getSexeU()== 'male'}"><c:out value="checked" /></c:if> required>
                                <label class="form-check-label" for="male">
                                    Male
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="phoneU" class="form-label">Téléphone</label>
                                <input type="text" class="form-control" id="phoneU" name="phoneU" value='<c:out value="${user.getPhoneU()}" />' required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="emailU" class="form-label">Email</label>
                                <input class="form-control" type="text" name="emailU" id="emailU" value='<c:out value="${user.getEmailU()}" />' required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="loginU" class="form-label">Login</label>
                                <input type="text" class="form-control" id="loginU" name="loginU" value='<c:out value="${user.getLoginU()}" />' required>
                            </div>
                        </div>
                        <div class="col-md-6">
                           <div class="mb-3">
								<label for="pwdU" class="form-label">Mot de passe</label><br>
								<button id="pwdU" type="button" class="btn btn-dark "><a style="text-decoration:none;color:white;" href='Login?action=editPwd'>Changer mon mot de passe</a></button>
                            </div>

                            
                        </div>
                    </div>


                <!-- Card footer -->
                <div class="card-footer text-center">
                <button type="submit" class="btn btn-danger me-4">Enregistrer</button>
                <button type="button" class="btn btn-primary "><a style="text-decoration:none;color:white;" href='#'>Annuler</a></button>                   
                </div>
            </form>
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