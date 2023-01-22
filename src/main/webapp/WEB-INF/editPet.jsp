<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Adding a pet animal</title>
    	<script type="text/javascript">
		function update(){
			if(confirm("êtes-vous sûr de vouloir modifier ces informations ?")==true){
				document.getElementById("form").method="POST";
				document.getElementById("form").action="Pets?action=update&id=<c:out value='${pet.getId()}' />";
				document.getElementById("form").submit();
			}
			else{
				document.getElementById("form").method="POST";
				document.getElementById("form").action="Pets?action=cancel";
				document.getElementById("form").submit();
			}

		}
		
	</script>
</head>
<body>
    <form id="form" enctype="multipart/form-data">
        <label for="typePet">Type:</label>
        <select name="typePet" id="typePet">
            <option value="Chat" <c:if test="${pet.getType()== 'cat'}"><c:out value="selected" /></c:if>>Chat</option>
            <option value="Chien" <c:if test="${pet.getType()== 'dog'}"><c:out value="selected" /></c:if>>Chien</option>
        </select> <br>

        <label for="nomPet">Nom:</label>
        <input type="text" id="nomPet" name="nomPet" value='<c:out value="${pet.getNom()}" />' required> <br>

        <label for="racePet">Race:</label>
        <input type="text" id="racePet" name="racePet" value='<c:out value="${pet.getRace()}" />' required>   <br>

         Sexe:<br>
        <label for="male">Male:</label>
        <input type="radio" name="sexePet" value="male" <c:if test="${pet.getSexe()== 'male'}"><c:out value="checked" /></c:if> required><br>

        <label for="femelle">femelle:</label>
        <input type="radio" name="sexePet" value="femelle" id="femelle" <c:if test="${pet.getSexe()== 'femelle'}"><c:out value="checked" /></c:if> ><br>

        <label for="datePet">Date de naissance:</label>
        <input type="date" id="datePet" name="datePet" required  min="2001-01-01"  max="${dateCourrante}" value='<c:out value="${pet.getDateNaissance()}" />'><br><br><br>
        
        
        <label for="photoPet">Photo:</label>
        <input type="file" name="photoPet" id="photoPet" ><br><br><br>
        <p>${extErr}</p>
        
        <label for="detailPet">details</label>
        <textarea name = "detailPet" id="detailPet" placeholder="Veuillez entrer quelques informations suplémentaire sur l'animal" required><c:out value="${pet.getDetail()}" /></textarea><br>
            
        <label for="prixPet">Prix:</label>
        <input type="text" id="prixPet" name="prixPet" required value='<c:out value="${pet.getPrix()}" />'><br>

        <label for="satutPet">Statut:</label>
        <select name="statutPet" id="statutPet" required>
            <option value="Acheté" <c:if test="${pet.getStatut()== 'Acheté'}"><c:out value="selected" /></c:if>>Acheté</option>
            <option value="Disponible" <c:if test="${pet.getStatut()== 'Disponible'}"><c:out value="selected" /></c:if>>Disponible</option>
            <option value="Réservé" <c:if test="${pet.getStatut()== 'Réservé'}"><c:out value="selected" /></c:if>>Réservé</option>
            <option value="Vendu" <c:if test="${pet.getStatut()== 'Vendu'}"><c:out value="selected" /></c:if>>Vendu</option>
        </select> <br>

        <button type="button" onclick="update()" >Modifier</button>

    </form>
    
</body>
</html>