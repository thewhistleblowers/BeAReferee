package AreaAmministrativa;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Sistema.DriverMaagerConnectionPool;

public class SpesaModel {
	private static final String TABLE_NAME = "spesa";
	private static final String TABLE_NAME_QUOTA = "quota_associativa";

	public synchronized void inserisciSpesa(Spesa spesa, String categoria) throws SQLException {
		ResultSet rs;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		PreparedStatement quota = null;
		String insertSQL = "INSERT INTO " + SpesaModel.TABLE_NAME
				+ " (Data, Importo, Causale, Destinatario) VALUES (?, ?, ?, ?)";

		String insert = "INSERT INTO " + SpesaModel.TABLE_NAME_QUOTA+" (ID_Quota,CM_Associato,Stato) VALUES (?,?,?)";
		try {

			connection = DriverMaagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);

			preparedStatement.setString(1, spesa.getData());
			preparedStatement.setDouble(2, spesa.getSomma());
			preparedStatement.setString(3, spesa.getCausale());
			preparedStatement.setString(4, spesa.getDestinatario());
			preparedStatement.executeUpdate();
			connection.commit();

			if(categoria.equalsIgnoreCase("Riscossione Quota")){
				Statement st = connection.createStatement();
				rs=st.executeQuery("select * from spesa where Destinatario='"+spesa.getDestinatario()+"'");
				while (rs.next()){
				quota=connection.prepareStatement(insert);
				quota.setInt(1, rs.getInt("ID_Spesa"));
				quota.setString(2, spesa.getDestinatario());
				quota.setInt(3, 1);
				quota.executeUpdate();
				}
				
				connection.commit();}
			
		}

		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
				if (quota !=null)
					quota.close();
			} finally {
				DriverMaagerConnectionPool.releaseConnection(connection);
			}
		}

	}
}

