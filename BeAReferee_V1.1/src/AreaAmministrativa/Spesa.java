package AreaAmministrativa;

import java.util.Date;

public class Spesa {
	int cm;
	String Data;
	double Somma;
	String Causale;
	String Destinatario;
	
	public Spesa(){
		cm=-1;
		Data=null;
		Somma=0;
		Causale="";
		Destinatario="";
		
	}

	public int getCm() {
		return cm;
	}

	public void setCm(int cm) {
		this.cm = cm;
	}

	public String getData() {
		return Data;
	}

	public void setData(String data) {
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
