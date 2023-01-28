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
            width:40%;
            margin-left: auto;
            margin-right: auto;
            margin-top:5em;
        }
        .content{
        	background-color:#f0ffff82;
        	background-color:#edf5f582;
        }
	</style>

<title>Modifier mot de passe</title>
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
            <form id="form"  action="Login?action=upPwd" method="post">
                <!-- Card header -->
                <div class="card-header" style="background: #F2EECA;">
                    <h5 class="fw-bold text-center">Modifier mot de passe</h5>
                </div>

                <!-- Card body -->
                <div class="card-body">
                    <div class="row">
                            <div class="mb-3">
                                <label for="pwdAct" class="form-label">Mot de passe actuel</label>
								<input type="text" class="form-control" id="pwdAct" name="pwdAct" required>
				
								<p style='color:red;font-size:0.8em;margin-bottom:0;float:right;'>${pwdErrA}</p>
							
                            </div>
                            <div class="mb-3">
                                <label for="pwdU" class="form-label">Nouveau mot de passe</label>
								<input type="text" class="form-control" id="pwdU" name="pwdU" required>
                            </div>
                             <div class="mb-3">
                                <label for="confirmPwdU" class="form-label">Confirmer mot de passe</label>
								<input type="text" class="form-control" id="confirmPwdU" name="confirmPwdU" required>
								<p style='color:red;font-size:0.8em;margin-bottom:0;float:right;'>${pwdErrC}</p>
                            </div>                     

                    </div>

                <!-- Card footer -->
                <div class="card-footer text-center">
                <button type="submit" class="btn btn-danger me-4">Enregistrer</button>
                <button type="button" class="btn btn-primary "><a style="text-decoration:none;color:white;" href='Login?action=profile'>Annuler</a></button>                   
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