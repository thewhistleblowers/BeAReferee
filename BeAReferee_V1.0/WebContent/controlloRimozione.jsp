<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import = "AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 


<title>controlloRimozione</title>
</head>
<body>
<%	
presidente user = (presidente) session.getAttribute("presidente");
String cm=user.getCM();
presidenteModel modello=(presidenteModel) session.getAttribute("modello");

 String decisione = request.getParameter("CM"); 

// System.out.println(decisione);

// boolean ris=modello.rimozione(decisione);
//  if (ris)
//  	out.println("cancellazione riuscita");


// Class.forName("com.mysql.jdbc.Driver");
//   	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/be",
//   	            "root", "nelloange9");
  	   // Statement st = con.createStatement();
  	 // 	ResultSet rs;
  	  	//int i=st.executeUpdate("DELETE FROM associato WHERE CM='"+decisione+"'");
	boolean i=modello.rimozione(decisione);
if(i)
	out.print("cancellazione riuscita");


 		     //arbitroLog.setCm(userid);
 		    //arbitroLog.setNome(name);
	        //out.println("<a href='logout.jsp'>Log out</a>");
//  response.sendRedirect("gestisciAssociato_presidente.jsp?presidente='" + cm);
	


//response.sendRedirect("areaPersonale_arbitro.jsp?arbitro=" + cm);}
%>
</body>
</html>