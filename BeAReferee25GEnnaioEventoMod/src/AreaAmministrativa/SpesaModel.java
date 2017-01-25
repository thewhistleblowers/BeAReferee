package AreaAmministrativa;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import Sistema.DriverMaagerConnectionPool;

public class SpesaModel {
    private static final String TABLE_NAME = "spesa";
    private static final String TABLE_NAME_QUOTA = "quota associativa";

    public synchronized void inserisciSpesa(Spesa spesa, String oggetto) throws SQLException {
  Connection connection = null;
  PreparedStatement preparedStatement = null;
  switch (oggetto) {
  case ("Spesa"):
      String InsertSQL = "INSERT INTO" + SpesaModel.TABLE_NAME
        + "(Data,Importo,Causale,Destinatario) VALUES(?,?,?,?)";
      try {
    connection = DriverMaagerConnectionPool.getConnection();
    preparedStatement = connection.prepareStatement(InsertSQL);
    String data= "" +spesa.getData();
    preparedStatement.setString(1, data);
    preparedStatement.setDouble(2, spesa.getSomma());
    preparedStatement.setString(3, spesa.getCausale());
    preparedStatement.setString(4, spesa.getDestinatario());
    preparedStatement.executeUpdate();

      } finally {
    try {
        if (preparedStatement != null)
      preparedStatement.close();
        break;
    } finally {
        DriverMaagerConnectionPool.releaseConnection(connection);
        break;
    }
      }
  case ("Quota Associativa"):
      String InsertSQLQuota = "INSERT INTO" + SpesaModel.TABLE_NAME_QUOTA
        + "(Data,Importo,Causale,Destinatario) VALUES(?,?,?,?)";
      try {
    connection = DriverMaagerConnectionPool.getConnection();
    preparedStatement = connection.prepareStatement(InsertSQLQuota);
    String data= "" +spesa.getData();
    preparedStatement.setString(1, data);
    preparedStatement.setDouble(2, spesa.getSomma());
    preparedStatement.setString(3, spesa.getCausale());
    preparedStatement.setString(4, spesa.getDestinatario());
    preparedStatement.executeUpdate();
      } finally {
    try {
        if (preparedStatement != null)
      preparedStatement.close();
        break;
    } finally {
        DriverMaagerConnectionPool.releaseConnection(connection);
        break;
    }

      }
  }
    }
}