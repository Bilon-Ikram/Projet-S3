<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Se connecter</title>
</head>
<body>
	<form action="Login?action=in" method="post">
	
        <label for="loginU">Login:</label>
        <input type="text" id="loginU" name="loginU" required> <br>

        <label for="pwdU">Mot de Passe:</label>
        <input type="password" id="pwdU" name="pwdU" required>   <br>
        
        <input type="submit" value="Se connecter">
        
     </form>
	<a href="Login?action=upForm">S'inscrire</a>
</body>
</html>