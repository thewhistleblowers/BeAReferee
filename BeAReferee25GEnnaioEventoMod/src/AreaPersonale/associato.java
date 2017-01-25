package AreaPersonale;
public class associato {

	int CM;
	int stato;
	String cognome;
	String nome;
	String nascita;
	int gare;
	int telefono;
	int rifiuti;
	
	String codFisc;
	String sesso;
	String indirizzo;
	String civico;
	String città;
	String regioneResid;
	String IBAN;
	String E_mail;
	
	public associato() {
		CM = -1;
		stato=0;
		cognome= "";
		nome="";
		nascita="";
		gare=0;
		telefono=0;
		rifiuti=0;
		
		codFisc="";
		sesso="";
		indirizzo="";
		civico="";
		città="";
		regioneResid="";
		IBAN="";
		E_mail="";
	}


	public String getNascita() {
		return nascita;
	}


	public void setNascita(String nascita) {
		this.nascita = nascita;
	}


	public String getE_mail() {
		return E_mail;
	}


	public void setE_mail(String e_mail) {
		E_mail = e_mail;
	}


	public String getIBAN() {
		return IBAN;
	}


	public void setIBAN(String iBAN) {
		IBAN = iBAN;
	}


	public int getStato() {
		return stato;
	}


	public void setStato(int stato) {
		this.stato = stato;
	}


	public int getCM() {
		return CM;
	}


	public String getCognome() {
		return cognome;
	}


	public String getNome() {
		return nome;
	}


	public String getCodFisc() {
		return codFisc;
	}


	public String getSesso() {
		return sesso;
	}




	public void setNome(String nome) {
		this.nome = nome;
	}


	public void setCodFisc(String codFisc) {
		this.codFisc = codFisc;
	}


	public void setSesso(String sesso) {
		this.sesso = sesso;
	}


	public void setCognome(String cognome) {
		this.cognome = cognome;
	}


	public void setCM(int cM) {
		CM = cM;
	}


	


	public int getGare() {
		return gare;
	}


	public void setGare(int gare) {
		this.gare = gare;
	}


	public int getTelefono() {
		return telefono;
	}


	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}


	public int getRifiuti() {
		return rifiuti;
	}


	public void setRifiuti(int rifiuti) {
		this.rifiuti = rifiuti;
	}


	public String getIndirizzo() {
		return indirizzo;
	}


	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}


	public String getCivico() {
		return civico;
	}


	public void setCivico(String civico) {
		this.civico = civico;
	}


	public String getCittà() {
		return città;
	}


	public void setCittà(String città) {
		this.città = città;
	}


	public String getRegioneResid() {
		return regioneResid;
	}


	public void setRegioneResid(String regioneResid) {
		this.regioneResid = regioneResid;
	}


	@Override
	public String toString() {
		return "associato [CM=" + CM + ", cognome=" + cognome + ", nome=" + nome + ", codFisc=" + codFisc + "]";
	}


}
