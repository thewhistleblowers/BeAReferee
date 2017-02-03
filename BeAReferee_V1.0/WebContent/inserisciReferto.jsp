<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page
	import="java.io.*, javax.servlet.*,  javax.servlet.annotation.*, javax.servlet.http.*"%>
<%@ page
	import="java.util.Date, java.text.SimpleDateFormat, java.text.ParseException.*"%>
	<%@ page import="java.util.*"%>
	
<%@ page import = "AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 

<% if (session.getAttribute("arbitro")==null) {%> <h1>NON PUOI ACCEDERE</h1><%}
arbitro user = (arbitro) session.getAttribute("arbitro");
associatoModel model= new associatoModel();
Date dat= new Date();

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
String result=sdf.format(dat);
System.out.print(result);
%>
<html>
	<head>
		<title>Be a Referee</title>
		<link rel="stylesheet" href="css/materialize.css">
		<link rel="stylesheet" href="css/fixedBar.css">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
		<script type="text/javascript" src="js/materialize.js"></script>
		<script type="text/javascript" src="js/humburger.js"></script>
		<script type="text/javascript" src="js/select.js"></script>
		<script type="text/javascript" src="js/referto.js"></script>
		<link rel="stylesheet" type="text/css" href="img/back_to_top.css">
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
                		<li><a href="gestioneDesignazioni_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Designazioni</a></li>
                		<li><a href="inserisciReferto.jsp?arbitro='<%=user.getCM()%>'" class="green">Referto</a></li>
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
                		<li><a href="gestoneComunicazioni_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Comunicazioni</a></li>
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
        			<li><a href="areaPersonale_associato.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Area Personale</a></li>
        			<li><a href="" class="waves-effect waves-teal">Area Tecnica</a></li>
        			<li><a href="" class="waves-effect waves-teal">Area Associativa</a></li>
        			<li><a href="" class="waves-effect waves-teal">Gestione Contabile</a></li>
        			<li><a href="logout.jsp" class="waves-effect waves-teal">Logout</a></li>
      			</ul>
      			</div>
  			</nav>
		</header>
	<main>
	<%Connection con= DriverMaagerConnectionPool.getConnection();
		Statement st= con.createStatement();
		Statement oss= con.createStatement();
		Statement gar= con.createStatement();
		ResultSet gara;
		ResultSet rs;
		ResultSet osserva;
		rs=st.executeQuery("select * from gara where CM_Arbitro='"+user.getCM()+"' and Stato_Arbitro=1");
		%>
 <div class="row">
        		<div class="input-field col s6">
          			<select id="gara">
          			<%while(rs.next()){
          				%>
          			<option value="<%=rs.getString("ID_Partita")%>"><%=rs.getString("Squadra_Casa") %>-<%=rs.getString("Squadra_Ospite") %> del <%=rs.getString("Data") %></option>
          			<% }%>
          			</select>
     
        		</div>
        		<div class="input-field col s6">
					<input name="ris" id="lega" type="text" class="validate" required>
          			<label for="indirizzo_di_residenza">Lega</label> 			

        		</div>
        		
        		
        		<div class="input-field col s6">
					<input name="ris" id="luogo" type="text" class="validate" required>
          			<label for="indirizzo_di_residenza">Luogo</label> 			

        		</div>
        		<div class="input-field col s6">
					<input name="ris" id="casa" type="text" class="validate" required>
          			<label for="indirizzo_di_residenza">Goal Squadra Ospitante</label> 			

        		</div>
        		
        			<div class="input-field col s6">
					<input name="ris" id="ospite" type="text" class="validate" required>
          			<label for="indirizzo_di_residenza">Goal Squadra Ospitata</label> 			

        		</div>
        		<div class="input-field col s6">
					<label for="ammcasa">Sostituzioni Squadra Ospitante</label> 	
					<textarea id="soscasa" cols="30" rows="20" required></textarea>
          					

        		</div>
        		<div class="input-field col s6">
					<label for="ammcasa">Sostituzioni Squadra Ospitata</label>
					<textarea id="sosfuori" cols="30" rows="20" required></textarea>
          			 			

        		</div>
        		
        		
        		<div class="input-field col s6">
					<label for="ammcasa">Ammoniti Squadra Ospitante</label>
					<textarea id="ammcasa" cols="30" rows="20" required></textarea>
          			 			

        		</div>
        		
        		<div class="input-field col s6">
					<label for="ammcasa">Ammoniti Squadra Ospite</label> 
					<textarea id="ammfuori" cols="30" rows="20" required></textarea>
          						

        		</div>
        		<div class="input-field col s6">
					<label for="ammcasa">Espulsi Squadra Ospitante</label> 
					<textarea id="espcasa" cols="30" rows="20" required></textarea>
          						

        		</div>
        		<div class="input-field col s6">
					<label for="ammcasa">Espulsi Squadra Ospite</label> 
					<textarea id="espfuori" cols="30" rows="20" required></textarea>
          						

        		</div>
        		<br>
        		<br>
        		<br>
        		<br>
        		<br>
      		
          			
          			
        		
        		
        	</div>
	 
    <br>
	<br>
    <button onclick="inviaR('<%=user.getCM() %>')" class="waves-effect waves-light btn green">Invia</button>
	<br>
	<br>
	<br>
	
	<h4>Storico Rapporti</h4>

	<table>
		<thead>
			<tr>
				
				<th data-field="cm">CM Associato</th>
				<th data-field="tipoassociato">Nome&Cognome</th>
				<th data-field="nome">Data Partita</th>
				<th data-field="data">Rapporto</th>
			</tr>
		</thead>

		<tbody>
		
		<%
		String cm=null;
		String nome=null;
		String cognome=null;
		Statement a= con.createStatement();
		Statement stor= con.createStatement();
		Statement par= con.createStatement();
		ResultSet sto;
		ResultSet ass;
		ResultSet part;
		sto=stor.executeQuery("select * from rapporto");
		while(sto.next()){
			ass=a.executeQuery("select * from associato where CM='"+sto.getString("CM_Destinatario")+"'");
			while(ass.next()){
			nome= ass.getString("Nome");
			cognome=ass.getString("Cognome");
			cm=ass.getString("CM"); 
		%>
		<tr>
				<td><%=cm%></td>
				<td><%=cognome%> <%=nome %></td>
				<%part=par.executeQuery("select * from gara where ID_Partita="+sto.getInt("ID_Rapporto"));
					while(part.next()){%><td><%=part.getString("Data") %></td><%} %>
				<td><a href="<%=sto.getString("Path_Rapporto")%>">Visualizza</a></td>
			
		</tr>
		
		<%} }%>
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
	</body>
</html>