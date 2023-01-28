package folder.daos;

import java.io.File;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import folder.daos.DAOException;
import folder.beans.Animal;




public class FreeDaoImpl implements FreeDAO {

	private DAOFactory          daoFactory;

    public FreeDaoImpl( DAOFactory daoFactory ) {
        this.daoFactory = daoFactory;
    }
    
    @override
	public void create(Animal pet) throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO animal (type,nom, race,sexe,date_naissance,photo,detail,prix,statut) VALUES(?,?,?, ?, ?, ?,?,?,?);");
            preparedStatement.setString(1, pet.getType());
            preparedStatement.setString(2, pet.getNom());
            preparedStatement.setString(3, pet.getRace());
            preparedStatement.setString(4, pet.getSexe());
            Date datePet=Date.valueOf(pet.getDateNaissance());
            preparedStatement.setDate(5, datePet);
            preparedStatement.setString(6, pet.getPhoto());
            preparedStatement.setString(7, pet.getDetail());
            preparedStatement.setString(8, pet.getPrix());
            preparedStatement.setString(9, pet.getStatut());


            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

		
	}
	@Override
	public void delete(int id,String path) throws DAOException {
		File f= new File(path);           //file to be deleted  
		if(f.delete()){
			final String SQL_DELETE = "DELETE FROM animal WHERE id=?;";
		    Connection connexion = null;
		    PreparedStatement preparedStatement = null;
		    
	
		    try {
		        
		        connexion = daoFactory.getConnection();
		        preparedStatement = connexion.prepareStatement(SQL_DELETE);
		        preparedStatement.setInt(1, id);
		        preparedStatement.executeUpdate(); 
		    } catch ( SQLException e ) {
		        throw new DAOException( e );
		    } finally {
		        
		    }
		}
	   
	    
	}
    
    @Override
	public List < Animal> lister() {
		
		 List <  Animal > pets = new ArrayList < >();
		    Connection connexion = null;
		    PreparedStatement preparedStatement = null;
		    ResultSet resultSet = null;
		    Animal pet = null;

		    final String SQL_SELECT_ALL = "SELECT * FROM animal order by type,race";


		    try {
		        
		        connexion = daoFactory.getConnection();
		        
		       preparedStatement = initRequestPrepare( connexion, SQL_SELECT_ALL);
		       resultSet = preparedStatement.executeQuery();
		       
		          
		        while ( resultSet.next() ) {
		        	pet = map( resultSet );
		        	pets.add(pet);
		        }
		    } catch ( SQLException e ) {
		        throw new DAOException( e );
		    } finally {
		        
		    }
		    

		    return pets;
		}
	
	
	private static Animal map( ResultSet resultSet ) throws SQLException {
		Animal pet = new Animal();
		
		pet.setId(resultSet.getInt ("id" ));
		pet.setType(resultSet.getString ("type" ));
		pet.setNom(resultSet.getString ("nom" ));
		pet.setRace(resultSet.getString ("race" ));
		pet.setSexe(resultSet.getString ("sexe" ));
		pet.setDateNaissance(resultSet.getString ("date_naissance"));
		pet.setPhoto(resultSet.getString ("photo"));
		pet.setDetail(resultSet.getString ("detail" ));
		pet.setPrix(resultSet.getString ("prix" ));
		pet.setStatut(resultSet.getString ("statut" ));

		return pet;
		}
	public static PreparedStatement initRequestPrepare( Connection connexion, String sql, Object... objets ) throws SQLException {
	    PreparedStatement preparedStatement = connexion.prepareStatement( sql );
	    for ( int i = 0; i < objets.length; i++ ) {
	        preparedStatement.setObject( i + 1, objets[i] );
	    }
	    return preparedStatement;
	}

	@Override
	public Animal find(int id) throws DAOException {
		    final String SQL_SELECT_PAR_NOM = "SELECT * FROM animal WHERE id = ?";
		    Connection connexion = null;
		    PreparedStatement preparedStatement = null;
		    ResultSet resultSet = null;
		    Animal  pet = null;

		    try {
		        
		        connexion = daoFactory.getConnection();
		        preparedStatement = initRequestPrepare( connexion, SQL_SELECT_PAR_NOM, id );
		        resultSet = preparedStatement.executeQuery();
		        
		        if ( resultSet.next() ) {
		            pet = map( resultSet );
		        }
		    } catch ( SQLException e ) {
		        throw new DAOException( e );
		    } finally {
		        //ClosingAll( resultSet, preparedStatement, connexion );
		    }

		    return pet;
		}

	@Override
	
	public void update(Animal pet,boolean fileSelected) throws DAOException {
	    Connection connexion = null;
	    PreparedStatement preparedStatement = null;
		if(fileSelected) {
			final String SQL_UPDATE ="UPDATE animal SET type=?,nom=?,race=?,sexe=?,date_naissance=?, photo=?,detail=?,prix=?,statut=? WHERE id=?";
		    try {
			       
		        connexion = daoFactory.getConnection();
		        preparedStatement = connexion.prepareStatement(SQL_UPDATE);
		        preparedStatement.setString(1,pet.getType());
		        preparedStatement.setString(2,pet.getNom());
		        preparedStatement.setString(3,pet.getRace());
		        preparedStatement.setString(4,pet.getSexe());
		        preparedStatement.setString(5,pet.getDateNaissance());
		        preparedStatement.setString(6,pet.getPhoto());
		        preparedStatement.setString(7,pet.getDetail());
		        preparedStatement.setString(8,pet.getPrix());
		        preparedStatement.setString(9,pet.getStatut());
		        preparedStatement.setInt(10,pet.getId());
		        preparedStatement.executeUpdate(); 
		    } catch ( SQLException e ) {
		        throw new DAOException( e );
		    } finally {
		        
		    }    
		}
		else {
			final String SQL_UPDATE ="UPDATE animal SET type=?,nom=?,race=?,sexe=?,date_naissance=?,detail=?,prix=?,statut=? WHERE id=?";
		    try {
			       
		        connexion = daoFactory.getConnection();
		        preparedStatement = connexion.prepareStatement(SQL_UPDATE);
		        preparedStatement.setString(1,pet.getType());
		        preparedStatement.setString(2,pet.getNom());
		        preparedStatement.setString(3,pet.getRace());
		        preparedStatement.setString(4,pet.getSexe());
		        preparedStatement.setString(5,pet.getDateNaissance());
		        preparedStatement.setString(6,pet.getDetail());
		        preparedStatement.setString(7,pet.getPrix());
		        preparedStatement.setString(8,pet.getStatut());
		        preparedStatement.setInt(9,pet.getId());
		        preparedStatement.executeUpdate(); 
		    } catch ( SQLException e ) {
		        throw new DAOException( e );
		    } finally {
		        
		    } 
		}
    
		
	}
	
		
	

	}


