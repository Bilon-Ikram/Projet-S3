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
	<title>Modifier Mot de Passe</title>
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
            <form id="form"  action="Login?action=upPwd" method="post">
                <!-- Card header -->
                <div class="card-header" style="background: #F2EECA;">
                    <h5 class="fw-bold text-center">Modifier mot de passe</h5>
                </div>

                <!-- Card body -->
                <div class="card-body">
                    <div class="row">
                            <label for="pwdAct" class="form-label">Mot de passe</label>
                            <div class="mb-3">
	                            <div class="input-group ">
									<input type="password" class="form-control" id="pwdAct" name="pwdAct" required>
	  								<div class="input-group-append">
	    								<span class="input-group-text" onclick="password_show_hide('pwdAct');" style="height:100%;" >
	    									<i class="fas fa-eye" id="show_eyepwdAct"></i>
					                  		<i class="fas fa-eye-slash d-none" id="hide_eyepwdAct"></i>
	    								</span>
	  								</div>
								</div>
								<p style='color:red;font-size:0.8em;margin-bottom:0;float:right;'>${pwdErrA}</p>
                            </div>

							
                    		
                            <label for="pwdU" class="form-label">Nouveau mot de passe</label>
                            <div class="input-group mb-3">
								<input type="password" class="form-control" id="pwdU" name="pwdU" required>
  								<div class="input-group-append">
    								<span class="input-group-text" onclick="password_show_hide('pwdU');" style="height:100%;" >
    									<i class="fas fa-eye" id="show_eyepwdU"></i>
				                  		<i class="fas fa-eye-slash d-none" id="hide_eyepwdU"></i>
    								</span>
  								</div>
							</div>
							
							<label for="confirmPwdU" class="form-label">Confirmer mot de passe</label>
							<div class="mb-3">
	                            <div class="input-group ">
									<input type="password" class="form-control" id="confirmPwdU" name="confirmPwdU" required>
	  								<div class="input-group-append">
	    								<span class="input-group-text" onclick="password_show_hide('confirmPwdU');" style="height:100%;" >
	    									<i class="fas fa-eye" id="show_eyeconfirmPwdU"></i>
					                  		<i class="fas fa-eye-slash d-none" id="hide_eyeconfirmPwdU"></i>
	    								</span>
	  								</div>
								</div>
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
	<script>
	function password_show_hide(id) {
	  var x = document.getElementById(id);
	  var show_eye = document.getElementById("show_eye"+id);
	  var hide_eye = document.getElementById("hide_eye"+id);
	  hide_eye.classList.remove("d-none");
	  if (x.type === "password") {
	    x.type = "text";
	    show_eye.style.display = "none";
	    hide_eye.style.display = "block";
	  } else {
	    x.type = "password";
	    show_eye.style.display = "block";
	    hide_eye.style.display = "none";
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