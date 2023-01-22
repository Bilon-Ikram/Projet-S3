package folder.servlets;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import folder.daos.DAOFactory;
import folder.daos.UserDAO;
import folder.daos.UserDAOImpl;
import folder.beans.User;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDAOImpl userDAO;
    public void init() throws ServletException {
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.userDAO = daoFactory.getUSerDao();
    }

    public Login() {
        super();

    }
    
    //Affichage du formulaire d'ajout d'un compte utilisateur
    public void addFormUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
    	this.getServletContext().getRequestDispatcher("/WEB-INF/signUp.jsp").forward(request, response);
    }
    
    //Traitement des données d'ajout d'un compte utilisateur
    public void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		User user= new User();
		user.setCinU(request.getParameter("cinU"));
		user.setNomU(request.getParameter("nomU"));
		user.setPrenomU(request.getParameter("prenomU"));
		user.setSexeU(request.getParameter("sexeU"));
		user.setPhoneU(request.getParameter("phoneU"));
		user.setEmailU(request.getParameter("emailU"));
		user.setLoginU(request.getParameter("loginU"));
		user.setPwdU(request.getParameter("pwdU"));
		user.setTypeU("client");
		
		userDAO.create(user);
		response.sendRedirect("Login");
    }
    
    //Affichage du formulaire d'authentification
    public void signInForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
    	this.getServletContext().getRequestDispatcher("/WEB-INF/signIn.jsp").forward(request, response);
    }

    //Vérification du username et password
    public void signIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
    	User user= new User();
		user.setLoginU(request.getParameter("loginU"));
		
		//pwd not hashed
		user.setPwdU(request.getParameter("pwdU"));
    	User uti=userDAO.login(user);
    	if(uti==null) {
    		response.sendRedirect("Login");
    	}
    	else {
    		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
    		HttpSession session=request.getSession();
    		session.setAttribute("CIN", uti.getCinU());
    		session.setAttribute("Nom", uti.getNomU());
    		session.setAttribute("Prénom", uti.getPrenomU());
    		response.sendRedirect("home.jsp");
    		
    	}
    	
    }
    
    public void logOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
    	HttpSession session=request.getSession();
    	session.removeAttribute("CIN");
    	session.removeAttribute("Nom");
    	session.removeAttribute("Prénom");
    	session.invalidate();
    	response.sendRedirect("Login");
    }
    
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action==null) {
			action="inForm";	
		}
		switch(action) {
		  case "upForm":
			  this.addFormUser(request, response);
			    break;

		default:
			this.signInForm(request, response);
		}
		
	

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		switch(action) {
		  case "up":
			  this.addUser(request, response);
			    break;
		  case "in":
			  this.signIn(request, response);
			    break;
		  case "out":
			  this.logOut(request, response);
			    break;
		}

	}

}
