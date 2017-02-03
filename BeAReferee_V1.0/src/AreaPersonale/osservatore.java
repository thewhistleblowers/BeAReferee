package AreaPersonale;

public class osservatore extends associato{
	String Lega;
	public osservatore(){
		super();
		Lega="";
	}
	@Override
	public String toString() {
		return "arbitro [lega=" + Lega + ", CM=" + CM + "]";
	}
	public String getLega() {
		return Lega;
	}
	public void setLega(String lega) {
		this.Lega = lega;
	}

}
