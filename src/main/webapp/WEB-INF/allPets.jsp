<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<% 

%>


    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Liste des animaux domestiques</title>
        <script type="text/javascript">
		function supprimer(){

		}
		
		</script>
    </head>
    <body id="bod">
        <h2 style="text-align:center">All pet animals</h2>
        <a href="Pets?action=addForm">Ajouter</a>
        
     <select name="typePet" id="typePet" >
     		<option value="all">Type</option>
            <option value="Chat">Chat</option>
            <option value="Chien">Chien</option>
     </select>
     
    <select name="statutPet" id="statutPet" >
    		<option value="all">Statut</option>
            <option value="Acheté">Acheté</option>
            <option value="Disponible">Disponible</option>
            <option value="Réservé">Réservé</option>
            <option value="Vendu">Vendu</option>
     </select>
     
     <div id="filtrage">
     	<%@ include file='resultPet.jsp' %>
     </div>

<script type="text/javascript">
	function laodAjax(){
		var typePet= document.getElementById("typePet").value;
		var url="Pets?action=all&type="+typePet;
		//alert(url);
		if(window.XMLHttpRequest){
			
			request = new XMLHttpRequest();
			
		}else if(window.ActiveXObject){
			
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		try{
			request.onreadystatechange=sendInfo;
			request.open("GET",url,true);
			request.send();
			
		}catch(e){
			alert("Unable to connect server");
		}
	}
	function sendInfo(){
		var p =		document.getElementById("filtrage");
		var typePet= document.getElementById("typePet").value;
		
		if(request.readyState ==4 && request.status == 200){
        	p.innerHTML=this.responseText;
	     
		}
	}
</script>
      	
        
        
        
    </body>
</html>