package AreaPersonale;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;

import java.util.LinkedList;


import AreaAssociativa.assenza;

import Sistema.DriverMaagerConnectionPool;
import java.io.File;


public class presidenteModel {

	private static final String TABLE_NAME = "associato";
	private static final String TABLE_NAMEAr = "arbitro";
	private static final String TABLE_NAMEOs = "osservatore";
	private static final String TABLE_NAMEGar = "gara";
	private static final String TABLE_NAMEAssenza = "registro_assenze";
	private static final String TABLE_NAMEEve= "evento";
	private static final String TABLE_NAMEIndi= "indisponibilità";
	private static final String TABLE_NAMErim= "rimborso";
	
	public synchronized associato inserimentoAssociato(associato asso) throws SQLException {
		associato associato= new associato();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs;
		PreparedStatement arbitro = null;
		String insertSQL = "INSERT INTO " + presidenteModel.TABLE_NAME
				+ " (Stato, Cognome, Nome, Gare, Num_Telefono, Rifiuti_ing, Codice_Fiscale, Sesso, Indirizzo, Numero_Civico, Città_di_Residenza, Regione_di_Residenza, IBAN, E_mail, Data_di_Nascita) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
	//	String insert = "INSERT INTO " + presidenteModel.TABLE_NAMEAr+" (CM,Lega,Taglia_Divisa,Taglia_Scarpe) VALUES (?,?,?,?)";
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			
			//preparedStatement.setString(1, asso.getCM());
			preparedStatement.setInt(1, asso.getStato());
			preparedStatement.setString(2, asso.getCognome());
			preparedStatement.setString(3, asso.getNome());
			preparedStatement.setInt(4, asso.getGare());
			preparedStatement.setInt(5, asso.getTelefono());
			preparedStatement.setInt(6, asso.getRifiuti());
			preparedStatement.setString(7, asso.getCodFisc());
			preparedStatement.setString(8, asso.getSesso());
			preparedStatement.setString(9, asso.getIndirizzo());
			preparedStatement.setString(10, asso.getCivico());
			preparedStatement.setString(11, asso.getCittà());
			preparedStatement.setString(12, asso.getRegioneResid());
			preparedStatement.setString(13, asso.getIBAN());
			preparedStatement.setString(14, asso.getE_mail());
			preparedStatement.setString(15, asso.getNascita());
			preparedStatement.executeUpdate();
			connection.commit();
		
			String selectSQL = "SELECT * FROM " + presidenteModel.TABLE_NAME+ " WHERE Codice_Fiscale='"+asso.getCodFisc()+"'";
			arbitro = connection.prepareStatement(selectSQL);
			rs = arbitro.executeQuery();
			while(rs.next()){
				associato.setCM(rs.getString("CM"));
				associato.setStato(rs.getInt("Stato"));
				associato.setCognome(rs.getString("Cognome"));
				associato.setNome(rs.getString("Nome"));
				associato.setGare(rs.getInt("Gare"));
				associato.setTelefono(rs.getInt("Num_Telefono"));
				associato.setRifiuti(rs.getInt("Rifiuti_ing"));
				associato.setCodFisc(rs.getString("Codice_Fiscale"));
				associato.setSesso(rs.getString("Sesso"));
				associato.setIndirizzo(rs.getString("Indirizzo"));
				associato.setCivico(rs.getString("Numero_Civico"));
				associato.setCittà(rs.getString("Città_di_Residenza"));
				associato.setRegioneResid(rs.getString("Regione_di_Residenza"));
				associato.setIBAN(rs.getString("IBAN"));
				associato.setE_mail(rs.getString("E_mail"));
				associato.setNascita(rs.getString("Data_di_Nascita"));
			}
			
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverMaagerConnectionPool.releaseConnection(connection);
			}
		}
		return associato;
	}
	
	
	
	

	public synchronized void inserimentoArb(associato asso) throws SQLException {
		File f = null;
	    boolean bool = false;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO "+presidenteModel.TABLE_NAMEAr+" (CM, Lega, Taglia_Divisa, Taglia_Scarpe) VALUES (?, ?, ?, ?)";

		try {
			connection = DriverMaagerConnectionPool.getConnection();
			
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, asso.getCM());
			preparedStatement.setString(2, "Settore Giovanile");
			preparedStatement.setString(3, null);
			preparedStatement.setInt(4, 0);
			preparedStatement.executeUpdate();

			connection.commit();
			
			f = new File("C:/Users/Nello_9/Desktop/prova/ref/WebContent/"+asso.getCM());
            // create
	        bool = f.mkdir();
	        // print
	         System.out.print("Cartella Creata? "+bool);
			
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverMaagerConnectionPool.releaseConnection(connection);
			}
		}
	}
	
	public synchronized void inserimentoOss(associato asso) throws SQLException {
		File f = null;
	    boolean bool = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO osservatore (CM, Lega)VALUES (?, ?)";

		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, asso.getCM());
			preparedStatement.setString(2, "Settore Giovanile");
			preparedStatement.executeUpdate();

			connection.commit();
			f = new File("C:/Users/Nello_9/Desktop/prova/ref/WebContent/"+asso.getCM());
            // create
	        bool = f.mkdir();
	        // print
	         System.out.print("Cartella Creata? "+bool);
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverMaagerConnectionPool.releaseConnection(connection);
			}
		}
	}
	
	public synchronized associato cercaCM(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		associato associat = new associato();

		String selectSQL = "SELECT * FROM " + presidenteModel.TABLE_NAME + " WHERE CM = ?";

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
	


	public synchronized boolean rimozione(String code) throws SQLException {
		
		Connection connection = null;
		//PreparedStatement preparedStatement = null;
		//PreparedStatement cancella=null;
		Statement cancella=null;
		boolean ok=false;
		int x=0;
		String delete="DELETE FROM "+presidenteModel.TABLE_NAME+" WHERE CM='"+code+"'";
		System.out.println(delete);

		try {
			connection = DriverMaagerConnectionPool.getConnection();
			//cancella.setString(1, code);
			cancella=connection.createStatement();
			
			//cancella= connection.prepareStatement(delete);
			
			
			x=cancella.executeUpdate(delete);
			if(x>0)
				ok=true;
			System.out.println("x è uguale a"+x);
			connection.commit();
			File f = new File("C:/Users/Nello_9/Desktop/prova/ref/WebContent/"+code);
			f.delete();
		} finally {
			try {
				if (cancella != null)
					cancella.close();
			} finally {
				DriverMaagerConnectionPool.releaseConnection(connection);
			}
		}
		return ok;
	}

	
	public ArrayList<associato> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<associato> associato= new ArrayList<associato>();

		String selectSQL = "SELECT * FROM " + presidenteModel.TABLE_NAME+" ORDER BY "+order;

		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
//				int cm=0;
				associato associat= new associato();

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
				associat.setNascita(rs.getString("Data_di_Nascita"));
				
				
				
				associato.add(associat);
				connection.commit();
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverMaagerConnectionPool.releaseConnection(connection);
			}
		}
		return associato;
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

				associat.setCM(rs.getString("CM"));
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

	public synchronized void designaGaraArb(int gar, String asso, int soldi) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement inserimento = null;
		String insertSQL = "UPDATE " + presidenteModel.TABLE_NAMEGar + " SET CM_Arbitro='" +asso +"' WHERE ID_Partita=" +gar;
		String rimborso = "INSERT INTO " + presidenteModel.TABLE_NAMErim
				+ " (ID_Partita,CM_Arbitro, Somma) VALUES (?, ?, ?)";
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			inserimento= connection.prepareStatement(rimborso);
//			inserimento.setInt(1,rimborsoid);
			inserimento.setInt(1,gar);
			inserimento.setString(2, asso);
//			inserimento.setInt(4, 0);
			inserimento.setInt(3, soldi);
//			rimborsoid++;
			preparedStatement.executeUpdate();
			inserimento.executeUpdate();
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
	
	public synchronized void designaGaraOss(int gar, String asso, int rim) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement p= null;
		String insertSQL = "UPDATE " + presidenteModel.TABLE_NAMEGar + " SET CM_Osservatore='" +asso +"' WHERE ID_Partita=" +gar;
		String insertSQLNo = "UPDATE " + presidenteModel.TABLE_NAMEGar + " SET CM_Osservatore="+null+",Stato_Osservatore=1 WHERE ID_Partita=" +gar;
		String rimborso = "INSERT INTO " + presidenteModel.TABLE_NAMErim
				+ " (ID_Partita,CM_Osservatore,Somma) VALUES (?, ?, ?)";
		try {
			if (asso.equalsIgnoreCase("09LRT5NN"))
			{
				connection = DriverMaagerConnectionPool.getConnection();
				preparedStatement = connection.prepareStatement(insertSQLNo);
				preparedStatement.executeUpdate();	
				
			}
			else
			{
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			p=connection.prepareStatement(rimborso);
			p.setInt(1,gar);
			p.setString(2, asso);
//			inserimento.setInt(4, 0);
			p.setInt(3, rim);
			preparedStatement.executeUpdate();			
			p.executeUpdate();
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
	
	public synchronized void modificaLegaArbitro(String asso, String lega) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "UPDATE " + presidenteModel.TABLE_NAMEAr + " SET Lega='" +lega+"' WHERE CM='" +asso+"'";
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
	
	public synchronized void modificaLegaOsservatore(String asso, String lega) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "UPDATE " + presidenteModel.TABLE_NAMEOs + " SET Lega='" +lega+"' WHERE CM='" +asso+"'";
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
	
	public synchronized void inserisciAssenza(assenza ax, int id) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "INSERT INTO " + presidenteModel.TABLE_NAMEAssenza
				+ " (ID_Riunione,Associato) VALUES (?, ?)";

		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, id);
			preparedStatement.setString(2, ax.getCM());
			
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
	
	public synchronized void inserisciRiunione(int i) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO riunione (ID_Riunione) VALUES (?)";
		
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, i);
					
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
	
	public synchronized void inserisciAvviso(String data, String mot) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO avviso (Data,Note) VALUES (?,?)";
		
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, data);
			preparedStatement.setString(2, mot);
			
			
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
	
	
	
	public synchronized void inserisciEvento(int evento) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO " + presidenteModel.TABLE_NAMEEve + " (ID_Evento) VALUES ("+evento+")";
		
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
	
	public synchronized void accettaIndisponibilita(int indi,String ass) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement agg = null;

		String insertSQL = "UPDATE " + presidenteModel.TABLE_NAMEIndi + " SET Stato=1 WHERE Id_Indisponibilità="+indi;
		String aggiornamento = "UPDATE " + presidenteModel.TABLE_NAME + " SET Stato=1 WHERE CM='" +ass+"'";
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
	
	public synchronized void rifiutaIndisponibilita(int indi,String ass) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		

		String insertSQL = "UPDATE " + presidenteModel.TABLE_NAMEIndi + " SET Stato=3 WHERE Id_Indisponibilità="+indi;
	
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