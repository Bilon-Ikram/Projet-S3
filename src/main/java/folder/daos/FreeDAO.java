package folder.daos;

import java.util.List;





import folder.daos.DAOException;
import folder.beans.Animal;

public interface FreeDAO {
	public   void create( Animal animal ) throws DAOException;
	//Freelencer find( String nom ) throws DAOException;
	List<Animal> lister();
	void delete(int id,String img ) throws DAOException;
	 void update(Animal animal,boolean fileSelected)  throws DAOException;
	 Animal find( int id ) throws DAOException;
	 
	 //List<Animal> dispoPets(String type,String race,String sexe);
	 

	}