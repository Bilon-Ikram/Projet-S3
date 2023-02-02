package folder.beans;

public class Reservation {
	private int idPet;
	private String cin;
	private String dateRes;
	private String statutRes;
	
	
	public int getIdPet() {
		return idPet;
	}
	public void setIdPet(int id_pet) {
		this.idPet = id_pet;
	}
	public String getCin() {
		return cin;
	}
	public void setCin(String cin) {
		this.cin = cin;
	}
	public String getDateRes() {
		return dateRes;
	}
	public void setDateRes(String dateRes) {
		this.dateRes = dateRes;
	}
	public String getStatutRes() {
		return statutRes;
	}
	public void setStatutRes(String statutRes) {
		this.statutRes = statutRes;
	}
	

}
