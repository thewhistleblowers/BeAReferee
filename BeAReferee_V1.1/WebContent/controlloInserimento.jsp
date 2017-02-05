<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import = "AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 

<title>controlloModifica</title>
</head>
<body>
<%	

presidente pre=(presidente) session.getAttribute("presidente");
//String cm=pre.getCM();

String rik=(String)request.getAttribute("presidente");

associato bo= new associato();
String nome= request.getParameter("nome");
String cognome= request.getParameter("cognome");
String nascita= request.getParameter("nascita");
String sesso= request.getParameter("sesso");
String cf= request.getParameter("cf");
String indiRes = request.getParameter("indirizzo");    
String civ= request.getParameter("civico");
String citta = request.getParameter("citta");
String reg = request.getParameter("regione");
int telefono= Integer.parseInt(request.getParameter("telefono"));
String email= request.getParameter("email");
String cat= request.getParameter("categoria");
presidenteModel model= new presidenteModel();
associato ass= new associato();
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverMaagerConnectionPool.getConnection();
Connection cond = DriverMaagerConnectionPool.getConnection();
Statement st = con.createStatement();
Statement a= cond.createStatement();
ResultSet aa;
ResultSet rs;
int l=-1;
aa=a.executeQuery("select * from associato");
while(aa.next()){
	if(aa.getString("Codice_Fiscale").equalsIgnoreCase(cf))
	l++;
	System.out.println(""+l);
}
if(l!=-1){
	out.print("cf no");
}

rs=st.executeQuery("select * from comuni where Regione='CAM'");
int j=0;

ass.setNome(nome);
ass.setCognome(cognome);
ass.setNascita(nascita);
ass.setSesso(sesso);
ass.setCodFisc(cf);
ass.setIndirizzo(indiRes);
ass.setCivico(civ);
ass.setCittà(citta);
ass.setRegioneResid(reg);
ass.setTelefono(telefono);
ass.setE_mail(email);
int i=0;
while(rs.next())
if(citta.equalsIgnoreCase(rs.getString("Comune"))){
	i++;
	
}

if(i!=0){
	if(nascita.length()>10){
		j++;
		out.print("no data");
		
	}
}

int k=0;
if(i!=0 && j==0 && l==-1){
	
bo=model.inserimentoAssociato(ass);
//out.print("inserimento ok");
k++;
}
 

if (k!=0)
if(cat.equalsIgnoreCase("Arbitro")){
	model.inserimentoArb(bo);
	out.print("inserimento ok");	
}
else{
	
	model.inserimentoOss(bo);
	out.print("inserimento ok");
}

else
	out.print("no"); 
	 

%>
</body>
</html>