<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import = "AreaAmministrativa.*,AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 
<head>
<title>controlloSpesa</title>
<script type="text/javascript" src="js/spese.js"></script>
</head>
<body>
<%	
System.out.print("sono entrato");
//boolean m=false;
Spesa spesa= new Spesa();
SpesaModel modello= new SpesaModel();
presidente user = (presidente) session.getAttribute("presidente");

String categoria=request.getParameter("cat");
double quota=Double.parseDouble(request.getParameter("quo"));
String data= request.getParameter("dat");
String mot= request.getParameter("mot");

System.out.print("La categoria è: "+categoria);
spesa.setData(data);
spesa.setSomma(quota);
spesa.setCausale(categoria);
spesa.setDestinatario(mot);

modello.inserisciSpesa(spesa,categoria);
out.print("spesaaggiunta");
//arbitroLog.setCm(userid);
 		    //arbitroLog.setNome(name);
	        //out.println("<a href='logout.jsp'>Log out</a>");

	


//response.sendRedirect("areaPersonale_arbitro.jsp?arbitro=" + cm);}
%>
</body>
</html>