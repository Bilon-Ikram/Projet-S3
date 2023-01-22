package folder;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class ImgUpload {
	private Part part;
	private String nomFichier;
	private int TAILLE_TAMPON;
    private String CHEMIN_FICHIERS;
	//private String extension;
    
    public ImgUpload(Part part,int TAILLE_TAMPON,String CHEMIN_FICHIERS) {
    	this.part=part;
    	this.TAILLE_TAMPON=TAILLE_TAMPON;
    	this.CHEMIN_FICHIERS=CHEMIN_FICHIERS;
    	
    }
	
	public int getTAILLE_TAMPON() {
		return TAILLE_TAMPON;
	}
	public void setTAILLE_TAMPON(int tAILLE_TAMPON) {
		TAILLE_TAMPON = tAILLE_TAMPON;
	}
	public String getCHEMIN_FICHIERS() {
		return CHEMIN_FICHIERS;
	}
	public void setCHEMIN_FICHIERS(String cHEMIN_FICHIERS) {
		CHEMIN_FICHIERS = cHEMIN_FICHIERS;
	}
	public Part getPart() {
		return part;
	}
	public void setPart(Part part) {
		this.part = part;
	}
	public String getNomFichier() {
		return nomFichier;
	}
	public void setNomFichier(String nomFichier) {
		this.nomFichier = nomFichier;
	}

	public int getTailleTampon() {
		return TAILLE_TAMPON;
	}
	public String getCheminFichiers() {
		return CHEMIN_FICHIERS;
	}


	
	public boolean fileSelected(HttpServletRequest request,String fieldName,int TAILLE_TAMPON,String CHEMIN_FICHIERS) throws IOException, ServletException {
    	Part part = request.getPart(fieldName);
    	ImgUpload imgPet= new ImgUpload(part,TAILLE_TAMPON,CHEMIN_FICHIERS);
    	String nomFichier = imgPet.getNomFichier(part);
    	if (nomFichier != null && !nomFichier.isEmpty()) {
    		return true;
    	}
    	return false;
	}
    
    
    
    
    public String getFileExt(String nomFichier) {
		 int index = nomFichier.lastIndexOf('.');
		 String extension = nomFichier.substring(index + 1);
		 return extension;
    }    
    
    public boolean isImg(String[] allowedExts,String extension) {
        boolean trouve=false;
        int i=0;
        while (i<allowedExts.length && !trouve) {
       	 if(allowedExts[i].equals(extension)) {
       		 trouve=true;
       	 }
       	 i++;}
        return trouve;
    }
    
    public String fname(String CHEMIN_FICHIERS,String nomFichier) {
   	   File f= new File(CHEMIN_FICHIERS+nomFichier);
   	   String extension=this.getFileExt(nomFichier);
   	   while (f.exists()) {
   	     nomFichier=UUID.randomUUID().toString() +"."+ extension;
   	     f= new File(CHEMIN_FICHIERS+nomFichier);
   	   }
   	   return nomFichier;
    	
    }
    
	 public void ecrireFichier( Part part, String nomFichier, String chemin ) throws IOException {
	        BufferedInputStream entree = null;
	        BufferedOutputStream sortie = null;
	        try {
	            entree = new BufferedInputStream(part.getInputStream(), TAILLE_TAMPON);
	            sortie = new BufferedOutputStream(new FileOutputStream(new File(chemin + nomFichier)), TAILLE_TAMPON);

	            byte[] tampon = new byte[TAILLE_TAMPON];
	            int longueur;
	            while ((longueur = entree.read(tampon)) > 0) {
	                sortie.write(tampon, 0, longueur);
	            }
	        } finally {
	            try {
	                sortie.close();
	            } catch (IOException ignore) {
	            }
	            try {
	                entree.close();
	            } catch (IOException ignore) {
	            }
	        }
	    }
	 
	    public String getNomFichier( Part part ) {
	        for ( String contentDisposition : part.getHeader( "content-disposition" ).split( ";" ) ) {
	            if ( contentDisposition.trim().startsWith( "filename" ) ) {
	                return contentDisposition.substring( contentDisposition.indexOf( '=' ) + 1 ).trim().replace( "\"", "" );
	            }
	        }
	        return null;
	    }

}

	


