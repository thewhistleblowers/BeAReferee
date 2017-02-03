package AreaPersonale;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import AreaAssociativa.evento;
import AreaTecnica.indisponibilita;
import Sistema.DriverMaagerConnectionPool;



public class associatoModel  {

	private static final String TABLE_NAME = "associato";
	private static final String TABLE_NAMEInd = "indisponibilità";
	private static final String TABLE_NAMEEve = "evento";


	public ArrayList <indisponibilita> visualizzaIndisponibilitaInviate(associato ar) throws SQLException {
		ArrayList <indisponibilita> indi= new ArrayList<indisponibilita>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String selectSQL = "SELECT * FROM " + associatoModel.TABLE_NAMEInd + " WHERE CM_Richiedente='"+ar.getCM()+"'";
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				indisponibilita in= new indisponibilita();
				in.setID_Indisponibilità(rs.getInt("ID_Indisponibilità"));
				in.setCM_Richiedente(rs.getString("CM_Richiedente"));
				in.setTipo(rs.getString("Tipo"));
				in.setGiorni(rs.getDouble("Giorni"));
				in.setData_Inizio(rs.getDate("Data_Inizio"));
				in.setData_Fine(rs.getDate("Data_Fine"));
				in.setStato(rs.getInt("Stato"));


				indi.add(in);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverMaagerConnectionPool.releaseConnection(connection);
			}
		}
		return indi;
	}



	public synchronized associato cercaCM(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		associato associat = new associato();

		String selectSQL = "SELECT * FROM " + associatoModel.TABLE_NAME + " WHERE CM = ?";

		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				associat.setCM(rs.getString("CM"));
				associat.setStato(rs.getInt("Stato"));
				associat.setCognome(rs.getString("Cognome"));
				associat.setNome(rs.getString("Nome"));
				associat.setGare(rs.getInt("Gare"));
				associat.setTelefono(rs.getInt("Num_Telefono"));
				associat.setRifiuti(rs.getInt("Rifiuti_ing"));
				associat.setCodFisc(rs.getString("Codice_Fiscale"));
				associat.setSesso(rs.getString("Sesso"));
				associat.setIndirizzo(rs.getString("Indirizzo"));
				associat.setCivico(rs.getString("Numero_Civico"));
				associat.setCittà(rs.getString("Città_di_Residenza"));
				associat.setRegioneResid(rs.getString("Regione_di_Residenza"));
				associat.setIBAN(rs.getString("IBAN"));
				associat.setE_mail(rs.getString("E_mail"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverMaagerConnectionPool.releaseConnection(connection);
			}
		}
		return associat;
	}

	/*s*/

	public synchronized void richiediIndisponibilita(associato ass,indisponibilita indi) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + associatoModel.TABLE_NAMEInd
				+ " (CM_Richiedente,Tipo,Giorni,Data_Inizio,Data_Fine,Stato) VALUES (?, ?, ?, ?, ?, ?)";
		//DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date init= indi.getData_Inizio();
		//	String inizio=df.format(init);

		Date end= indi.getData_Fine();
		//String fine=df.format(end);

		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			//preparedStatement.setInt(1, indi.getID_Indisponibilità());
			preparedStatement.setString(1, ass.getCM());
			preparedStatement.setString(2, indi.getTipo());
			preparedStatement.setDouble(3, indi.getGiorni());
			java.util.Date utilStartDate = init;
			java.sql.Date sqlStartDate = new java.sql.Date(utilStartDate.getTime());
			java.util.Date f = end;
			java.sql.Date sqlStartDatef = new java.sql.Date(f.getTime());
			preparedStatement.setDate(4, sqlStartDate);
			preparedStatement.setDate(5, sqlStartDatef);
			preparedStatement.setInt(6, indi.getStato());


			preparedStatement.executeUpdate();

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverMaagerConnectionPool.releaseConnection(connection);
			}
		}
	}


	public synchronized boolean controllaInd(String ass) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement mod = null;
		Date oggi= new Date();
		System.out.println(oggi);
		int x=0;
		boolean ok=false;
		String insertSQL = "Select Data_Fine from indisponibilità where CM_Richiedente='"+ass+"' and Stato=1";
		String modat= "Update associato set Stato=0";
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		//Date init= indi.getData_Inizio();
		//	Date inizio=df.format(oggi);

		//Date end= indi.getData_Fine();
		//String fine=df.format(end);

		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()){
				x++;
				if (rs.getDate("Data_Fine").before(oggi)){
					ok=true;
					mod=connection.prepareStatement(modat);
					mod.executeUpdate();
				}
			}
			if(x==0)
				ok=true;				

			//preparedStatement.executeUpdate();

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverMaagerConnectionPool.releaseConnection(connection);
			}
		}
		return ok;
	}


	public synchronized void accettaEvento(associato ass,evento evento) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String SQL="INSERT INTO "+associatoModel.TABLE_NAMEEve+ "(ID_Evento, Partecipanti) VALUES (?, ?)";
		String insertSQL = "UPDATE " + associatoModel.TABLE_NAMEEve + " SET Partecipanti=" +ass.getCM()+" WHERE ID_Evento=" +evento.getID_Evento();
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			if (evento.getPartecipanti()==null){
				preparedStatement = connection.prepareStatement(insertSQL);
				preparedStatement.executeUpdate();
			}
			else{
				preparedStatement = connection.prepareStatement(SQL);
				preparedStatement.setInt(1, evento.getID_Evento());
				preparedStatement.setString(2, ass.getCM());
				preparedStatement.executeUpdate();

			}

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverMaagerConnectionPool.releaseConnection(connection);
			}
		}
	}



}