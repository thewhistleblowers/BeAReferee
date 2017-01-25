<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import = "AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 

<title>controlloModifica</title>
</head>
<body>
<%	
arbitro user = (arbitro) session.getAttribute("arbitro");
int cm=user.getCM();
String x=""+cm;
String rik=(String)request.getAttribute("arbitro");
String indiRes = request.getParameter("indirizzo");    
String civ= request.getParameter("civico");
String citta = request.getParameter("citta");
String reg = request.getParameter("regione");
int telefono= Integer.parseInt(request.getParameter("telefono"));
String email= request.getParameter("email");
String div= request.getParameter("divisa");
String scar= request.getParameter("scarpe");
//arbitroModel model= new arbitroModel();

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/be",
        "root", "nelloange9");
Statement st = con.createStatement();
Statement star = con.createStatement();
Statement agg = con.createStatement();
Statement ok = con.createStatement();
ResultSet rs;
ResultSet ar;
int i = st.executeUpdate("update associato set Num_Telefono="+telefono+", Indirizzo='"+indiRes+"', Numero_Civico='"+civ+"', Città_di_Residenza='"+citta+"', Regione_di_Residenza='"+reg+"', E_mail='"+email+"' WHERE CM="+cm);
int j= star.executeUpdate("update arbitro set Taglia_Divisa='"+div+"', Taglia_Scarpe="+scar+" where CM="+cm);
rs=agg.executeQuery("select * from associato where CM="+cm);
ar=ok.executeQuery("select * from arbitro where CM="+cm);
/* Cookie userID = new Cookie("userid", x );
Cookie cookie = new Cookie("userinfo", user.getNome());
Cookie arbitroCookie = new Cookie("arbitro", rik);
response.addCookie(cookie);
response.addCookie(userID);
response.addCookie(arbitroCookie); */
arbitro arbi= new arbitro();
if (rs.next()&&ar.next()) {
	
		 	arbi.setCM(cm);
			arbi.setStato(rs.getInt("Stato"));
			arbi.setCognome(rs.getString("Cognome"));
			arbi.setNome(rs.getString("Nome"));
			arbi.setGare(rs.getInt("Gare"));
			arbi.setTelefono(rs.getInt("Num_Telefono"));
			arbi.setRifiuti(rs.getInt("Rifiuti_ing"));
			arbi.setCodFisc(rs.getString("Codice_Fiscale"));
			arbi.setSesso(rs.getString("Sesso"));
			arbi.setIndirizzo(rs.getString("Indirizzo"));
			arbi.setCivico(rs.getString("Numero_Civico"));
			arbi.setCittà(rs.getString("Città_di_Residenza"));
			arbi.setRegioneResid(rs.getString("Regione_di_Residenza"));
			arbi.setIBAN(rs.getString("IBAN"));
			arbi.setE_mail(rs.getString("E_mail"));
			arbi.setNascita(rs.getString("Data_di_Nascita"));
			arbi.setLega(ar.getString("Lega"));
			arbi.setTaglia_Divisa(ar.getString("Taglia_Divisa"));
			arbi.setTaglia_Scarpe(ar.getInt("Taglia_Scarpe"));
}		

if (i==1 && j==1){
	session.removeAttribute("arbitro");
	session.setAttribute("arbitro", arbi);
	session.setAttribute("userid", cm);
	session.setAttribute("userinfo", arbi.getNome());
	Cookie userID = new Cookie("userid", x );
	Cookie cookie = new Cookie("userinfo", arbi.getNome());
	Cookie arbitroCookie = new Cookie("arbitro", rik);
	response.addCookie(cookie);
	response.addCookie(userID);
	response.addCookie(arbitroCookie);
}     	
 		     //arbitroLog.setCm(userid);
 		    //arbitroLog.setNome(name);
	        //out.println("<a href='logout.jsp'>Log out</a>");
  response.sendRedirect("areaPersonale_arbitro.jsp?arbitro='" + cm);
	


//response.sendRedirect("areaPersonale_arbitro.jsp?arbitro=" + cm);}
%>
</body>
</html>