<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<link href="css/formLogin_Style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<title>Sign in</title>
</head>
<body>
    <jsp:include page="mainmenu.jsp"/>
    <section class="h-100 gradient-form" style="background-color: #eee;">
        <div class="container py-5 h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-xl-10">
              <div class="card rounded-3 text-black">
                <div class="row g-0">
                  <div class="col-lg-6">
                    <div class="card-body p-md-5 mx-md-4">
      
                      <div class="text-center">
                        <img src="img/cat.svg"
                          style="width: 185px;" alt="logo">
                        <h4 class="mt-1 mb-5 pb-1">We are UrPet Team</h4>
                      </div>
      
                      <form action="Login?action=in" method="post">
                        <p>Please login to your account</p>
      
                        <div class="form-outline mb-4">
                          <input type="text" id="loginU" name="loginU" required class="form-control"
                            placeholder="Enter your username" />
                        </div>
      
                        <div class="form-outline mb-4">
    	                 <div class="input-group ">
							<input type="password" class="form-control" id="pwdU" name="pwdU" placeholder="enter your password" required>
	  						<div class="input-group-append">
	    					<span class="input-group-text" onclick="password_show_hide('pwdU');" style="height:100%;" >
	    						<i class="fas fa-eye" id="show_eyepwdU"></i>
					            <i class="fas fa-eye-slash d-none" id="hide_eyepwdU"></i>
	    					</span>
	  					</div>
						</div>                    
                        </div>

                        <div class="text-center pt-1 mb-5 pb-1">
                        	<button type="submit" class="btn btn-success">Log in</button>                          
                        </div>
       
                      </form>
                        
                         <div class="d-flex align-items-center justify-content-center pb-4">
                          <p class="mb-0 me-2">Don't have an account?</p>
                          <button type="button" class="btn btn-outline-success"><a href="Login?action=upForm" style="text-decoration:none;color:black;">Create new</a></button>
                        </div>                          
                   
      
                    </div>
                  </div>
                  <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                    <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                      <h4 class="mb-4 text-center">We are more than just a company</h4>
                      <p class="small mb-0"><B>UrPet</B> est une société qui elevent des animaux domestiques avec soin et amour notamment les 
                      chats et les chiens. Notre objectif ultime est de vous satisfaire  et de vous permettre d'acquérir des animaux domestiques bien eduqué et en bonne santé.
                      </p>
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