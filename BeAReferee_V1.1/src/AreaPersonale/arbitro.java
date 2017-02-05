package AreaPersonale;

public class arbitro extends associato{
	String Lega;
	String Taglia_Divisa;
	int Taglia_Scarpe;
	
	
	public arbitro(){
		super();
		Lega="";
		Taglia_Divisa="";
		Taglia_Scarpe=0;
	}

	public String getTaglia_Divisa() {
		return Taglia_Divisa;
	}
	public void setTaglia_Divisa(String taglia_Divisa) {
		Taglia_Divisa = taglia_Divisa;
	}
	public int getTaglia_Scarpe() {
		return Taglia_Scarpe;
	}
	public void setTaglia_Scarpe(int taglia_Scarpe) {
		Taglia_Scarpe = taglia_Scarpe;
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
