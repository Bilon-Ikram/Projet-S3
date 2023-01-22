<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Adding a pet animal</title>
	<script type="text/javascript">
		function cancel(){
			if(confirm("êtes-vous sûr de vouloir annuler l\'ajout?")==true){
				document.getElementById("form").method="POST";
				document.getElementById("form").action="Pets?action=cancel";
				document.getElementById("form").submit();
			}

		}
		
		function send(){
			document.getElementById("form").method="POST";
			document.getElementById("form").action="Pets?action=add";
			document.getElementById("form").submit();
		}
	</script>
	
	

</head>
<body>
    <form id="form" enctype="multipart/form-data">
        <label for="typePet">Type:</label>
        <select name="typePet" id="typePet">
            <option value="Chat">Chat</option>
            <option value="Chien">Chien</option>
        </select> <br>

        <label for="nomPet">Nom:</label>
        <input type="text" id="nomPet" name="nomPet" required> <br>

        <label for="racePet">Race:</label>
        <input type="text" id="racePet" name="racePet" required>   <br>

         Sexe:<br>
        <label for="male">Male:</label>
        <input type="radio" name="sexePet" value="male" required><br>

        <label for="femelle">femelle:</label>
        <input type="radio" name="sexePet" value="femelle" id="femelle"><br>

        <label for="datePet">Date de naissance:</label>
        <input type="date" id="datePet" name="datePet" required  min="2001-01-01"  max="${dateCourrante}"><br><br><br>
        
        
        <label for="photoPet">Photo:</label>
        <input type="file" name="photoPet" id="photoPet" required><br><br><br>
        <p>${extErr}</p>
        
        <label for="detailPet">details</label>
        <textarea name = "detailPet" id="detailPet" placeholder="Veuillez entrer quelques informations suplémentaire sur l'animal" required></textarea><br>
            
        <label for="prixPet">Prix:</label>
        <input type="text" id="prixPet" name="prixPet" required><br>

        <label for="satutPet">Statut:</label>
        <select name="statutPet" id="statutPet" required>
            <option value="Acheté">Acheté</option>
            <option value="Disponible">Disponible</option>
            <option value="Réservé">Réservé</option>
            <option value="Vendu">Vendu</option>
        </select> <br>

        <button type="button" onclick="send()" >Ajouter</button>
        <button type="button" onclick="cancel()" >Annuler</button>


    </form>
    
</body>
</html>