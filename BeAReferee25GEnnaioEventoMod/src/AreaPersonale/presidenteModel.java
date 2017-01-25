package AreaPersonale;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import AreaAssociativa.assenza;
import AreaAssociativa.evento;
import AreaTecnica.gara;
import AreaTecnica.indisponibilita;
import Sistema.DriverMaagerConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


public class presidenteModel {

	private static final String TABLE_NAME = "associato";
	private static final String TABLE_NAMEAr = "arbitro";
	private static final String TABLE_NAMEOs = "osservatore";
	private static final String TABLE_NAMEGar = "gara";
	private static final String TABLE_NAMEAssenza = "registro assenze";
	private static final String TABLE_NAMEEve= "evento";
	private static final String TABLE_NAMEIndi= "indisponibilità";
	private static final String TABLE_NAMErim= "indisponibilità";
	
	public synchronized void inserimentoAssociato(associato asso) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + presidenteModel.TABLE_NAME
				+ " (CM, Stato, Cognome, Nome, Gare, Num_Telefono, Rifiuti_ing, Codice_Fiscale, Sesso, Indirizzo, Numero_Civico, Città_di_Residenza, Regione_di_Residenza, IBAN, E_mail, Data_di_Nascita) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, asso.getCM());
			preparedStatement.setInt(2, asso.getStato());
			preparedStatement.setString(3, asso.getCognome());
			preparedStatement.setString(4, asso.getNome());
			preparedStatement.setInt(5, asso.getGare());
			preparedStatement.setInt(6, asso.getTelefono());
			preparedStatement.setInt(7, asso.getRifiuti());
			preparedStatement.setString(8, asso.getCodFisc());
			preparedStatement.setString(9, asso.getSesso());
			preparedStatement.setString(10, asso.getIndirizzo());
			preparedStatement.setString(11, asso.getCivico());
			preparedStatement.setString(12, asso.getCittà());
			preparedStatement.setString(13, asso.getRegioneResid());
			preparedStatement.setString(14, asso.getIBAN());
			preparedStatement.setString(15, asso.getE_mail());
			preparedStatement.setString(16, asso.getNascita());
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

	
	public synchronized associato cercaCM(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		associato associat = new associato();

		String selectSQL = "SELECT * FROM " + presidenteModel.TABLE_NAME + " WHERE CM = ?";

		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				associat.setCM(rs.getInt("CM"));
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
				associat.setNascita(rs.getString("Data_di_Nascita"));
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
	


	public synchronized boolean rimozione(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + presidenteModel.TABLE_NAME + " WHERE CM = ?";

		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverMaagerConnectionPool.releaseConnection(connection);
			}
		}
		return (result != 0);
	}

	
	public synchronized Collection<arbitro> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<arbitro> associatoMod = new LinkedList<arbitro>();

		String selectSQL = "SELECT * FROM " + presidenteModel.TABLE_NAMEAr;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
//				int cm=0;
				arbitro associat= new arbitro();

				associat.setCM(rs.getInt("CM"));
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
				associat.setNascita(rs.getString("Data_di_Nascita"));
				
				
				
				associatoMod.add(associat);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverMaagerConnectionPool.releaseConnection(connection);
			}
		}
		return associatoMod;
	}
	
	public synchronized Collection<osservatore> doRetrieveAllOss(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<osservatore> associatoMod = new LinkedList<osservatore>();

		String selectSQL = "SELECT * FROM " + presidenteModel.TABLE_NAMEOs;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				//int cm=0;
				osservatore associat= new osservatore();

				associat.setCM(rs.getInt("CM"));
				associat.setLega(rs.getString("Lega"));
				
				associatoMod.add(associat);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverMaagerConnectionPool.releaseConnection(connection);
			}
		}
		return associatoMod;
	}

	public synchronized void designaGaraArb(gara gar, arbitro asso, int soldi) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement inserimento = null;
		String insertSQL = "UPDATE " + presidenteModel.TABLE_NAMEGar + " SET CM_Arbitro='" +asso.getCM() +"' WHERE ID_Partita=" +gar.getID_Partita();
		String rimborso = "INSERT INTO " + presidenteModel.TABLE_NAMErim
				+ " (ID_Partita, Somma) VALUES (?, ?)";
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			inserimento= connection.prepareStatement(rimborso);
//			inserimento.setInt(1,rimborsoid);
			inserimento.setInt(2,gar.getID_Partita());
//			inserimento.setInt(3, 0);
//			inserimento.setInt(4, 0);
			inserimento.setInt(5, soldi);
//			rimborsoid++;
			preparedStatement.executeUpdate();
			inserimento.executeQuery();
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
	
	public synchronized void designaGaraOss(gara gar, osservatore asso) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "UPDATE " + presidenteModel.TABLE_NAMEGar + " SET CM_Osservatore=" +asso.getCM() +" WHERE ID_Partita=" +gar.getID_Partita();
		String insertSQLNo = "UPDATE " + presidenteModel.TABLE_NAMEGar + " SET CM_Osservatore=0 WHERE ID_Partita=" +gar.getID_Partita();
		try {
			if (asso.getCM()==0)
			{
				connection = DriverMaagerConnectionPool.getConnection();
				preparedStatement = connection.prepareStatement(insertSQLNo);
				preparedStatement.executeUpdate();
			}
			else
			{
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			
			
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
	
	public synchronized void modificaLegaArbitro(arbitro asso, String lega) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "UPDATE " + presidenteModel.TABLE_NAMEAr + " SET Lega='" +lega+"' WHERE CM=" +asso.getCM();
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			
			
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
	
	public synchronized void modificaLegaOsservatore(osservatore asso, String lega) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "UPDATE " + presidenteModel.TABLE_NAMEOs + " SET Lega='" +lega+"' WHERE CM=" +asso.getCM();
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			
			
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
	
	public synchronized void inserisciAssenza(assenza ax,associato asso) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "INSERT INTO " + presidenteModel.TABLE_NAMEAssenza
				+ " (ID_Registro,ID_Riunione,Associato) VALUES (?, ?, ?)";

		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, ax.getID_Registro());
			preparedStatement.setInt(2, ax.getID_Riunione());
			preparedStatement.setInt(3, asso.getCM());
			
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
	
	
	public synchronized void inserisciEvento(evento evento) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO " + presidenteModel.TABLE_NAMEEve + " ID_Evento=" +evento.getID_Evento();
		
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			
			
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
	
	public synchronized void accettaIndisponibilita(indisponibilita indi,associato ass) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement agg = null;

		String insertSQL = "UPDATE " + presidenteModel.TABLE_NAMEIndi + " SET Stato=1 WHERE ID_Indisponibilità='"+indi.getID_Indisponibilità()+ "'";
		String aggiornamento = "UPDATE " + presidenteModel.TABLE_NAME + " SET Stato=1 WHERE CM=" +ass.getCM();
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			agg = connection.prepareStatement(aggiornamento);
			
			preparedStatement.executeUpdate();
			agg.executeUpdate();
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
	
	public synchronized void rifiutaIndisponibilita(indisponibilita indi,associato ass) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		

		String insertSQL = "UPDATE " + presidenteModel.TABLE_NAMEIndi + " SET Stato=3 WHERE ID_Indisponibilità='"+indi.getID_Indisponibilità()+ "'";
	
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
		
			
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
	
	
}