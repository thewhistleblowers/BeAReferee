<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.io.*, javax.servlet.*,  javax.servlet.annotation.*, javax.servlet.http.*"%>
<%@ page
	import="java.util.Date, java.text.SimpleDateFormat, java.text.ParseException.*"%>
<%@ page import="java.util.*"%>

<%@ page
	import="AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%>

<% if (session.getAttribute("presidente")==null) {%>
<h1>NON PUOI ACCEDERE</h1>
<%}
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
<script type="text/javascript" src="js/select.js"></script>
<script type="text/javascript" src="js/gare.js"></script>
<script type="text/javascript" src="js/spese.js"></script>
<script type="text/javascript" src="js/ind.js"></script>

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
											href="valutazione_oss_presidente.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Valutazione Osservatore</a></li>
										<li><a
											href="congedi_presidente.jsp?presidente=<%=user.getCM()%>"
											class="blue-grey">Gestione Indisponibilità</a></li>
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
	<h4>Indisponibilità/Congedi</h4>

	<table>
		<thead>
			<tr>
				<th data-field="tipo">Tipo</th>
				<th data-field="cm">CM Richiedente</th>
				<th data-field="tipoassociato">Nome&Cognome</th>
				<th data-field="nome">Data Inizio</th>
				<th data-field="data">Data Fine</th>
				<th data-field="titolo">Giorni</th>
				<th data-field="esito">Accetta</th>
				<th data-field="rifiuta">Rifiuta</th>
			</tr>
		</thead>

		<tbody>

<%
Connection con = DriverMaagerConnectionPool.getConnection();
String nome=null;
String cognome=null;
Statement st = con.createStatement();
Statement ok= con.createStatement();
Statement stor= con.createStatement();
Statement assp= con.createStatement();
ResultSet sto;
ResultSet okk;
ResultSet rs;
ResultSet ass;
okk= ok.executeQuery("select * from associato");
rs=st.executeQuery("select * from indisponibilità where Stato=0 order by Id_Indisponibilità desc");
while(rs.next()){
	while(okk.next()){
		if(rs.getString("CM_Richiedente").equalsIgnoreCase(okk.getString("CM")))
			nome=okk.getString("Nome");
			cognome= okk.getString("Cognome");
	}
%>
			<tr>
				<td><%=rs.getString("Tipo")%></td>
				<td><%=rs.getString("CM_Richiedente") %></td>
				<td><%=nome%> <%=cognome%></td>
				<td><%=rs.getDate("Data_Inizio") %></td>
				<td><%=rs.getDate("Data_Fine") %></td>
				<td><%=(int)rs.getDouble("Giorni") %></td>
				<td id="resp"> <button onclick="accettaind('<%=rs.getString("CM_Richiedente") %>','<%=rs.getString("Id_Indisponibilità") %>','accetta')" class="btn waves-effect waves-light grey" type="submit" name="action">Accetta
        <i class="material-icons right">send</i>
  		</button></td>
		<td id="rifiuto"> <button onclick="accettaind('<%=rs.getString("CM_Richiedente") %>','<%=rs.getString("Id_Indisponibilità") %>','rifiuta')" class="btn waves-effect waves-light grey" type="submit" name="action">Rifiuta
        <i class="material-icons right">send</i>
  		</button></td>
			</tr>
			<%} %>
			
		</tbody>
	</table>
	<br>
	<br>
	<br>
	<h4>Storico Indisponibilità/Congedi</h4>

	<table>
		<thead>
			<tr>
				<th data-field="tipo">Tipo</th>
				<th data-field="cm">CM Associato</th>
				<th data-field="tipoassociato">Nome&Cognome</th>
				<th data-field="nome">Data Inizio</th>
				<th data-field="data">Data Fine</th>
			</tr>
		</thead>

		<tbody>
		
		<%ass=assp.executeQuery("select * from associato");
		sto=stor.executeQuery("select * from indisponibilità where Stato=1");
		while(sto.next()){
			while(ass.next()){
			nome= ass.getString("Nome");
			cognome=ass.getString("Cognome");}
		%>
		<tr>
				<td><%=sto.getString("Tipo") %></td>
				<td><%=sto.getString("CM_Richiedente") %></td>
				<td><%=nome%> <%=cognome%></td>
				<td><%=sto.getDate("Data_Inizio")%></td>
				<td><%=sto.getDate("Data_Fine")%></td>
		</tr>
		
		<%} %>
		</tbody>
		</table>
		

	</main>

	<%@include file="footer_presidente.jsp"%>

	<div id="back_to_top">
		<img src="img/top-btn.png">
	</div>
</body>
</html>
