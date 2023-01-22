
<table border=1 align=center>
                  
          <tr>
               <th>Type</th>
               <th>Nom</th>
               <th>Race</th>
               <th>Sexe</th>
               <th>Date de naissance</th>
               <th>photo</th>
               <th>Détail</th>
               <th>Prix</th>
               <th>Statut</th>
               <th>Supprimer</th>
               <th>Modifier</th>
         </tr>

          <c:forEach var="pet" items="${all}"  varStatus="boucle">
              <tr>

                  <td>
                      <c:out value="${pet.getType()}" />
                  </td>      
                          
                  <td>
                      <c:out value="${pet.getNom()}" />
                  </td>
                  
                  <td>
                      <c:out value="${pet.getRace()}" />
                  </td>
                  
                  <td>
                      <c:out value="${pet.getSexe()}" />
                  </td>
                  
                  <td>
                      <c:out value="${pet.getDateNaissance()}" />
                  </td>
                  
                  <td>
                  	<a target="_blank" href='<c:out value="${PetsImages}${pet.getPhoto()}"/>'>Voir </a>
                  </td>
                  <td>
                      <c:out value="${pet.getDetail()}" />
                  </td>   
                  <td>
                      <c:out value="${pet.getPrix()}" />
                  </td>                  
                  <td>
                      <c:out value="${pet.getStatut()}" />
                  </td>                                 
                  <td>
                  	  <a id="delete" href='Pets?action=del&id=<c:out value="${pet.getId()}" />&img=<c:out value="${pet.getPhoto()}" />'>Delete</a>
                      
                  </td>
                  
                  <td>
                  	  <a href="Pets?action=edit&id=<c:out value='${pet.getId()}' />">Modifier</a>
                      
                  </td>
               </tr>
            </c:forEach>
                        

      </table>
    