<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page
	import="AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*,java.io.*"%>
<head>
<title>controlloCertificato</title>
<script type="text/javascript" src="js/designa.js"></script>
</head>
<body>
	<%
	String a= request.getParameter("cm");
	String path= request.getParameter("path");
	String dat =  request.getParameter("data");
	String ril=  request.getParameter("rila");
	String all= a+request.getParameter("all");
	System.out.println("il all è:"+all);
	String filePath =a+"/"+all;
		presidente user = (presidente) session.getAttribute("presidente");
		
		Connection con = DriverMaagerConnectionPool.getConnection();
		Statement st = con.createStatement();
		int x=0;
		
		x= st.executeUpdate("insert into certificato (Path_Certificato,AssociatoCM,Data_Scadenza,Rilasciato_da) values ('"+filePath+"','"+a+"','"+dat+"','"+ril+"')");
		con.commit();
		if (x!=0)
			out.println("ok");
		
		//arbitroLog.setCm(userid);
		//arbitroLog.setNome(name);
		//out.println("<a href='logout.jsp'>Log out</a>");


	%>
</body>
</html>