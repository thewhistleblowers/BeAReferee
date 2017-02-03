<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.io.*, javax.servlet.*,  javax.servlet.annotation.*, javax.servlet.http.*"%>
<%@ page
	import="java.util.Date, java.text.SimpleDateFormat, java.text.ParseException.*"%>
	<%@ page import="java.util.*"%>
	
<%@ page import = "AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 

<% if (session.getAttribute("arbitro")==null) {%> <h1>NON PUOI ACCEDERE</h1><%}
arbitro user = (arbitro) session.getAttribute("arbitro");
arbitroModel model= new arbitroModel();
ArrayList <gara> gare= new ArrayList<gara>(model.visualizzaPartita(user));

ArrayList <gara> gareFatte= new ArrayList<gara>(model.visualizzaPartitaFatta(user));

  %>


<html>

<%@ page contentType="text/html; charset=UTF-8" import="java.util.*"%>
	<head>
		<title>Be a Referee</title>
		<!-- CSS  -->
		<link type="text/css" rel="stylesheet"  href="css/materialize.css" media="screen,projection"/>
		<link type="text/css" rel="stylesheet" href="css/fixedBar.css" media="screen,projection"/>
		<link  type="text/css" rel="stylesheet" href="css/back_to_top.css" media="screen,projection"/>
		<link type="text/css" rel="stylesheet"  href="css/form.css" media="screen,projection"/>
		<!-- FONT -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	</head>
	<body class="news">
		<header>
			<nav>
			<div class="nav-wrapper green">
            <a href="#" class="brand-logo">Be A Referee</a>
    		<ul id="slide-out" class="side-nav fixed">
    			<li class="logo">
    				<a id="logo-container" href="HomePagePersonale_arbitro.jsp?arbitro='<%=user.getCM()%>'">
            		<object id="front-page-logo" data="img/arbitro_icon.png"></object></a>
            	</li>
            	<br>
            	<br>	
      			<li><a href="areaPersonale_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Area Personale</a></li>
      			<li class="no-padding">
        			<ul class="collapsible collapsible-accordion">
          		<li>
            	<a class="collapsible-header">Area Tecnica<i class="material-icons">arrow_drop_down</i></a>
            	<div class="collapsible-body">
              		<ul>
                		<li><a href="#!" class="green">Designazioni</a></li>
                		<li><a href="inserisciReferto.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Referto</a></li>
                		<li><a href="gestioneIndisponibilità_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Indisponibilità</a></li>
              		</ul>
            	</div>
          		</li>
        		</ul>
      			</li>
      			<li class="no-padding">
        			<ul class="collapsible collapsible-accordion">
          		<li>
      			<a class="collapsible-header">Area Associativa<i class="material-icons">arrow_drop_down</i></a>
            	<div class="collapsible-body">
              		<ul>
                		<li><a href="gestioneEventi_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Eventi</a></li>
                		<li><a href="gestioneComunicazioni_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Comunicazioni</a></li>
              		</ul>
            	</div>
            	</li>
        		</ul>
      			</li>
      			<li class="no-padding">
        			<ul class="collapsible collapsible-accordion">
          		<li>
      			<a class="collapsible-header">Gestione Contabile<i class="material-icons">arrow_drop_down</i></a>
            	<div class="collapsible-body">
              		<ul>
                		<li><a href="gestioneIban_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Gestione IBAN</a></li>
                		<li><a href="visualizzaRimborsi_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Rimborsi</a></li>
              		</ul>
            	</div>
            	</li>
        		</ul>
        		</li>
      			<li><a href="logout.jsp" class="waves-effect waves-teal">Logout</a></li>
    		</ul>
    		<a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
      			<ul class="side-nav" id="mobile-demo">
        			<li><a href="areaPersonale_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Area Personale</a></li>
        			<li><a href="" class="waves-effect waves-teal">Area Tecnica</a></li>
        			<li><a href="" class="waves-effect waves-teal">Area Associativa</a></li>
        			<li><a href="" class="waves-effect waves-teal">Gestione Contabile</a></li>
        			<li><a href="logout.jsp" class="waves-effect waves-teal">Logout</a></li>
      			</ul>
      			</div>
  			</nav>
		</header>
		<main>
			<h4>Partite da Accettare</h4>
			<br>
			<br>
			
			<form method="post" action="controlloAccettaGara.jsp">
			<table>
        		<thead>
          			<tr>
          			
              			<th data-field="gara">Gara</th>
              			<th data-field="data_ora">Data e Ora</th>
              			<th data-field="stadio">Info Stadio</th>
              			<th data-field="città">Città</th>
              			<th data-field="regione">Regione</th>
              			<th data-field="lega">Lega</th>
              			<th data-field="rimborso">Rimborso</th>
              			
              			<th data-field="accettazione">Accettazione</th>
          			</tr>
        		</thead>
        		<tbody>
          			<%	boolean ok=false;
          				for(int i=0; i<gare.size(); i++){
          				
          				if(gare.get(i).getSquadra_Casa()==null || gare.get(i).getSquadra_Casa().equalsIgnoreCase("")){
          				ok= true;%>
          			<%break;} 
          			else {
          				int rimbuz=0;
          				
          				Connection con = DriverMaagerConnectionPool.getConnection();
          				Statement st = con.createStatement();
          				ResultSet rs;
          				rs=st.executeQuery("select Somma from rimborso where ID_Partita="+gare.get(i).getID_Partita());
          				while(rs.next()){
          				rimbuz=rs.getInt("Somma");}
          				session.setAttribute("partita", gare.get(i));
          				session.setAttribute("rimborso", rimbuz);%>
          				
          			<tr>
          				<td><%if(ok==true){ %>NON CI SONO GARE A TE DESIGNATE<% break;} else{out.print(gare.get(i).getSquadra_Casa());%>-<%out.print(gare.get(i).getSquadra_Ospite());%></td>
            			<td><%out.print(gare.get(i).getData());%> - <%out.print(gare.get(i).getOra()); %> </td>
            			<td><%out.print(gare.get(i).getIndirizzo_Stadio());%>, n.<%out.print(gare.get(i).getNumero_Civico());%></td>
						<td><%out.print(gare.get(i).getCittà_Stadio());%></td>
						<td><%out.print(gare.get(i).getRegione_Stadio());%> </td>
            			<td><%out.print(gare.get(i).getLega()); %></td>
            			<td><%out.print(rimbuz);} %>€</td>
            			<td> <button class="btn waves-effect waves-light green" type="submit" name="decisione" value="accetta" onClick="window.location.reload()">Accetta
            			<i class="material-icons right">send</i>
  		</button></td>
  		
  		<td> <button class="btn waves-effect waves-light green" type="submit" name="decisione" value="rifiuta" onClick="window.location.reload()">Rifiuta
            			<i class="material-icons right">send</i>
  		</button></td> <%} }%>
          			</tr>
           		</tbody>
          </table>	
          </form>
          <br>
          <br>
          <h4>Storico Designazioni</h4>
          <br>
          <br>
          <br>
        <br>
        <table>
        <thead>
          <tr>
              <th data-field="partita_storico">Gara</th>
              <th data-field="data_storico">Data&Ora</th>
              <th data-field="stadio_storico">Città</th>
          </tr>
        </thead>
        <tbody>
          
          <%for (int j=0; j<gareFatte.size();j++) {%>
          <tr>
            <td><%out.print(gareFatte.get(j).getSquadra_Casa());%> vs <%out.print(gareFatte.get(j).getSquadra_Ospite());%></td>
            <td><%out.print(gareFatte.get(j).getData());%>, ore <%out.print(gareFatte.get(j).getOra());%></td>
            <td><%out.print(gareFatte.get(j).getCittà_Stadio());}%></td>
          </tr>
         
        </tbody>
        </table>
		</main>
		<br>
		<br>
		<br>
<%@include file="footer.jsp" %>
		<div id="back_to_top">
			<img src="img/top-btn.png">
		</div>
		<!-- JS -->
		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
		<script type="text/javascript" src="js/materialize.js"></script>
		<script type="text/javascript" src="js/humburger.js"></script>
		<script type="text/javascript" src="js/select.js"></script>
		<script type="text/javascript" src="js/data.js"></script>
	</body>
</html>