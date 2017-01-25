package AreaAssociativa;

public class assenza {
		int ID_Registro;
		int ID_Riunione;
		int CM;
		public assenza(int cm){
			ID_Registro=-1;
			ID_Riunione=-1;
			CM=cm;
			
		}
		@Override
		public String toString() {
			return "assenza [ID_Registro=" + ID_Registro + ", ID_Riunione=" + ID_Riunione + ", CM=" + CM + "]";
		}
		public int getID_Registro() {
			return ID_Registro;
		}
		public void setID_Registro(int iD_Registro) {
			ID_Registro = iD_Registro;
		}
		public int getID_Riunione() {
			return ID_Riunione;
		}
		public void setID_Riunione(int iD_Riunione) {
			ID_Riunione = iD_Riunione;
		}
		public int getCM() {
			return CM;
		}
		public void setCM(int cM) {
			CM = cM;
		}
}
