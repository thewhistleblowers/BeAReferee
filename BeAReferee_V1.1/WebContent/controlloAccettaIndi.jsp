<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import = "AreaAmministrativa.*,AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 
<head>
<title>controlloAccettaIndi</title>

</head>
<body>
<%	
System.out.print("sono entrato");
//boolean m=false;

presidente user = (presidente) session.getAttribute("presidente");
presidenteModel modello= new presidenteModel();
String richiedente=request.getParameter("cm");
int indi=Integer.parseInt(request.getParameter("ind"));
String responso= request.getParameter("resp");

if(responso.equalsIgnoreCase("accetta")){
modello.accettaIndisponibilita(indi, richiedente);
out.print("accettato");
}
else{
modello.rifiutaIndisponibilita(indi, richiedente);
	out.print("rifiutato");
}
//arbitroLog.setCm(userid);
 		    //arbitroLog.setNome(name);
	        //out.println("<a href='logout.jsp'>Log out</a>");

	


//response.sendRedirect("areaPersonale_arbitro.jsp?arbitro=" + cm);}
%>
</body>
</html>