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
presidente user = (presidente) session.getAttribute("presidente");
String nome=null;
String cognome=null;
String oss=request.getParameter("cm");
String v=request.getParameter("voto");
double voto=Double.parseDouble(v);
String partita= request.getParameter("partita");
int l= Integer.parseInt(partita);
String mot= request.getParameter("mot");
Date dat= new Date();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
String result=sdf.format(dat);
String path= oss+"/"+"Rapporto"+result+".pdf";

Connection con= DriverMaagerConnectionPool.getConnection();
Statement st= con.createStatement();
Statement g= con.createStatement();
ResultSet rs;
ResultSet gara;
rs=st.executeQuery("select * from associato where CM='"+oss+"'");
while(rs.next()){
	nome=rs.getString("Nome");
	cognome= rs.getString("Cognome");
}
gara=g.executeQuery("select * from gara where ID_Partita="+l);
while(gara.next()){
	casa=gara.getString("Squadra_Casa");
	ospite= gara.getString("Squadra_Ospite");
	jj=gara.getString("Data");
}

Test pdf = new Test(jj,user.getCM(),nome,cognome,oss,v,casa,ospite,mot);
Statement star= con.createStatement();
int i=star.executeUpdate("INSERT INTO rapporto (ID_Rapporto,Path_Rapporto,CM_Autore,CM_Destinatario,Voto,Stato) VALUES("+l+",'"+path+"','"+user.getCM()+"','"+oss+"',"+voto+",1)");
con.commit();
out.println("vabbe");


%>
</body>
</html>