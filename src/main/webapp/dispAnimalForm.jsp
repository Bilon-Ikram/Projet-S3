<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recherche des pets disponibles</title>
</head>
<body>
	<h3>Recherche des animaux domestiques disponibles</h3>
	
	<form id="form" action="Pets?action=dispoPets" method="post">
		 <label for="typePet" class="form-label">Type :</label>
         <select class="form-select" name="typePet" id="typePet" onchange="showDiv(this)">
         	<option value="Chat">Chat</option>
            <option value="Chien">Chien</option>
         </select>
         <br>
         <br> 
         
         <div id="raceChat">
	         <label for="racePet" class="form-label">Race :</label>
	         <select class="form-select" name="raceChat" id="racePet" >
	         	<option value="Bengal">Bengal</option>
	            <option value="Maine Coon">Maine Coon</option>
	            <option value="Sacré de Birmanie">Sacré de Birmanie</option>
	         </select>
         </div>
         <div id="raceChien" style="display:none;">
         <label for="racePet" class="form-label">Race :</label>
         <select class="form-select" name="raceChien" id="racePet">
         	<option value="Boxer">Boxer</option>
            <option value="Golden Retreiver">Golden Retreiver</option>
         </select>
         </div>

         <label for="sexePet" class="form-label">Sexe :</label>
         <input class="form-check-input" type="radio" name="sexePet" id="femelle" value="femelle" required>
         <label class="col-sm-4 form-check-label" for="femelle">Femelle</label>
         
         <input class="form-check-input" type="radio" name="sexePet" id="male" value="male" required>
         <label class="form-check-label" for="male">Male  </label>  
         <br>
         <br> 
         
         <div id="ageChat">
	         <label for="agePet" class="form-label">Age :</label>
	         <select class="form-select" name="ageChat" id="agePet">
	         	<option value="Chaton">Chaton</option>   <!-- Chatton/Chiot -->
	            <option value="Adulte">Adulte</option>
	         </select>
         </div>
         
         <div id="ageChien" style="display:none;">
	         <label for="agePet" class="form-label">Age :</label>
	         <select class="form-select" name="ageChien" id="agePet">
	         	<option value="Chiot">Chiot</option>   <!-- Chatton/Chiot -->
	            <option value="Adulte">Adulte</option>
	         </select>
         </div>
         <br>              
         <br>  
                        
         <input type="submit" value="Chercher" >
         
         
     </form>
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
	</script>

</body>
</html>