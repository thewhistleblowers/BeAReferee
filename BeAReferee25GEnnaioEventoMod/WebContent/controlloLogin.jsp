<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import = "AreaAmministrativa.*, AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 

<body>
<%  
arbitro richiesta=new arbitro();
osservatore osse= new osservatore();
presidente president=new presidente();
String rik=(String)request.getAttribute("arbitro");
String rik2=(String)request.getAttribute("osservatore");
String rik3=(String)request.getAttribute("presidente");
  String user = null;
  String name=null;
    int userid = Integer.parseInt(request.getParameter("cm"));    
    String pwd = request.getParameter("password");
    String cat= request.getParameter("log");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/be",
            "root", "nelloange9");
    Statement st = con.createStatement();
    Statement nome= con.createStatement();
    Statement arbitro= con.createStatement();
    Statement osservatore= con.createStatement();
    Statement presidente= con.createStatement();
    ResultSet rs;
    ResultSet nomeRes;
    ResultSet arb;
    ResultSet oss;
    ResultSet pres;
    rs = st.executeQuery("select * from utente where CM=" + userid + " and Password='" + pwd + "'");
    nomeRes= nome.executeQuery("select * from associato where CM=" +userid);
    arb= arbitro.executeQuery("select * from arbitro where CM=" +userid);
    oss= osservatore.executeQuery("select * from osservatore where CM=" +userid);
    pres= presidente.executeQuery("select * from presidente where CM_Presidente=" +userid);
    if (nomeRes.next())
      name=nomeRes.getString("Nome");
    if (rs.next()) {
      if (cat.equalsIgnoreCase("Arbitro") && (arb.next())){
         user = "<a href=\"HomePagePersonale_arbitro.jsp?CM=" + rs.getString("CM")+ "\">";
           richiesta.setCM(userid);
          richiesta.setStato(nomeRes.getInt("Stato"));
        richiesta.setCognome(nomeRes.getString("Cognome"));
        richiesta.setNome(nomeRes.getString("Nome"));
        richiesta.setGare(nomeRes.getInt("Gare"));
        richiesta.setTelefono(nomeRes.getInt("Num_Telefono"));
        richiesta.setRifiuti(nomeRes.getInt("Rifiuti_ing"));
        richiesta.setCodFisc(nomeRes.getString("Codice_Fiscale"));
        richiesta.setSesso(nomeRes.getString("Sesso"));
        richiesta.setIndirizzo(nomeRes.getString("Indirizzo"));
        richiesta.setCivico(nomeRes.getString("Numero_Civico"));
        richiesta.setCittà(nomeRes.getString("Città_di_Residenza"));
        richiesta.setRegioneResid(nomeRes.getString("Regione_di_Residenza"));
        richiesta.setIBAN(nomeRes.getString("IBAN"));
        richiesta.setE_mail(nomeRes.getString("E_mail"));
        richiesta.setNascita(nomeRes.getString("Data_di_Nascita"));
        richiesta.setLega(arb.getString("Lega"));
        richiesta.setTaglia_Divisa(arb.getString("Taglia_Divisa"));
        richiesta.setTaglia_Scarpe(arb.getInt("Taglia_Scarpe"));
        
        
        
             String x = rs.getString("CM");
             Cookie userID = new Cookie("userid", x );
             Cookie cookie = new Cookie("userinfo", name);
             Cookie arbitroCookie = new Cookie("arbitro", rik);
             response.addCookie(cookie);
             response.addCookie(userID);
             response.addCookie(arbitroCookie);
             session.setAttribute("arbitro", richiesta);
             session.setAttribute("userid", userid);
             session.setAttribute("userinfo", name);
              //arbitroLog.setCm(userid);
             //arbitroLog.setNome(name);
              //out.println("<a href='logout.jsp'>Log out</a>");
               response.sendRedirect("HomePagePersonale_arbitro.jsp?arbitro='" + rs.getString("CM"));
      }
      else{
        %>
            <h5>Accesso non valido, categoria scelta errata. <a href='index.jsp'>Torna al LogIn</a></h5> <%
            }
      
      
      if (cat.equalsIgnoreCase("Presidente")&& (pres.next())){user = "<a href=\"HomePagePersonale_presidente.jsp?CM=" + rs.getString("CM")+ "\">";
      president.setCM(userid); 
      president.setStato(nomeRes.getInt("Stato"));
    president.setCognome(nomeRes.getString("Cognome"));
    president.setNome(nomeRes.getString("Nome"));
    president.setGare(nomeRes.getInt("Gare"));
    president.setTelefono(nomeRes.getInt("Num_Telefono"));
    president.setRifiuti(nomeRes.getInt("Rifiuti_ing"));
    president.setCodFisc(nomeRes.getString("Codice_Fiscale"));
    president.setSesso(nomeRes.getString("Sesso"));
    president.setIndirizzo(nomeRes.getString("Indirizzo"));
    president.setCivico(nomeRes.getString("Numero_Civico"));
    president.setCittà(nomeRes.getString("Città_di_Residenza"));
    president.setRegioneResid(nomeRes.getString("Regione_di_Residenza"));
    president.setIBAN(nomeRes.getString("IBAN"));
    president.setE_mail(nomeRes.getString("E_mail"));
    president.setNascita(nomeRes.getString("Data_di_Nascita"));
      String x = rs.getString("CM");
            Cookie userID = new Cookie("userid", x );
            Cookie cookie = new Cookie("userinfo", name);
            Cookie presidenteCookie = new Cookie("presidente",rik3);
            response.addCookie(cookie);
            response.addCookie(userID);
            response.addCookie(presidenteCookie);
            session.setAttribute("presidente",president);
            session.setAttribute("userid", userid);
            session.setAttribute("userinfo", name);
            
            response.sendRedirect("HomePagePersonale_presidente.jsp?CM='" + rs.getString("CM"));
            
     }
      else{
        %>
            <h5>Accesso non valido, categoria scelta errata. <a href='index.jsp'>Torna al LogIn</a></h5> <%
      }
      if (cat.equalsIgnoreCase("Osservatore")&& (oss.next())){
    		 user = "<a href=\"HomePagePersonale_osservatore.jsp?CM='" + rs.getString("CM")+ "' \">";
    		osse.setCM(userid);
 		osse.setStato(nomeRes.getInt("Stato"));
 		osse.setCognome(nomeRes.getString("Cognome"));
 		osse.setNome(nomeRes.getString("Nome"));
 		osse.setGare(nomeRes.getInt("Gare"));
 		osse.setTelefono(nomeRes.getInt("Num_Telefono"));
 		osse.setRifiuti(nomeRes.getInt("Rifiuti_ing"));
 		osse.setCodFisc(nomeRes.getString("Codice_Fiscale"));
 		osse.setSesso(nomeRes.getString("Sesso"));
 		osse.setIndirizzo(nomeRes.getString("Indirizzo"));
 		osse.setCivico(nomeRes.getString("Numero_Civico"));
 		osse.setCittà(nomeRes.getString("Città_di_Residenza"));
 		osse.setRegioneResid(nomeRes.getString("Regione_di_Residenza"));
 		osse.setIBAN(nomeRes.getString("IBAN"));
 		osse.setE_mail(nomeRes.getString("E_mail"));
 		osse.setNascita(nomeRes.getString("Data_di_Nascita"));
 		osse.setLega(oss.getString("Lega"));
 		   		 
 		String x = rs.getString("CM");
      	Cookie userID = new Cookie("userid", x );
      	Cookie cookie = new Cookie("userinfo", name);
      	Cookie osservaCookie = new Cookie("osservatore", rik2);
      	response.addCookie(cookie);
      	response.addCookie(userID);
      	response.addCookie(osservaCookie);
      	session.setAttribute("osservatore", osse);
 		    session.setAttribute("userid", userid);
 		    session.setAttribute("userinfo", name);
 		     //arbitroLog.setCm(userid);
 		    //arbitroLog.setNome(name);
         //out.println("<a href='logout.jsp'>Log out</a>");
          response.sendRedirect("HomePagePersonale_osservatore.jsp?osservatore='" + rs.getString("CM"));
    	}
      else{
        %>
            <h5>Accesso non valido, categoria scelta errata. <a href='index.jsp'>Torna al LogIn</a></h5> <%
      }
      
      //  user = "<a href=\"modUtente.jsp?id=" + rs.getInt("ID")+ " \"> " + rs.getString("Nome") + " " + rs.getString("Cognome");
//       String x = ""+rs.getInt("ID");
//       Cookie userID = new Cookie("userid", x );
//       Cookie cookie = new Cookie("userinfo", user);
//       response.addCookie(cookie);
//       response.addCookie(userID);
//         session.setAttribute("userid", userid);
//         //out.println("welcome " + userid);
//         //out.println("<a href='logout.jsp'>Log out</a>");
//         response.sendRedirect("success.jsp");
    } else {%>
        <h5>Accesso non valido, Username o Password errato/a. <a href='index.jsp'>Torna al LogIn</a></h5>
 



<%}%>

</body>
</html>