package AreaPersonale;

public class presidente extends associato{
	
	public presidente(){
		super();
		
	}
	@Override
	public String toString() {
		return "presidente [CM=" + CM + ", cognome=" + cognome + ", nome=" + nome + "]";
	}

	public int getCM() {
		return CM;
	}
	public void setCM(int cM) {
		CM = cM;
	}

}
