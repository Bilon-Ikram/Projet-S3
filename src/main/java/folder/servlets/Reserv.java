package folder.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import folder.beans.Animal;
import folder.beans.PetRes;
import folder.beans.PetResC;
import folder.beans.Reservation;
import folder.daos.DAOFactory;
import folder.daos.FreeDaoImpl;
import folder.daos.ResDAOImpl;
import folder.daos.UserDAOImpl;


public class Reserv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String PetsImages="Pets_Images/";
	private FreeDaoImpl freeDAO;
    private ResDAOImpl resDAO;
    public void init() throws ServletException {
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.resDAO = daoFactory.getResDao();
        this.freeDAO = daoFactory.getFreeDao();
    }       

    public Reserv() {
        super();
        
    }
    
    //Affichage du formulaire de recherche des réservations
    public void searchRes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
    	request.setAttribute("firsTime","vrai");
		this.getServletContext().getRequestDispatcher("/UserSpace/allRes.jsp").forward(request, response);	
    }
    
    //Affichage des réservations selon le statut
    public void allRes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String statutRes=request.getParameter("statutRes");
    	String cin=request.getParameter("cin");
    	List<PetRes> resers=resDAO.listerResClient(cin, statutRes);
    	request.setAttribute("all",resers);
    	request.setAttribute("status",statutRes);
    	request.setAttribute("firsTime","faux");
    	request.setAttribute("PetsImages", PetsImages);
    	this.getServletContext().getRequestDispatcher("/UserSpace/allRes.jsp").forward(request, response);
    }

    //Affichage du formulaire de recherche des réservations Admin
    public void searchResAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
    	request.setAttribute("firsTime","vrai");
		this.getServletContext().getRequestDispatcher("/AdminSpace/listRes.jsp").forward(request, response);	
    }
    
    //Affichage des réservations selon le statut Admin
    public void allResAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String statutRes=request.getParameter("statutRes");
    	List<PetResC> resers=resDAO.listerRes(statutRes);
    	request.setAttribute("all",resers);
    	request.setAttribute("status",statutRes);
    	request.setAttribute("firsTime","faux");
    	request.setAttribute("PetsImages", PetsImages);
    	this.getServletContext().getRequestDispatcher("/AdminSpace/listRes.jsp").forward(request, response);
    }    
    
    //Affichage des réservations en cours
    public void resEnCours(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//String statutRes="En cours";
    	String statutRes=request.getParameter("statut");
    	String cin=request.getParameter("cin");
    	List<PetRes> resers=resDAO.listerResClient(cin, statutRes);
    	request.setAttribute("all",resers);
    	request.setAttribute("status",statutRes);
    	request.setAttribute("firsTime","faux");
    	request.setAttribute("PetsImages", PetsImages);
    	this.getServletContext().getRequestDispatcher("/UserSpace/allRes.jsp").forward(request, response);
    }    
    
    //Affichage des réservations en cours Admin
    public void resEnCoursAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//String statutRes="Délai dépassé";
    	String statutRes=request.getParameter("statut");
    	List<PetResC> resers=resDAO.listerRes(statutRes);
    	request.setAttribute("all",resers);
    	request.setAttribute("status",statutRes);
    	request.setAttribute("firsTime","faux");
    	request.setAttribute("PetsImages", PetsImages);
    	this.getServletContext().getRequestDispatcher("/AdminSpace/listRes.jsp").forward(request, response);
    }  
    //Annuler une réservation
    public void annulerRes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try{
    	int idPet = Integer.valueOf(request.getParameter("id"));
    	String cin = request.getParameter("cin");
    	resDAO.delRes(idPet, cin);
    	freeDAO.resPet(idPet, "Disponible");
    	String statutRes=request.getParameter("statut");
    	response.sendRedirect("Reserv?action=resEnCours&cin="+cin+"&statut="+statutRes);
		} catch(NumberFormatException ex){ // handle your exception
			System.out.println("Something went wrong in delete fct regarding idPet");
		}
    	
    }

    //Annuler une réservation Admin
    public void annulerResAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try{
    	int idPet = Integer.valueOf(request.getParameter("id"));
    	String cin = request.getParameter("cin");
    	resDAO.delRes(idPet, cin);
    	freeDAO.resPet(idPet, "Disponible");
    	String statutRes=request.getParameter("statut");
    	response.sendRedirect("Reserv?action=resEnCoursAdmin&statut="+statutRes);
		} catch(NumberFormatException ex){ // handle your exception
			System.out.println("Something went wrong in delete fct regarding idPet");
		}
    	
    }
    
    //Ajouter une réservation par un client
    public void faireRes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {

		try{
			int idPet = Integer.valueOf(request.getParameter("idPet"));
	    	String cin = request.getParameter("cin");
	    	resDAO.addRes(idPet, cin);
	    	freeDAO.resPet(idPet, "Réservé");
	    	String statutRes="En cours";
	    	response.sendRedirect("Reserv?action=resEnCours&cin="+cin+"&statut="+statutRes);
		} catch(NumberFormatException ex){ // handle your exception
			System.out.println("Something went wrong in delete fct regarding idPet");
		}
    	
		
    	
    }
    
    public void approuverRes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try{
	    	int id = Integer.valueOf(request.getParameter("id"));
	    	String cin = request.getParameter("cin");
	    	String statutRes="Payee";
	    	freeDAO.resPet(id, "Vendu");
	    	resDAO.update(cin, id, statutRes);
	    	response.sendRedirect("Reserv?action=resEnCoursAdmin&statut="+statutRes);
		} catch(NumberFormatException ex){ // handle your exception
			System.out.println("Something went wrong in delete fct regarding idPet");
		}
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action==null) {
			action="showRes";	
		}		
		switch(action) {
			case "ajouRes":
				this.faireRes(request, response);
				break;
			case "showRes":
				this.searchRes(request, response);
				break;
				
			case "showResAdmin":
				this.searchResAdmin(request, response);
				break;
				
			case "canRes":
				this.annulerRes(request, response);
				break;	
			
			case "canResAdmin":
				this.annulerResAdmin(request, response);
				break;
				
			case "resEnCours":
				this.resEnCours(request, response);
				break;
			
			case "resEnCoursAdmin":
				this.resEnCoursAdmin(request, response);
				break;
			case "appRes":
				this.approuverRes(request, response);
				break;
				
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		switch(action) {
		case "allRes":
			this.allRes(request, response);
			break;	
			
		case "allResAdmin":
			this.allResAdmin(request, response);
			break;
		}	

	}

}
