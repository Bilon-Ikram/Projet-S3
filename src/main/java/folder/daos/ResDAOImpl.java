package folder.daos;
import java.io.File;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import folder.daos.DAOException;
import folder.beans.Animal;
import folder.beans.PetRes;
import folder.beans.PetResC;
import folder.beans.Reservation;
import folder.beans.User;


public class ResDAOImpl implements ResDAO {

	private DAOFactory  daoFactory;

    public ResDAOImpl( DAOFactory daoFactory ) {
        this.daoFactory = daoFactory;
    }
    
    @override
	public void addRes(int idPet,String cin) throws DAOException{
        Connection connexion = null;
        PreparedStatement preparedStatement = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO reservation (cinU,id_pet,statut_reservation) values (?,?,?);");
            preparedStatement.setString(1, cin);
            preparedStatement.setInt(2, idPet);
            preparedStatement.setString(3, "En cours");
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    
    
    //supprimer une réservation
    @override
    public void delRes(int idPet,String cin) throws DAOException{
		final String SQL_DELETE = "DELETE FROM reservation WHERE cinU=? and id_pet=?;";
	    Connection connexion = null;
	    PreparedStatement preparedStatement = null;
	    
	    try {
	        connexion = daoFactory.getConnection();
	        preparedStatement = connexion.prepareStatement(SQL_DELETE);
	        preparedStatement.setString(1, cin);
	        preparedStatement.setInt(2, idPet);
	        preparedStatement.executeUpdate(); 
	    } catch ( SQLException e ) {
	        throw new DAOException( e );
	    } finally {
	        
	    }    	
    	
    	
    	
    }
    //Lister les réservations d'un client donné
    public List<PetRes> listerResClient(String cin,String statut){
		 List <PetRes> resers = new ArrayList < >();
		    Connection connexion = null;
		    PreparedStatement preparedStatement = null;
		    ResultSet resultSet = null;
		    PetRes petRes = null;
		    final String SQL_SELECT_ALL ="select id,nom,race,sexe,date_naissance,photo,prix,DATE_FORMAT(date_reservation, '%Y-%m-%d') as date_reservation,statut_reservation from reservation R join animal A on A.id=R.id_pet where cinU=? and statut_reservation=?";
		    try {
		    	
		        connexion = daoFactory.getConnection();
		        preparedStatement = connexion.prepareStatement(SQL_SELECT_ALL);
		        preparedStatement.setString(1, cin);
		        preparedStatement.setString(2, statut);
		        resultSet = preparedStatement.executeQuery();
		       
		        int i=0;  
		        while ( resultSet.next() ) {
		        	i++;
		        	System.out.println("i="+i);
		        	petRes = maPetRes( resultSet );
		        	System.out.println(petRes .getPet().getNom());
		        	resers.add(petRes);
		        }
		    } catch ( SQLException e ) {
		        throw new DAOException( e );
		    } finally {
		        
		    }		        

		    return resers;		    
    	
    }
    
    //Lister toutes les réservations 
    
    public List<PetResC> listerRes(String statut){
		 List <PetResC> resers = new ArrayList < >();
		    Connection connexion = null;
		    PreparedStatement preparedStatement = null;
		    ResultSet resultSet = null;
		    PetResC petRes = null;
		    final String SQL_SELECT_ALL ="select C.cinU,nomU,prenomU,id,nom,race,sexe,date_naissance,photo,prix,DATE_FORMAT(date_reservation, '%Y-%m-%d') as date_reservation,statut_reservation from reservation R,animal A,user C where A.id=R.id_pet and R.cinU=C.cinU and statut_reservation=?";
		    try {
		    	
		        connexion = daoFactory.getConnection();
		        preparedStatement = connexion.prepareStatement(SQL_SELECT_ALL);
		        preparedStatement.setString(1, statut);
		        resultSet = preparedStatement.executeQuery();
		       
		        int i=0;  
		        while ( resultSet.next() ) {
		        	i++;
		        	System.out.println("i="+i);
		        	petRes = maPetResC( resultSet );
		        	System.out.println(petRes .getPet().getNom());
		        	resers.add(petRes);
		        }
		    } catch ( SQLException e ) {
		        throw new DAOException( e );
		    } finally {
		        
		    }		        

		    return resers;	    	
    	
    }
    
    public void update(String cin,int idPet,String statut)  throws DAOException{
	    Connection connexion = null;
	    PreparedStatement preparedStatement = null;
			final String SQL_UPDATE ="UPDATE reservation SET statut_reservation=? WHERE id_pet=? and cinU=?";
		    try {
			       
		        connexion = daoFactory.getConnection();
		        preparedStatement = connexion.prepareStatement(SQL_UPDATE);
		        preparedStatement.setString(1,statut);
		        preparedStatement.setInt(2,idPet);
		        preparedStatement.setString(3,cin);
		        preparedStatement.executeUpdate(); 
		    } catch ( SQLException e ) {
		        throw new DAOException( e );
		    } finally {
		        
		    }     	
    	
    }
    
    //mapper les résultats de la jointure entre Réservation et Animal
	private static PetRes maPetRes( ResultSet resultSet ) throws SQLException {
		PetRes petRes = new PetRes();
		Animal pet=new Animal();
		Reservation res=new Reservation();
		
		pet.setId(resultSet.getInt("id"));
		pet.setNom(resultSet.getString("nom"));
		pet.setRace(resultSet.getString("race"));
		pet.setSexe(resultSet.getString("sexe"));
		pet.setDateNaissance(resultSet.getString("date_naissance"));
		pet.setPhoto(resultSet.getString("photo"));
		pet.setPrix(resultSet.getString("prix"));
		
		res.setDateRes(resultSet.getString("date_reservation"));
		res.setStatutRes(resultSet.getString("statut_reservation"));

		
		petRes.setPet(pet);
		petRes.setRes(res);
		
		return petRes;
		}    
	
    //mapper les résultats de la jointure entre Réservation, Animal et Client
			private static PetResC maPetResC( ResultSet resultSet ) throws SQLException {
				PetResC petRes = new PetResC();
				Animal pet=new Animal();
				Reservation res=new Reservation();
				User user=new User();
				
				user.setCinU(resultSet.getString("cinU"));
				user.setNomU(resultSet.getString("nomU"));
				user.setPrenomU(resultSet.getString("prenomU"));
				
				pet.setId(resultSet.getInt("id"));
				pet.setNom(resultSet.getString("nom"));
				pet.setRace(resultSet.getString("race"));
				pet.setSexe(resultSet.getString("sexe"));
				pet.setDateNaissance(resultSet.getString("date_naissance"));
				pet.setPhoto(resultSet.getString("photo"));
				pet.setPrix(resultSet.getString("prix"));
				
				res.setDateRes(resultSet.getString("date_reservation"));
				res.setStatutRes(resultSet.getString("statut_reservation"));
		
				
				petRes.setPet(pet);
				petRes.setRes(res);
				petRes.setUser(user);
				
				return petRes;
				}  
	
	
	private static Reservation map( ResultSet resultSet ) throws SQLException {
		Reservation res = new Reservation();
		
		res.setCin(resultSet.getString("cinU"));
		res.setIdPet(resultSet.getInt("id_pet"));
		res.setDateRes(resultSet.getString("date_reservation"));
		res.setStatutRes(resultSet.getString("statut_reservation"));
		
		return res;
		}
    
}
