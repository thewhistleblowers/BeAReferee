<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.io.*, javax.servlet.*,  javax.servlet.annotation.*, javax.servlet.http.*"%>
<%@ page
	import="java.util.Date, java.text.SimpleDateFormat, java.text.ParseException.*"%>
<%@ page import="java.util.*"%>
<%@ page
	import="AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%>

<%
	if (session.getAttribute("presidente") == null) {
%>
<h1>NON PUOI ACCEDERE</h1>
<%
	}

	presidente user = (presidente) session.getAttribute("presidente");
%>

<html>
<head>
<title>Be a Referee</title>
<link rel="stylesheet" href="css/materialize.css">
<link rel="stylesheet" href="css/fixedBar.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/materialize.js"></script>
<script type="text/javascript" src="js/humburger.js"></script>
<script type="text/javascript" src="js/inviarapporto.js"></script>
<script type="text/javascript" src="js/mostrarapp.js"></script>
<link rel="stylesheet" type="text/css" href="css/back_to_top.css">
</head>
<body class="news">
	<header>
		<nav>
			<div class="nav-wrapper blue-grey">
				<a href="#" class="brand-logo">Be A Referee</a>
				<ul id="slide-out" class="side-nav fixed">
					<li class="logo"><a id="logo-container" href="#!"> <object
								id="front-page-logo" data="img/presidente_icon.png"></object></a></li>
					<br>
					<br>
					<li><a
						href="areaPersonale_presidente.jsp?presidente=<%=user.getCM()%>"
						class="waves-effect waves-teal">Area Personale</a></li>
					<li class="no-padding">
						<ul class="collapsible collapsible-accordion">
							<li><a class="collapsible-header">Area Tecnica<i
									class="material-icons">arrow_drop_down</i></a>
								<div class="collapsible-body">
									<ul>
										<li><a
											href="gara_presidente.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Designa Gare</a></li>
										<li><a
											href="gestione_leghe.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Gestione Leghe</a></li>
										<li><a
											href="#"
											class="blue-grey">Valutazione Osservatore</a></li>
										<li><a
											href="congedi_presidente.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Gestione Indisponibilità</a></li>
									</ul>
								</div></li>
						</ul>
					</li>
					<li class="no-padding">
						<ul class="collapsible collapsible-accordion">
							<li><a class="collapsible-header">Area Amministrativa<i
									class="material-icons">arrow_drop_down</i></a>
								<div class="collapsible-body">
									<ul>
										<li><a
											href="speseSezione_presidente.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Gestione Spese Sezione</a></li>
										<li><a
											href="eventi_presidente.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Inserisci
												Comunicazioni/Eventi</a></li>
										<li><a
											href="assenze_presidente.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Gestione Registro Assenze</a></li>
									</ul>
								</div></li>
						</ul>
					</li>
					<li class="no-padding">
						<ul class="collapsible collapsible-accordion">
							<li><a class="collapsible-header">Area Gestionale<i
									class="material-icons">arrow_drop_down</i></a>
								<div class="collapsible-body">
									<ul>
										<li><a
											href="iscriviAssociato_presidente.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Iscrivi Associato</a></li>
										<li><a
											href="gestisciAssociato_presidente.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Gestisci Associato</a></li>
										<li><a
											href="certificato_presidente.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Inserisci Certificato</a></li>
									</ul>
								</div></li>
						</ul>
					</li>

					<li><a href="logout.jsp" class="waves-effect waves-teal">Logout</a></li>
				</ul>
				<a href="#" data-activates="slide-out" class="button-collapse"><i
					class="material-icons">menu</i></a>
				<ul class="side-nav" id="mobile-demo">
					<li><a href="areaPersonale_associato.html"
						class="waves-effect waves-teal">Area Personale</a></li>
					<li><a href="" class="waves-effect waves-teal">Area
							Tecnica</a></li>
					<li><a href="" class="waves-effect waves-teal">Area
							Associativa</a></li>
					<li><a href="" class="waves-effect waves-teal">Logout</a></li>
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
		rs=st.executeQuery("select * from associato");
		%>
 <div class="row">
        		<div class="input-field col s6">
          			<select id="osservatore" onchange="mostraGareOss(this.value)">
          			<%while(rs.next()){
          				osserva=oss.executeQuery("select * from osservatore where CM='"+rs.getString("CM")+"'");
          				while(osserva.next())
          				if (!rs.getString("Cognome").equalsIgnoreCase("--")){%>
          			<option value="<%=rs.getString("CM")%>"><%=rs.getString("Cognome") %> <%=rs.getString("Nome") %>-<%=rs.getString("CM") %></option>
          			<%} }%>
          			</select>
     
        		</div>
        		
        		<div class="input-field col s6">
					<select id="voto">
						<option value="8.20">8.20</option>
						<option value="8.30">8.30</option>
						<option value="8.40">8.40</option>
						<option value="8.50">8.50</option>
						<option value="8.60">8.60</option>
						<option value="8.70">8.70</option>
					</select>          			

        		</div>
        		
        			<div class="input-field col s6" id="gara">
          			
     
        		</div>
        		<br>
        		<br>
        		<br>
        		<br>
        		<br>
      		
          			
          			
        		
        		
        	</div>
	 <label for="motivo">Motivazione...</label>
    <textarea name="messaggio" id="motivo" cols="30" rows="20"></textarea>
    <br>
	<br>
    <button onclick="invia()" class="waves-effect waves-light btn blue-grey">Invia</button>
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
	<%@include file="footer_presidente.jsp"%>
	<div id="back_to_top">
		<img src="img/top-btn.png">
	</div>
</body>
</html>
