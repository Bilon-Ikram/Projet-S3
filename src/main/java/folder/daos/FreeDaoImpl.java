package folder.daos;

import java.io.File;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


import folder.daos.DAOException;
import folder.beans.Animal;
import folder.beans.User;




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
            preparedStatement = connexion.prepareStatement("INSERT INTO animal (type,nom, race,sexe,date_naissance,photo,prix,statut) VALUES(?,?, ?, ?, ?,?,?,?);");
            preparedStatement.setString(1, pet.getType());
            preparedStatement.setString(2, pet.getNom());
            preparedStatement.setString(3, pet.getRace());
            preparedStatement.setString(4, pet.getSexe());
            Date datePet=Date.valueOf(pet.getDateNaissance());
            preparedStatement.setDate(5, datePet);
            preparedStatement.setString(6, pet.getPhoto());
            //preparedStatement.setString(7, pet.getDetail());
            preparedStatement.setString(7, pet.getPrix());
            preparedStatement.setString(8, pet.getStatut());


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
		//pet.setDetail(resultSet.getString ("detail" ));
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

	
	//chercher les animaux disponibles :
	public List < Animal> listDispPets(String type, String race,String sexe,String age,String statut) {
		 List <  Animal > pets = new ArrayList < >();
		    Connection connexion = null;
		    PreparedStatement preparedStatement = null;
		    ResultSet resultSet = null;
		    Animal pet = null;

		    try {
		        connexion = daoFactory.getConnection();
		        String dateLimite=getDateLimiteP(type,race);
		        System.out.println(dateLimite);
		        if(age.equals("Chaton") || age.equals("Chiot")) {
		        	preparedStatement = connexion.prepareStatement("select * from animal where type=? and race=? and sexe=? and date_naissance >= ?;");
		        }
		        else {
		        	preparedStatement = connexion.prepareStatement("select * from animal where type=? and race=? and sexe=? and date_naissance < ?;");
		        }
		        
		        preparedStatement.setString(1, type);
		        preparedStatement.setString(2, race);
		        preparedStatement.setString(3, sexe);
		        preparedStatement.setString(4, dateLimite);
		        resultSet = preparedStatement.executeQuery();
		       
		        int i=0;  
		        while ( resultSet.next() ) {
		        	i++;
		        	System.out.println("i="+i);
		        	pet = map( resultSet );
		        	System.out.println(pet.getId());
		        	pets.add(pet);
		        }
		    } catch ( SQLException e ) {
		        throw new DAOException( e );
		    } finally {
		        
		    }


		    return pets;


		
		

	}
	
	
	public String getDateLimiteP(String type,String race) {
		LocalDate dateCourrante= java.time.LocalDate.now();
		System.out.println(dateCourrante);
		
		int year= dateCourrante.getYear();
		int month_I=dateCourrante.getMonthValue();
		
		String month=String.valueOf(month_I);
		if(month_I<=9) {
			month="0"+month;
		}
		
		int day_I=dateCourrante.getDayOfMonth();
		String day=String.valueOf(day_I);
		if(day_I<=9) {
			day="0"+day;
		}

		String dateLimite="";
		if(type.equals("Chat")) {
			if(race.equals("Bengal")) {
				dateLimite=String.valueOf(year-1)+"-"+month+"-"+day;
			}
			if(race.equals("Sacré de Birmanie")) {
				dateLimite=String.valueOf(year-2)+"-"+month+"-"+day;
			}
			if(race.equals("Maine Coon")) {
				dateLimite=String.valueOf(year-4)+"-"+month+"-"+day;
			}
		}
		else {
			if(month_I==1 || month_I==3 || month_I==8 || month_I==10 ) {
				if(day_I==31) {
					day_I--;
					day=String.valueOf(day_I);
				}
			}
			if (month_I==6 && day_I>28 ) {
				day_I=28;
				day=String.valueOf(day_I);
				
			}
			if(month_I<=4) {
				year=year-2;
				month_I=12+(month_I-4);
			}
			else {
				year=year-1;
				month_I=month_I-4;
			}
			month=String.valueOf(month_I);
			if(month_I<=9) {
				month="0"+month;
			}
			
			dateLimite=String.valueOf(year)+"-"+month+"-"+day;
		}
		return dateLimite;
		
	}
	
	@Override
	
	public void update(Animal pet,boolean fileSelected) throws DAOException {
	    Connection connexion = null;
	    PreparedStatement preparedStatement = null;
		if(fileSelected) {
			final String SQL_UPDATE ="UPDATE animal SET type=?,nom=?,race=?,sexe=?,date_naissance=?, photo=?,prix=?,statut=? WHERE id=?";
		    try {
			       
		        connexion = daoFactory.getConnection();
		        preparedStatement = connexion.prepareStatement(SQL_UPDATE);
		        preparedStatement.setString(1,pet.getType());
		        preparedStatement.setString(2,pet.getNom());
		        preparedStatement.setString(3,pet.getRace());
		        preparedStatement.setString(4,pet.getSexe());
		        preparedStatement.setString(5,pet.getDateNaissance());
		        preparedStatement.setString(6,pet.getPhoto());
		        //preparedStatement.setString(7,pet.getDetail());
		        preparedStatement.setString(7,pet.getPrix());
		        preparedStatement.setString(8,pet.getStatut());
		        preparedStatement.setInt(9,pet.getId());
		        preparedStatement.executeUpdate(); 
		    } catch ( SQLException e ) {
		        throw new DAOException( e );
		    } finally {
		        
		    }    
		}
		else {
			final String SQL_UPDATE ="UPDATE animal SET type=?,nom=?,race=?,sexe=?,date_naissance=?,prix=?,statut=? WHERE id=?";
		    try {
			       
		        connexion = daoFactory.getConnection();
		        preparedStatement = connexion.prepareStatement(SQL_UPDATE);
		        preparedStatement.setString(1,pet.getType());
		        preparedStatement.setString(2,pet.getNom());
		        preparedStatement.setString(3,pet.getRace());
		        preparedStatement.setString(4,pet.getSexe());
		        preparedStatement.setString(5,pet.getDateNaissance());
		        //preparedStatement.setString(6,pet.getDetail());
		        preparedStatement.setString(6,pet.getPrix());
		        preparedStatement.setString(7,pet.getStatut());
		        preparedStatement.setInt(8,pet.getId());
		        preparedStatement.executeUpdate(); 
		    } catch ( SQLException e ) {
		        throw new DAOException( e );
		    } finally {
		        
		    } 
		}
    
		
	}
	
		
	

	}


