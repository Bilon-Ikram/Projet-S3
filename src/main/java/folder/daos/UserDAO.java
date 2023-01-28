package folder.daos;

import java.util.List;





import folder.daos.DAOException;
import folder.beans.Animal;
import folder.beans.User;

public interface UserDAO {
	public   void create( User user ) throws DAOException;
	public User login(User user);
	List<User> lister();
	User find( String cin ) throws DAOException;
	void updateProfile(User user )  throws DAOException;
	void updatePwd(String cin,String mdp )  throws DAOException;
}