package AreaPersonale;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import AreaTecnica.gara;
import Sistema.DriverMaagerConnectionPool;


public class arbitroModel {

	private static final String TABLE_NAME = "associato";
	private static final String TABLE_NAMEgar = "gara";
	private static final String TABLE_NAMEar = "arbitro";
	private static final String TABLE_NAMErim = "rimborso";
	
		public ArrayList <gara> visualizzaPartita(arbitro ar) throws SQLException {
			ArrayList <gara> gare= new ArrayList<gara>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String selectSQL = "SELECT * FROM " + arbitroModel.TABLE_NAMEgar + " WHERE CM_Arbitro="+ar.getCM()+" AND Stato_Arbitro=0";
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				gara gara= new gara();
				gara.setID_Partita(rs.getInt("ID_Partita"));
				gara.setLega(rs.getString("Lega"));
				gara.setCM_Arbitro(rs.getString("CM_Arbitro"));
				gara.setCM_Osservatore(rs.getString("CM_Osservatore"));
				gara.setIndirizzo_Stadio(rs.getString("Indirizzo_Stadio"));
				gara.setNumero_Civico(rs.getInt("Numero_Civico"));
				gara.setRegione_Stadio(rs.getString("Regione_Stadio"));
				gara.setCittà_Stadio(rs.getString("Città_Stadio"));
				gara.setStato_Osservatore(rs.getInt("Stato_Osservatore"));
				gara.setSquadra_Casa(rs.getString("Squadra_Casa"));
				gara.setSquadra_Ospite(rs.getString("Squadra_Ospite"));
				gara.setStato_Arbitro(rs.getInt("Stato_Arbitro"));
				gara.setData(rs.getString("Data"));
				gara.setOra(rs.getString("Ora"));
				
				gare.add(gara);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverMaagerConnectionPool.releaseConnection(connection);
			}
		}
		return gare;
	}
		
		public ArrayList <gara> visualizzaPartitaFatta(arbitro ar) throws SQLException {
			ArrayList <gara> gare= new ArrayList<gara>();
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			String selectSQL = "SELECT * FROM " + arbitroModel.TABLE_NAMEgar + " WHERE CM_Arbitro="+ar.getCM()+" AND Stato_Arbitro=1";
			try {
				connection = DriverMaagerConnectionPool.getConnection();
				preparedStatement = connection.prepareStatement(selectSQL);
				ResultSet rs = preparedStatement.executeQuery();

				while (rs.next()) {
					gara gara= new gara();
					gara.setID_Partita(rs.getInt("ID_Partita"));
					gara.setLega(rs.getString("Lega"));
					gara.setCM_Arbitro(rs.getString("CM_Arbitro"));
					gara.setCM_Osservatore(rs.getString("CM_Osservatore"));
					gara.setIndirizzo_Stadio(rs.getString("Indirizzo_Stadio"));
					gara.setNumero_Civico(rs.getInt("Numero_Civico"));
					gara.setRegione_Stadio(rs.getString("Regione_Stadio"));
					gara.setCittà_Stadio(rs.getString("Città_Stadio"));
					gara.setStato_Osservatore(rs.getInt("Stato_Osservatore"));
					gara.setSquadra_Casa(rs.getString("Squadra_Casa"));
					gara.setSquadra_Ospite(rs.getString("Squadra_Ospite"));
					gara.setStato_Arbitro(rs.getInt("Stato_Arbitro"));
					gara.setData(rs.getString("Data"));
					gara.setOra(rs.getString("Ora"));
					
					gare.add(gara);
				}

			} finally {
				try {
					if (preparedStatement != null)
						preparedStatement.close();
				} finally {
					DriverMaagerConnectionPool.releaseConnection(connection);
				}
			}
			return gare;
		}
	
	
	public synchronized void accettaPartita(arbitro ar, gara gar, int soldi) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement aggiornamento = null;
		PreparedStatement rimborso = null;
		
		String updateSQL = "UPDATE " + arbitroModel.TABLE_NAMEgar + " SET Stato_Arbitro=1 WHERE ID_Partita=" +gar.getID_Partita();
		String SQL = "UPDATE " + arbitroModel.TABLE_NAME + " SET Gare=Gare+1 WHERE CM=" +ar.getCM();
		String rim= "UPDATE " +arbitroModel.TABLE_NAMErim+ " SET CM_Arbitro="+ar.getCM()+" WHERE ID_Partita=" +gar.getID_Partita();

		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(updateSQL);
			aggiornamento = connection.prepareStatement(SQL);
			rimborso=connection.prepareStatement(rim);
			
			preparedStatement.executeUpdate();
			aggiornamento.executeUpdate();
			rimborso.executeUpdate();
			connection.commit();
		} finally {
			try {
				if (preparedStatement != null || aggiornamento!=null){
					preparedStatement.close();
					aggiornamento.close();}
			} finally {
				DriverMaagerConnectionPool.releaseConnection(connection);
			}
		}
	}
	
	public synchronized void rifiutaPartita(arbitro ar,gara gar) throws SQLException {
		Connection connection = null;
		PreparedStatement aggiornamento = null;
		PreparedStatement agg = null;
		String SQL = "UPDATE " + arbitroModel.TABLE_NAME + " SET Rifiuti_ing=Rifiuti_ing+1 WHERE CM=" +ar.getCM();
		String SQL2 = "UPDATE " + arbitroModel.TABLE_NAMEgar+ " SET CM_Arbitro="+null+ " WHERE ID_Partita=" +gar.getID_Partita();
		
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			aggiornamento = connection.prepareStatement(SQL);		
			agg= connection.prepareStatement(SQL2);
			aggiornamento.executeUpdate();
			agg.executeUpdate();

			connection.commit();
		} finally {
			try {
				if (aggiornamento != null)
					aggiornamento.close();
			} finally {
				DriverMaagerConnectionPool.releaseConnection(connection);
			}
		}
	}
	
	public synchronized void modificaScarpe(int scarp, arbitro ar) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String updateSQL = "UPDATE " + arbitroModel.TABLE_NAMEar + " SET Taglia_Scarpe=" +scarp+ " WHERE CM=" +ar.getCM();
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(updateSQL);
			
						
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

	public synchronized void modificaDivisa(String tag, arbitro ar) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String updateSQL = "UPDATE " + arbitroModel.TABLE_NAMEar + " SET Taglia_Divisa='" +tag+ "' WHERE CM=" +ar.getCM();
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(updateSQL);
			
						
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