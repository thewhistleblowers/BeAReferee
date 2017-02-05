<%@ page
	import="java.io.*, javax.servlet.*,  javax.servlet.annotation.*, javax.servlet.http.*"%>
<%@ page
	import="java.util.Date, java.text.SimpleDateFormat, java.text.ParseException.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page language="java" contentType="multipart/form-data"
	pageEncoding="UTF-8"%>
	<%@ page
	import="AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*,java.lang.*"%>
<title>controlloInviaRap</title>

</head>
<body>
<%	

String jj=null;
String casa=null;
String ospite=null;
System.out.print("sono entrato");
//boolean m=false;
arbitro user = (arbitro) session.getAttribute("arbitro");
String nome=null;
String cognome=null;


String gara=request.getParameter("gara");
int gar=Integer.parseInt(gara);
String lega=request.getParameter("lega");
String luogo=request.getParameter("luogo");
String golcasa=request.getParameter("golcasa");
String golfuor=request.getParameter("golfuor");
String soscasa= request.getParameter("soscasa");
String sosfuori= request.getParameter("sosfuori");
String ammcasa= request.getParameter("ammcasa");
String ammfuori= request.getParameter("ammfuori");
String espcasa= request.getParameter("espcasa");
String espfuori= request.getParameter("espfuori");

Date dat= new Date();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
String result=sdf.format(dat);


String path= user.getCM()+"/"+"Referto"+result+".pdf";

Connection con= DriverMaagerConnectionPool.getConnection();
Statement st= con.createStatement();
Statement g= con.createStatement();
ResultSet rs;
ResultSet gr;
rs=st.executeQuery("select * from gara where ID_Partita="+gar);
while(rs.next()){
	nome=rs.getString("Squadra_Casa");
	cognome= rs.getString("Squadra_Ospite");
	jj=rs.getString("Data");
}

Referto pdf = new Referto(nome, cognome, jj,lega,user.getCM(),luogo,golcasa, golfuor,soscasa, sosfuori,ammcasa,ammfuori,espcasa,espfuori);
Statement star= con.createStatement();
int i=star.executeUpdate("INSERT INTO referto (Path_Referto,CM_Arbitro,ID_Partita,Lega,Stato) VALUES('"+path+"','"+user.getCM()+"','"+gar+"','"+lega+"',1)");
con.commit();
out.println("ok");


%>
</body>
</html>