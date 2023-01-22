package folder.daos;

import java.util.List;





import folder.daos.DAOException;
import folder.beans.User;

public interface UserDAO {
	public   void create( User user ) throws DAOException;
	public User login(User user);

}