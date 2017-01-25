<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import = "AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 


<title>controlloAccettaGara</title>
</head>
<body>
<%	
arbitro user = (arbitro) session.getAttribute("arbitro");
gara gar= (gara)session.getAttribute("partita");
int rimborso= (int) session.getAttribute("rimborso");
int cm=user.getCM();
String x=""+cm;
String rik=(String)request.getAttribute("arbitro");
String decisione = request.getParameter("decisione");    

arbitroModel modello= new arbitroModel();
/* 
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/be",
        "root", "nelloange9");
Statement st = con.createStatement();
ResultSet rs; */
if(decisione.equalsIgnoreCase("accetta")){
	modello.accettaPartita(user, gar,rimborso);
}
else
{ modello.rifiutaPartita(user, gar);
}


 		     //arbitroLog.setCm(userid);
 		    //arbitroLog.setNome(name);
	        //out.println("<a href='logout.jsp'>Log out</a>");
  response.sendRedirect("HomePagePersonale_arbitro.jsp?arbitro='" + cm);
	


//response.sendRedirect("areaPersonale_arbitro.jsp?arbitro=" + cm);}
%>
</body>
</html>