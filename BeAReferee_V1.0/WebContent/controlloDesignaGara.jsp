<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import = "AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 
<head>
<title>controlloDesignaGara</title>
<script type="text/javascript" src="js/designa.js"></script>
</head>
<body>
<%	
System.out.print("sono entrato");
boolean m=false;
presidenteModel modello= new presidenteModel();
presidente user = (presidente) session.getAttribute("presidente");
String arb=request.getParameter("arb");
String oss=request.getParameter("oss");
System.out.println("l'osservatore scelto e' "+oss);
int part= Integer.parseInt(request.getParameter("part"));
int rim= Integer.parseInt(request.getParameter("soldi"));
while(!m){
modello.designaGaraArb(part, arb, rim);
modello.designaGaraOss(part, oss,rim);
out.print("designazione ok");
m=true;
}   //arbitroLog.setCm(userid);
 		    //arbitroLog.setNome(name);
	        //out.println("<a href='logout.jsp'>Log out</a>");

	


//response.sendRedirect("areaPersonale_arbitro.jsp?arbitro=" + cm);}
%>
</body>
</html>