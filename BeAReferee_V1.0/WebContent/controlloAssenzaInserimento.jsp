<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page
	import="AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%>

<title>controlloAssenzaInserimento</title>
</head>
<body>
	<%
		System.out.println("sto nel controllo");
		int g = 0;
		presidente user = (presidente) session.getAttribute("presidente");
		presidenteModel model = new presidenteModel();
		String ass = request.getParameter("ass");
		String data = request.getParameter("dat");
		assenza assenza = new assenza(ass);
		Connection con = DriverMaagerConnectionPool.getConnection();
		Statement st = con.createStatement();
		Statement riu = con.createStatement();
		ResultSet rs;
		ResultSet riunione;
		rs = st.executeQuery("select * from avviso where Data='" + data + "'");
		while (rs.next()) {
			riunione = riu.executeQuery("select * from riunione where ID_Riunione=" + rs.getInt("ID_Avviso"));
			while (riunione.next()) {
				g = riunione.getInt("ID_Riunione");
				model.inserisciAssenza(assenza, g);
				out.print("assenzaok");
			}

		}
	%>
</body>
</html>