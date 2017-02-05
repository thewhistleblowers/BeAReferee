package AreaAssociativa;

public class evento {
	int ID_Evento;
	String Partecipanti;
	public evento(){
		ID_Evento=-1;
		Partecipanti="";
	}
	@Override
	public String toString() {
		return "evento [ID_Evento=" + ID_Evento + ", Partecipanti=" + Partecipanti + "]";
	}
	public int getID_Evento() {
		return ID_Evento;
	}
	public void setID_Evento(int iD_Evento) {
		ID_Evento = iD_Evento;
	}
	public String getPartecipanti() {
		return Partecipanti;
	}
	public void setPartecipanti(String partecipanti) {
		Partecipanti = partecipanti;
	}
}
