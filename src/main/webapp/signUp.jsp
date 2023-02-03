<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<link href="css/form_style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>S'inscrire</title>
</head>
<body>
	<jsp:include page="mainmenu.jsp"/>
	
							
			<section class="h-100" style="background-color: #eee;">
				<div class="container py-5 h-100">
				  <div class="row d-flex justify-content-center align-items-center h-100">
					<div class="col">
					  <div class="card card-registration my-4">
						<div class="row g-0">
						  <div class="col-xl-6 d-none d-xl-block">
							<img src="img/petback.jpg"
							  alt="Sample photo" class="w-100"
							  style="border-top-left-radius: .50rem; border-bottom-left-radius: .50rem;
							  border-top-right-radius: .50rem; border-top-right-radius: .50rem;  height: 1000px;" />



						  </div>
						  <div class="col-xl-6">
							<div class="card-body p-md-5 text-black">
							  <h3 class="mb-5 text-uppercase"> registration form</h3>
			  				<form id="form" action="Login?action=up" method="post">
							  <div class="row">
								<!--<div class="col-md-3 mb-4">-->
									<div class="form-outline mb-2">
									  <input type="text" id="cinU" name="cinU" required class="form-control form-control-lg" />
									  <label class="form-label" for="cinU">CIN</label>
									</div>

								<div class="col-md-4 mb-4" style="display: inline-block;">
								
										
								  <div class="form-outline">
									<input type="text" id="nomU" name="nomU" required class="form-control form-control-lg" />
									<label class="form-label" for="nomU">Nom</label>
						
								  </div>
								</div>
								
								<div class="col-md-4 mb-4"style="display: inline-block;">
								  <div class="form-outline">
									<input type="text" id="prenomU" name="prenomU" required class="form-control form-control-lg" />
									<label class="form-label" for="prenomU">Prénom</label>
								  </div>
								</div>
							  </div>
			  
							  
			  
							  
			  
							  <div class="d-md-flex justify-content-start align-items-center mb-4 py-2">
			  
								<h6 class="mb-0 me-4 text-success">Sexe: </h6>
			  
								<div class="form-check form-check-inline mb-0 me-4">
								  <input class="form-check-input" type="radio" name="sexeU" value="femelle" id="femelle" />
								  <label class="form-check-label" for="femelle">Female</label>
								</div>
			  
								<div class="form-check form-check-inline mb-0 me-4">
								  <input class="form-check-input" id="male" type="radio" name="sexeU" value="male" required />
								  <label class="form-check-label" for="maleGender">Male</label>
								</div>
			  
								
			  
							  </div>
			  
							 
			  
							  
			  
							  <div class="form-outline mb-4">
      
                            <input type="text" id="phoneU" name="phoneU" required class="form-control">
							<label for="phoneU" class="form-label">Numéro de téléphone</label>

                            <i class='bx bxs-phone'></i>
							  </div>
			  
			  
							  <div class="form-outline mb-4">
								<input type="text" id="emailU" name="emailU" required class="form-control form-control-lg" />
								<label class="form-label" for="emailU">Adresse Email</label>
							  </div>
							  <div class="form-outline mb-3">
								<input type="text" id="loginU" name="loginU" required class="form-control form-control-lg" />
								<label class="form-label" for="loginU">Username</label>
							  </div>

							  

							  <div class="form-outline mb-4">
	    	                 <div class="input-group ">
			                    <input class="form-control" type="password" id="pwdU" name="pwdU" required>
	  							<div class="input-group-append">
	    							<span class="input-group-text" onclick="password_show_hide('pwdU');" style="height:100%;" >
	    								<i class="fas fa-eye" id="show_eyepwdU"></i>
					            		<i class="fas fa-eye-slash d-none" id="hide_eyepwdU"></i>
	    							</span>
	  							</div>
	  							
								</div> 
								<label for="pwdU" class="form-label">Mot de passe</label>

							  </div>
							  

							  <div class="form-outline mb-4">
	    	                 <div class="input-group ">
								<input class="form-control" type="password" id="confirmPwdU" name="confirmPwdU" required>
	  							<div class="input-group-append">
	    							<span class="input-group-text" onclick="password_show_hide('confirmPwdU');" style="height:100%;" >
	    								<i class="fas fa-eye" id="show_eyeconfirmPwdU"></i>
					            		<i class="fas fa-eye-slash d-none" id="hide_eyeconfirmPwdU"></i>
	    							</span>
	  							</div>
								</div> 
								<label for="confirmPwdU" class="form-label"> Confirmation mot de passe</label>
							  </div>
							  <div class="d-flex justify-content-end pt-3">
								<button type="submit" class="btn btn-success btn-lg ms-2">Créer un compte</button>
							  </div>
										 </form>
										  </div>
								



			  

			  
							</div>
						  </div>
						</div>
					  </div>
					</div>
				  </div>
				</div>
			  </section>

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





</body>
</html>