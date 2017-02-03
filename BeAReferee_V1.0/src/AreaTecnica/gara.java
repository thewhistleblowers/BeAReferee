package AreaTecnica;
public class gara {

	int ID_Partita;
	String Lega;
	String CM_Arbitro;
	String CM_Osservatore;
	String Indirizzo_Stadio;
	int Numero_Civico;
	String Regione_Stadio;
	String Città_Stadio;
	int Stato_Osservatore;
	String Squadra_Casa;
	String Squadra_Ospite;
	int Stato_Arbitro;
	String Data;
	String Ora;

	
	public gara() {
		ID_Partita = -1;
		Lega= "" ;
		CM_Arbitro= "";
		CM_Osservatore="";
		Indirizzo_Stadio="";
		Numero_Civico=0;
		Regione_Stadio="";
		Città_Stadio="";
		Stato_Osservatore=0;
		Squadra_Casa="";
		Squadra_Ospite="";
		Stato_Arbitro=0;
		Data="";
		Ora="";
	}



	public String getData() {
		return Data;
	}



	public void setData(String data) {
		Data = data;
	}



	public String getOra() {
		return Ora;
	}



	public void setOra(String ora) {
		Ora = ora;
	}



	public int getID_Partita() {
		return ID_Partita;
	}



	public void setID_Partita(int iD_Partita) {
		ID_Partita = iD_Partita;
	}



	public String getLega() {
		return Lega;
	}



	public void setLega(String lega) {
		Lega = lega;
	}



	public String getCM_Arbitro() {
		return CM_Arbitro;
	}



	public void setCM_Arbitro(String cM_Arbitro) {
		CM_Arbitro = cM_Arbitro;
	}



	public String getCM_Osservatore() {
		return CM_Osservatore;
	}



	public void setCM_Osservatore(String cM_Osservatore) {
		CM_Osservatore = cM_Osservatore;
	}



	public String getIndirizzo_Stadio() {
		return Indirizzo_Stadio;
	}



	public void setIndirizzo_Stadio(String indirizzo_Stadio) {
		Indirizzo_Stadio = indirizzo_Stadio;
	}



	public int getNumero_Civico() {
		return Numero_Civico;
	}



	public void setNumero_Civico(int numero_Civico) {
		Numero_Civico = numero_Civico;
	}



	public String getRegione_Stadio() {
		return Regione_Stadio;
	}



	public void setRegione_Stadio(String regione_Stadio) {
		Regione_Stadio = regione_Stadio;
	}



	public String getCittà_Stadio() {
		return Città_Stadio;
	}



	public void setCittà_Stadio(String città_Stadio) {
		Città_Stadio = città_Stadio;
	}



	public int getStato_Arbitro() {
		return Stato_Arbitro;
	}



	public void setStato_Arbitro(int stato_Designazione) {
		Stato_Arbitro = stato_Designazione;
	}



	public int getStato_Osservatore() {
		return Stato_Osservatore;
	}



	public void setStato_Osservatore(int stato_Osservatore) {
		Stato_Osservatore = stato_Osservatore;
	}



	public String getSquadra_Casa() {
		return Squadra_Casa;
	}



	public void setSquadra_Casa(String squadra_Casa) {
		Squadra_Casa = squadra_Casa;
	}



	public String getSquadra_Ospite() {
		return Squadra_Ospite;
	}



	public void setSquadra_Ospite(String squadra_Ospite) {
		Squadra_Ospite = squadra_Ospite;
	}



	@Override
	public String toString() {
		return "gara [ID_Partita=" + ID_Partita + ", Lega=" + Lega + ", CM_Arbitro=" + CM_Arbitro + ", CM_Osservatore="
				+ CM_Osservatore + ", Indirizzo_Stadio=" + Indirizzo_Stadio + ", Numero_Civico=" + Numero_Civico
				+ ", Regione_Stadio=" + Regione_Stadio + ", Città_Stadio=" + Città_Stadio + ", Stato_Osservatore="
				+ Stato_Osservatore + ", Squadra_Casa=" + Squadra_Casa + ", Squadra_Ospite=" + Squadra_Ospite
				+ ", Stato_Arbitro=" + Stato_Arbitro + "]";
	}



	




}
