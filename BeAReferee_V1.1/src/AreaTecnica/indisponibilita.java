package AreaTecnica;

import java.util.Date;

public class indisponibilita {
	int ID_IndisponibilitÓ;
	String CM_Richiedente;
	String Tipo;
	double Giorni;
	Date Data_Inizio;
	Date Data_Fine;
	int Stato;

	public indisponibilita(){
		ID_IndisponibilitÓ=-1;
		CM_Richiedente="";
		Tipo="";
		Data_Inizio=null;
		Data_Fine=null;
		Giorni=0;
		Stato=0;
	}
	
	
	
	
	public int getID_IndisponibilitÓ() {
		return ID_IndisponibilitÓ;
	}
	public void setID_IndisponibilitÓ(int iD_IndisponibilitÓ) {
		ID_IndisponibilitÓ = iD_IndisponibilitÓ;
	}
	public String getCM_Richiedente() {
		return CM_Richiedente;
	}
	public void setCM_Richiedente(String cM_Richiedente) {
		CM_Richiedente = cM_Richiedente;
	}
	public String getTipo() {
		return Tipo;
	}
	public void setTipo(String tipo) {
		Tipo = tipo;
	}
	public void setGiorni(double giorni) {
		Giorni = giorni;
	}
	public double getGiorni() {
		long millisecfin=Data_Fine.getTime();
		long millisecini=Data_Inizio.getTime();
		long giorni=millisecfin-millisecini;
		double Giorni= giorni/86400000;
		return Giorni;
	}
	
	public Date getData_Inizio() {
		return Data_Inizio;
	}
	public void setData_Inizio(Date data_Inizio) {
		Data_Inizio = data_Inizio;
	}
	public Date getData_Fine() {
		return Data_Fine;
	}
	public void setData_Fine(Date data_Fine) {
		Data_Fine = data_Fine;
	}
	public int getStato() {
		return Stato;
	}
	public void setStato(int stato) {
		Stato = stato;
	}
}
