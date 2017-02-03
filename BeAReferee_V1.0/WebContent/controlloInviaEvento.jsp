<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import = "AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.util.*,java.sql.*"%> 

<title>controlloInviaEvento</title>
</head>
<body>
<%	

presidente user = (presidente) session.getAttribute("presidente");

String tipo=request.getParameter("tipo");
String data= request.getParameter("data");
String motivo= request.getParameter("motivo");
int x=0;
presidenteModel model= new presidenteModel();
Connection connection = DriverMaagerConnectionPool.getConnection();
Statement st=connection.createStatement();
Statement st2= connection.createStatement();
ResultSet rs;
ResultSet rst;
model.inserisciAvviso(data, motivo);

if(tipo.equalsIgnoreCase("Evento")){
	rs=st.executeQuery("select * from avviso");
	while(rs.next())
		x= rs.getInt("ID_Avviso");
model.inserisciEvento(x);
out.print("invioriusciuto");
}

if(motivo.indexOf("tecnica")!=-1){
	rst=st2.executeQuery("select * from avviso");
	while(rst.next())
		x= rst.getInt("ID_Avviso");
	model.inserisciRiunione(x);
	out.print("invioriusciuto");
	}

out.print("invioriusciuto");

	
 		     //arbitroLog.setCm(userid);
 		    //arbitroLog.setNome(name);
	        //out.println("<a href='logout.jsp'>Log out</a>");

	


//response.sendRedirect("areaPersonale_arbitro.jsp?arbitro=" + cm);}
%>
</body>
</html>