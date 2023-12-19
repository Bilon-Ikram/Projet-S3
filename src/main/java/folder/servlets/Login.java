package folder.servlets;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import folder.daos.DAOFactory;
import folder.daos.UserDAO;
import folder.daos.UserDAOImpl;
import folder.beans.Animal;
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
    	//this.getServletContext().getRequestDispatcher("/WEB-INF/signUp.jsp").forward(request, response);
    	this.getServletContext().getRequestDispatcher("/signUp.jsp").forward(request, response);
    }
    
    //Traitement des données d'ajout d'un compte utilisateur
    public void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		User user= new User();
		user.setCinU(request.getParameter("cinUser"));
		user.setNomU(request.getParameter("nomU"));
		user.setPrenomU(request.getParameter("prenomU"));
		user.setSexeU(request.getParameter("sexeU"));
		user.setPhoneU(request.getParameter("phoneU"));
		user.setEmailU(request.getParameter("emailUser"));
		user.setLoginU(request.getParameter("loginU"));
		user.setPwdU(request.getParameter("motPasseUser"));
		user.setTypeU("Client");
		
		userDAO.create(user);
		response.sendRedirect("Login");
    }
    
    //Affichage du formulaire d'authentification
    public void signInForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
    	//this.getServletContext().getRequestDispatcher("/WEB-INF/signIn.jsp").forward(request, response);
    	this.getServletContext().getRequestDispatcher("/signIn.jsp").forward(request, response);
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
    		HttpSession session=request.getSession();
    		session.setAttribute("cinU", uti.getCinU());
    		session.setAttribute("nomU", uti.getNomU());
    		session.setAttribute("prenomU", uti.getPrenomU());
    		session.setAttribute("loginU", uti.getLoginU());
    		session.setAttribute("typeU", uti.getTypeU());
    		
    		if(uti.getTypeU().equals("Admin")) {
    			System.out.println("Dans espace Admin");
	    		response.sendRedirect("Pets");
    		}
    		
    		else {
    			System.out.println("Dans espace client");
    			//on va chnager cette page par une autre par défaut: par exemple réservation.
    			response.sendRedirect("Reserv");
    			//this.getServletContext().getRequestDispatcher("/UserSpace/home.jsp").forward( request, response );
    		}
    		
    		
    	}
    	
    }
    
    //Affichage du profile de user
    
    public void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		User user=new User();
		HttpSession session=request.getSession();
		String cin = (String) session.getAttribute("cinU");
		user=userDAO.find(cin);
		request.setAttribute("user",user);
		String typeU = (String) session.getAttribute("typeU");
		if(typeU.equals("Admin")) {
			this.getServletContext().getRequestDispatcher("/AdminSpace/myProfile.jsp").forward(request, response);
		}
		else {
			this.getServletContext().getRequestDispatcher("/UserSpace/myProfile.jsp").forward(request, response);	
		}
    }
    
    // Modification des infos de user (without pwd)
    public void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
    	User user=new User();
		user.setCinU(request.getParameter("cinU"));
    	user.setNomU(request.getParameter("nomU"));
    	user.setPrenomU(request.getParameter("prenomU"));
    	user.setSexeU(request.getParameter("sexeU"));
    	user.setPhoneU(request.getParameter("phoneU"));
    	user.setEmailU(request.getParameter("emailU"));
    	user.setLoginU(request.getParameter("loginU"));
    	userDAO.updateProfile(user);
    	HttpSession session=request.getSession();
    	session.setAttribute("loginU", user.getLoginU());
	    
        response.sendRedirect("Login?action=profile");	
    }
    
    //Affichage du formulaire du changement de mot de passe
    
    public void editPwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
    	HttpSession session=request.getSession();
    	String typeU = (String) session.getAttribute("typeU");
    	if(typeU.equals("Admin")) {
    		this.getServletContext().getRequestDispatcher("/AdminSpace/editPwd.jsp").forward(request, response);
    	}
    	else {
    		this.getServletContext().getRequestDispatcher("/UserSpace/editPwd.jsp").forward(request, response);
    	}
    }
    
    //Taitement des données du changement de mot de passe
    public void upPwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
    	//get the cin of th user
		HttpSession session=request.getSession();
		String cin = (String) session.getAttribute("cinU");
		String typeU = (String) session.getAttribute("typeU");
		//select the hashed pwd of the user 
		User user=userDAO.find(cin);
		String mdpActSha1=user.getPwdU();
		System.out.println("mdp current de user chiffré: "+mdpActSha1);
		//get the value of current pwd from the form
		String mdpActF=request.getParameter("pwdAct");
		System.out.println("mdp current Form non chiffré : "+mdpActF);
		try {
			String mdpActFSha1=userDAO.sha1(mdpActF);
			System.out.println("mdp current Form chiffré : "+mdpActFSha1);
			if(!mdpActSha1.equals(mdpActFSha1)) {
   			  	String pwdErrA="Mot de passe incorrect!";
   			  	request.setAttribute("pwdErrA",pwdErrA);
   			  	if(typeU.equals("Admin")) {
   			  		this.getServletContext().getRequestDispatcher("/AdminSpace/editPwd.jsp").forward(request, response);
   			  	}
   			  	else {
   			  		this.getServletContext().getRequestDispatcher("/UserSpace/editPwd.jsp").forward(request, response);
   			  	}
			}
			else {
				String mdp=request.getParameter("pwdU");
				String confirmMdp=request.getParameter("confirmPwdU");
				if(!mdp.equals(confirmMdp)) {
	   			  	String pwdErrC="Mots de passe différents!";
	   			  	request.setAttribute("pwdErrC",pwdErrC);
	   			  	if(typeU.equals("Admin")) {
	   			  		this.getServletContext().getRequestDispatcher("/AdminSpace/editPwd.jsp").forward(request, response);
	   			  	}
	   			  	else {
	   			  		this.getServletContext().getRequestDispatcher("/UserSpace/editPwd.jsp").forward(request, response);
	   			  	}
				}
				else {
					userDAO.updatePwd(cin, confirmMdp);
					response.sendRedirect("Login?action=profile");
				}
			}
			
		} catch (NoSuchAlgorithmException e) {
			
			e.printStackTrace();
		}

    	
    }
    //Se déconnecter
    public void logOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
    	HttpSession session=request.getSession();
    	session.removeAttribute("cinU");
    	session.removeAttribute("loginU");
    	session.removeAttribute("typeU");
    	session.invalidate();
    	response.sendRedirect("Login");
    }
    
    //Affichage de tous les clients
    
    public void allClients(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<User> clients=userDAO.lister();
    	request.setAttribute("all",clients);
    	this.getServletContext().getRequestDispatcher("/AdminSpace/allClients.jsp").forward( request, response );

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
			   
		  case "clients":
			  this.allClients(request, response);
			  break;
			  
		  case "profile":
			  this.editUser(request, response);
			  break;
		  case "editPwd":
			  this.editPwd(request, response);
			  break;
		  case "out":
			  this.logOut(request, response);
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
		  case "upUser":
			  this.updateUser(request, response);
			  break;
		  case "upPwd":
			  this.upPwd(request, response);
			  break;
		
		}

	}

}
