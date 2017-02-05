<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import = "AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 

<title>controlloAggiornaIBAN</title>
</head>
<body>
<%	
arbitro user = (arbitro) session.getAttribute("arbitro");
String cm=request.getParameter("cm");
String x=""+cm;
String rik=(String)request.getAttribute("arbitro");
String iban= request.getParameter("iban");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverMaagerConnectionPool.getConnection();
Statement st = con.createStatement();

ResultSet rs;

int i = st.executeUpdate("update associato set IBAN='"+iban+"' where CM='"+user.getCM()+"'");

if (i>0){
		
	out.println("modificaRiuscita");
}     	
 		     //arbitroLog.setCm(userid);
 		    //arbitroLog.setNome(name);
	        //out.println("<a href='logout.jsp'>Log out</a>");

	


//response.sendRedirect("areaPersonale_arbitro.jsp?arbitro=" + cm);}
%>
</body>
</html>