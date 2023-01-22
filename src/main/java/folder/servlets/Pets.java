package folder.servlets;

import jakarta.servlet.ServletException;



import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import folder.daos.DAOFactory;
import folder.daos.FreeDAO;
import folder.daos.FreeDaoImpl;
import folder.ImgUpload;
import folder.beans.Animal;

public class Pets extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LocalDate dateCourrante= java.time.LocalDate.now();
    public static final int TAILLE_TAMPON = 10240;
    //public static final String CHEMIN_FICHIERS = "C:/Users/Bilon Ikram/Documents/Projet jee/pets/";
    public static final String CHEMIN_FICHIERS = "C:/Users/Bilon Ikram/eclipse-workspace/Projet/src/main/webapp/Pets_Images/";
    public static final String PetsImages="Pets_Images/";
    private FreeDaoImpl freeDAO;
    public void init() throws ServletException {
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.freeDAO = daoFactory.getFreeDao();
    }
       

    public Pets() {
        super();

    }
    
    //Affichage du formulaire d'ajout
    
    public void addForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		request.setAttribute("dateCourrante", dateCourrante);
		this.getServletContext().getRequestDispatcher("/WEB-INF/addAnimalForm.jsp").forward(request, response);	
    }
    
    // Traitement des données saisies dans le formulaire d'ajout
    
    public void add(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	    Animal pet = new  Animal();
	    pet.setType(request.getParameter("typePet"));
	    pet.setNom(request.getParameter("nomPet"));
	    pet.setSexe(request.getParameter("sexePet"));
	    pet.setRace(request.getParameter("racePet"));
	    pet.setDetail(request.getParameter("detailPet"));
	    pet.setStatut(request.getParameter("statutPet"));
	    pet.setPrix(request.getParameter("prixPet"));
	    pet.setDateNaissance(request.getParameter("datePet"));
	    //seting the value of pet date 
	    //Date datePet=Date.valueOf(request.getParameter("datePet"));
	    //pet.setDateNaissance(datePet);
	    //file upload
	    fileUpload(request,response,"photoPet",TAILLE_TAMPON,CHEMIN_FICHIERS,pet);
	    

        
        //response.sendRedirect("CRUD");	
    }
    
    // Traitement des données saisies dans le formulaire d'ajout
    
    public void cancelAdd(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
    	response.sendRedirect("Pets");
    }
    
    //Affichage de tous les animaux
    
    public void allPets(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	/*String[] options= {"all","all"};
    	String type=request.getParameter("type");
    	String statut=request.getParameter("statut");
    	if (type!=null) {
    		options[0]=type;
    	}
    	if (statut!=null) {
    		options[1]=statut;
    	}
    	*/
    	List<Animal> pets= freeDAO.lister();
    	request.setAttribute("all",pets);
    	request.setAttribute("PetsImages", PetsImages);
    	this.getServletContext().getRequestDispatcher("/WEB-INF/allPets.jsp").forward( request, response );

    }
    //Suppression d'un animal
    
    public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String id= request.getParameter("id");
		String img= request.getParameter("img");
		String path= CHEMIN_FICHIERS+img;
		freeDAO.delete(Integer.valueOf(id),path);
		response.sendRedirect("Pets");
    }
    //Affichage du formulaire de modification
    
    public void editForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		Animal pet=new Animal();
		String id = request.getParameter("id");
		pet=freeDAO.find(Integer.valueOf(id));
		request.setAttribute("pet",pet);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/editPet.jsp").forward(request, response);	
    }
    


	//Traitement des données saisies dans le formulaire de modification
    
    public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        Animal pet = new  Animal();
        pet.setId(Integer.valueOf(request.getParameter("id")));
	    pet.setType(request.getParameter("typePet"));
	    pet.setNom(request.getParameter("nomPet"));
	    pet.setSexe(request.getParameter("sexePet"));
	    pet.setRace(request.getParameter("racePet"));
	    pet.setDetail(request.getParameter("detailPet"));
	    pet.setStatut(request.getParameter("statutPet"));
	    pet.setPrix(request.getParameter("prixPet"));
	    pet.setDateNaissance(request.getParameter("datePet"));
	    fileUploadUpdate(request,response,"photoPet",TAILLE_TAMPON,CHEMIN_FICHIERS,pet);
	    


        //response.sendRedirect("Pets");	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setAttribute("dateCourrante", dateCourrante);
		//this.getServletContext().getRequestDispatcher("/WEB-INF/addAnimalForm.jsp").forward(request, response);	
		String action=request.getParameter("action");
		if(action==null) {
			action="all";	
		}
		switch(action) {
		  case "addForm":
			    this.addForm(request, response);
		  case "del":
			    this.delete(request, response);
			    break;
		  case "edit":
			    this.editForm(request, response);
			    break;    
		default:
			this.allPets(request, response);
			
			  

		}
		

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//this.add(request, response);
		String action=request.getParameter("action");
		switch(action) {
		  case "add":
		    this.add(request, response);
		    break;
		  case "update":
			    this.update(request, response);
			    break;
			    
		  case "cancel":
			    this.cancelAdd(request, response);			    
			    break;
		  }
	}
	
	
	    private void fileUpload(HttpServletRequest request, HttpServletResponse response, String fieldName, int TAILLE_TAMPON, String CHEMIN_FICHIERS ,Animal pet) throws IOException, ServletException {
	    	Part part = request.getPart(fieldName);
	    	String[] allowedExts = new String[] {"png","jpg","jpeg"};
	    	
	    	ImgUpload imgPet= new ImgUpload(part,TAILLE_TAMPON,CHEMIN_FICHIERS);
	    	String nomFichier = imgPet.getNomFichier(part);
		    if (nomFichier != null && !nomFichier.isEmpty()) {
		        // Corrige un bug du fonctionnement d'Internet Explorer
		         nomFichier = nomFichier.substring(nomFichier.lastIndexOf('/') + 1)
		                .substring(nomFichier.lastIndexOf('\\') + 1);
		         String extension=imgPet.getFileExt(nomFichier);
		         if(imgPet.isImg(allowedExts, extension)) {
		        	 nomFichier=imgPet.fname(CHEMIN_FICHIERS, nomFichier);
		        	 imgPet.setNomFichier(nomFichier);
		        	 imgPet.ecrireFichier(imgPet.getPart(), imgPet.getNomFichier(), imgPet.getCHEMIN_FICHIERS());
		        	 pet.setPhoto(imgPet.getNomFichier());
		        	 freeDAO.create(pet);
		        	 response.sendRedirect("Pets");
		         }
        		 else {
       			  	String extErr="Veuillez choisir une photo d'extension jpg, png, jpeg";
       			  	request.setAttribute("extErr", extErr);
       			  	this.getServletContext().getRequestDispatcher("/WEB-INF/addAnimalForm.jsp").forward(request, response);	
       			 }
		    }
       }
	    private void fileUploadUpdate(HttpServletRequest request, HttpServletResponse response, String fieldName, int TAILLE_TAMPON, String CHEMIN_FICHIERS ,Animal pet) throws IOException, ServletException {
	    	Part part = request.getPart(fieldName);
	    	String[] allowedExts = new String[] {"png","jpg","jpeg"};
	    	
	    	ImgUpload imgPet= new ImgUpload(part,TAILLE_TAMPON,CHEMIN_FICHIERS);
	    	String nomFichier = imgPet.getNomFichier(part);
		    if (nomFichier != null && !nomFichier.isEmpty()) {
		        // Corrige un bug du fonctionnement d'Internet Explorer
		         nomFichier = nomFichier.substring(nomFichier.lastIndexOf('/') + 1)
		                .substring(nomFichier.lastIndexOf('\\') + 1);
		         String extension=imgPet.getFileExt(nomFichier);
		         if(imgPet.isImg(allowedExts, extension)) {
		        	 nomFichier=imgPet.fname(CHEMIN_FICHIERS, nomFichier);
		        	 imgPet.setNomFichier(nomFichier);
		        	 imgPet.ecrireFichier(imgPet.getPart(), imgPet.getNomFichier(), imgPet.getCHEMIN_FICHIERS());
		        	 //supprimer l'ancier fichier 
				     Animal pet2=freeDAO.find(pet.getId());
				     File F= new File(CHEMIN_FICHIERS+pet2.getPhoto());
				     F.delete();
				     //ajouter le nom du nouveau fichier à la base de données.
		        	 pet.setPhoto(imgPet.getNomFichier());
		        	 freeDAO.update(pet,true);
		        	 response.sendRedirect("Pets");
		         }
        		 else {
       			  	String extErr="Veuillez choisir une photo d'extension jpg, png, jpeg";
       			  	request.setAttribute("extErr", extErr);
       			  	this.getServletContext().getRequestDispatcher("/WEB-INF/editPet.jsp").forward(request, response);	
       			 }
		    }
		    else {
		    	freeDAO.update(pet,false);
		    	response.sendRedirect("Pets");
		    	
		    }
       }
}
