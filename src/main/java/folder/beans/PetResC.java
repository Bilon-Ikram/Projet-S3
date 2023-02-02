package folder.beans;

public class PetResC {
	private Animal pet;
	private Reservation res;
	private User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Animal getPet() {
		return pet;
	}
	public void setPet(Animal pet) {
		this.pet = pet;
	}
	public Reservation getRes() {
		return res;
	}
	public void setRes(Reservation res) {
		this.res = res;
	}
}
