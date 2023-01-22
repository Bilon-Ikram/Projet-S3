package folder.daos;

import java.io.File;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import folder.daos.DAOException;
import folder.beans.Animal;
import folder.beans.User;




public class UserDAOImpl implements UserDAO {

	private DAOFactory  daoFactory;

    public UserDAOImpl( DAOFactory daoFactory ) {
        this.daoFactory = daoFactory;
    }
    
    @Override
	public void create(User user) throws DAOException{
        Connection connexion = null;
        PreparedStatement preparedStatement = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO user VALUES(?,?,?, ?, ?, ?,?,?,?);");
            preparedStatement.setString(1, user.getCinU());
            preparedStatement.setString(2, user.getNomU());
            preparedStatement.setString(3, user.getPrenomU());
            preparedStatement.setString(4, user.getSexeU());
            preparedStatement.setString(5,user.getPhoneU() );
            preparedStatement.setString(6, user.getEmailU());
            preparedStatement.setString(7, user.getLoginU());
            try {
				String hashedPwd=sha1(user.getPwdU());
				preparedStatement.setString(8,hashedPwd );
				
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
            preparedStatement.setString(9, user.getTypeU());


            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    
    //Use Secure Hash Algorithm 1 to hash users passwords
    public static String sha1(String input) throws NoSuchAlgorithmException {
        MessageDigest mDigest = MessageDigest.getInstance("SHA1");
        byte[] result = mDigest.digest(input.getBytes());
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < result.length; i++) {
            sb.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
        }
         
        return sb.toString();
    }
    
    @override
    public User login(User user) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;
	    User  uti = null;
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("select * from user where loginU=? and pwdU=?;");
            preparedStatement.setString(1, user.getLoginU());
            try {
				String hashedPwd=sha1(user.getPwdU());
				preparedStatement.setString(2, hashedPwd);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
            	uti = map( resultSet );	
            }
  
        } catch (SQLException e) {
            e.printStackTrace();}
        
    	
	    return uti;
    
}
    
	private static User map( ResultSet resultSet ) throws SQLException {
		User user = new User();
		
		user.setCinU(resultSet.getString ("cinU" ));
		user.setNomU(resultSet.getString ("nomU" ));
		user.setPrenomU(resultSet.getString ("prenomU" ));
		user.setSexeU(resultSet.getString ("sexeU" ));
		user.setPhoneU(resultSet.getString ("phoneU" ));
		user.setEmailU(resultSet.getString ("emailU" ));
		user.setLoginU(resultSet.getString ("loginU" ));
		user.setPwdU(resultSet.getString ("pwdU" ));
		user.setTypeU(resultSet.getString ("typeU" ));
		return user;
	}
		
}	