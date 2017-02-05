<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import = "AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 


<title>controlloEvento</title>
</head>
<body>
<%	

arbitro user = (arbitro) session.getAttribute("arbitro");
evento ev= (evento)session.getAttribute("evento");
String cm=user.getCM();
String x=""+cm;
String decisione = request.getParameter("decisione");    

associatoModel modello= new associatoModel();

if(decisione.equalsIgnoreCase("accetta")){
	modello.accettaEvento(user,ev);
}
else{
	session.setAttribute("evento", null);
}%>

<% 		     //arbitroLog.setCm(userid);
 		    //arbitroLog.setNome(name);
	        //out.println("<a href='logout.jsp'>Log out</a>");
  response.sendRedirect("HomePagePersonale_arbitro.jsp?arbitro='" + cm+"'");
	


//response.sendRedirect("areaPersonale_arbitro.jsp?arbitro=" + cm);}
%>
</body>
</html>