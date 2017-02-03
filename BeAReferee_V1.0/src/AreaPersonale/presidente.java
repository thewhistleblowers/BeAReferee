package AreaPersonale;

public class presidente extends associato{
	
	public presidente(){
		super();
		
	}
	@Override
	public String toString() {
		return "presidente [CM=" + CM + ", cognome=" + cognome + ", nome=" + nome + "]";
	}

	public String getCM() {
		return CM;
	}
	public void setCM(String cM) {
		CM = cM;
	}

}
