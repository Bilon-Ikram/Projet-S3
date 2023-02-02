package folder.daos;

import java.util.List;

import folder.daos.DAOException;
import folder.beans.Animal;
import folder.beans.PetRes;
import folder.beans.PetResC;
import folder.beans.Reservation;



public interface ResDAO {
	public   void addRes(int idPet,String cin) throws DAOException;
	public   void delRes(int idPet,String cin) throws DAOException;
	List<PetRes> listerResClient(String cin,String statut);
	List<PetResC> listerRes(String statut);
	void update(String cin,int idPet,String statut)  throws DAOException;
	
}
