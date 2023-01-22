<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Creating client account</title>

<script type="text/javascript">
	//This function checks either the password and the confirmed password are the same or not
	function chekPwd(){

		
		var pwd=document.getElementById("pwdU").value;
		var confirmPwd=document.getElementById("confirmPwdU").value;

		
		if (pwd!=confirmPwd){
			alert("Veuillez vérifier le mdp !");
		}
		else{
			document.getElementById("form").method="POST";
			document.getElementById("form").action="Login?action=up";
			document.getElementById("form").submit();
			
		}
	}


</script>
</head>
<body>
	<form id="form">
	
        <label for="cinU">CIN:</label>
        <input type="text" id="cinU" name="cinU" required> <br>	
	
        <label for="nomU">Nom:</label>
        <input type="text" id="nomU" name="nomU" required> <br>

        <label for="prenomU">Prénom:</label>
        <input type="text" id="prenomU" name="prenomU" required>   <br>

         Sexe:<br>
        <label for="male">Male:</label>
        <input type="radio" name="sexeU" value="male" required><br>

        <label for="femelle">femelle:</label>
        <input type="radio" name="sexeU" value="femelle" id="femelle"><br>
        
        <label for="phoneU">Numéro de téléphone:</label>
        <input type="text" id="phoneU" name="phoneU" required><br>

        <label for="emailU">Adresse email:</label>
        <input type="text" id="emailU" name="emailU" required><br>
        
        <label for="loginU">login:</label>
        <input type="text" id="loginU" name="loginU" required><br>

        <label for="pwdU">Mot de passe:</label>
        <input type="password" id="pwdU" name="pwdU" required><br>
        
        <label for="confirmPwdU">Confirmation du mot de passe:</label>
        <input type="password" id="confirmPwdU" name="confirmPwdU" required><br>   
  
        <button type="button" onclick="chekPwd()" >Créer un compte</button>
        
    </form>
    <a href="Login">Se connecter</a>

</body>
</html>