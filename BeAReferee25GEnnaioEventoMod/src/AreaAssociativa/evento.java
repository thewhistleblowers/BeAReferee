package AreaAssociativa;

public class evento {
	int ID_Evento;
	int Partecipanti;
	public evento(){
		ID_Evento=-1;
		Partecipanti=0;
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
	public int getPartecipanti() {
		return Partecipanti;
	}
	public void setPartecipanti(int partecipanti) {
		Partecipanti = partecipanti;
	}
}
