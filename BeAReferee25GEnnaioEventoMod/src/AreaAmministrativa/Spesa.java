package AreaAmministrativa;

import java.util.Date;

public class Spesa {
	Date Data;
	double Somma;
	String Causale;
	String Destinatario;
	
	public Spesa(){
		Data=null;
		Somma=0;
		Causale="";
		Destinatario="";
		
	}

	public Date getData() {
		return Data;
	}

	public void setData(Date data) {
		Data = data;
	}

	public double getSomma() {
		return Somma;
	}

	public void setSomma(double somma) {
		Somma = somma;
	}

	public String getCausale() {
		return Causale;
	}

	public void setCausale(String causale) {
		Causale = causale;
	}

	public String getDestinatario() {
		return Destinatario;
	}

	public void setDestinatario(String destinatario) {
		Destinatario = destinatario;
	}
}
