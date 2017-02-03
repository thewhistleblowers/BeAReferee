<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page
	import="AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%>
<head>
<title>controlloLega</title>

</head>
<body>
	<%	
	
System.out.print("sono entrato");
String lega=null;
boolean m=false;
presidenteModel modello= new presidenteModel();
presidente user = (presidente) session.getAttribute("presidente");
String asso=request.getParameter("cm");
String scelta=request.getParameter("scelta");
Connection con= DriverMaagerConnectionPool.getConnection();
Statement st= con.createStatement();
Statement ar= con.createStatement();
Statement os= con.createStatement();
ResultSet rs;
ResultSet arb;
ResultSet oss;
rs=st.executeQuery("select * from associato where CM='"+asso+"'");
	while(rs.next()){
	arb=ar.executeQuery("select * from arbitro where CM='"+asso+"'");
	while(arb.next()){
		m=true;
		lega=arb.getString("Lega");
	}
	
	oss= os.executeQuery("select * from osservatore where CM='"+asso+"'");
	while(oss.next()){
		lega=oss.getString("Lega");
	}
	
	
	if(scelta.equalsIgnoreCase("promuovi") && m){
		if(lega.equalsIgnoreCase("Settore Giovanile"))
			lega="Terza Categoria";	
		else
			lega="Seconda Categoria";
		modello.modificaLegaArbitro(asso,lega);
	}

	if(scelta.equalsIgnoreCase("promuovi") && !m){
		if(lega.equalsIgnoreCase("Settore Giovanile"))
			lega="Terza Categoria";	
		else
			lega="Seconda Categoria";
		modello.modificaLegaOsservatore(asso,lega);
	}
	
	if(scelta.equalsIgnoreCase("retrocedi") && m){
		if(lega.equalsIgnoreCase("Terza Categoria"))
			lega="Settore Giovanile";
		else
			lega="Terza Categoria";
		modello.modificaLegaArbitro(asso,lega);
	}
	

	if(scelta.equalsIgnoreCase("retrocedi") && !m){
		if(lega.equalsIgnoreCase("Terza Categoria"))
			lega="Settore Giovanile";
		else
			lega="Terza Categoria";
		modello.modificaLegaOsservatore(asso,lega);
	}
	
	}
	
	out.println("okok");






%>
</body>
</html>