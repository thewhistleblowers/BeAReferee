package AreaPersonale;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import AreaTecnica.gara;
import Sistema.DriverMaagerConnectionPool;


public class osservatoreModel {

	private static final String TABLE_NAME = "associato";
	private static final String TABLE_NAMEgar = "gara";
	
	public synchronized gara visualizzaPartita(osservatore ar) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		gara gara= new gara();
		String selectSQL = "SELECT * FROM " + osservatoreModel.TABLE_NAMEgar + " WHERE CM_Osservatore='"+ar.getCM()+"' AND Stato_Osservatore=0";
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
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
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverMaagerConnectionPool.releaseConnection(connection);
			}
		}
		return gara;
	}
	

	public synchronized void accettaPartita(osservatore ar, gara gar) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement aggiornamento = null;
		String updateSQL = "UPDATE " + osservatoreModel.TABLE_NAMEgar + " SET Stato_Osservatore=1 WHERE ID_Partita=" +gar.getID_Partita();
		String SQL = "UPDATE " + osservatoreModel.TABLE_NAME + " SET Gare=Gare+1 WHERE CM=" +ar.getCM();
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(updateSQL);
			aggiornamento = connection.prepareStatement(SQL);
						
			preparedStatement.executeUpdate();
			aggiornamento.executeUpdate();
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
	
	public synchronized void rifiutaPartita(osservatore ar,gara gar) throws SQLException {
		Connection connection = null;
		PreparedStatement aggiornamento = null;
		String SQL = "UPDATE " + osservatoreModel.TABLE_NAME + " SET Rifiuti_ing=Rifiuti_ing+1 WHERE CM='" +ar.getCM()+"'";
		
		try {
			connection = DriverMaagerConnectionPool.getConnection();
			aggiornamento = connection.prepareStatement(SQL);		
			aggiornamento.executeUpdate();

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
	
	
}