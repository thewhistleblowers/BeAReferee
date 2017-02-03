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
<script type="text/javascript" src="js/gLeghe.js"></script>
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
											class="blue-grey">Gestione Leghe</a></li>
										<li><a
											href="valutazione_oss_presidente.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Valutazione Osservatore</a></li>
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
	<h4>Lista Associati</h4>
	<br>
	<br>
	<table>
		<thead>
			<tr>
				<th data-field="dati_associato">Tipo</th>
				<th data-field="dati_associato">Associato</th>
				<th data-field="cm">Codice Meccanografico</th>
				<th data-field="categoria_associato">Categoria Attuale</th>
				<th data-field="media_voto">Media Voto</th>
				<th data-field="promozione">Promuovi</th>
				<th data-field="retrocessione">Retrocedi</th>
			</tr>
		</thead>
		<tbody>
			<% 
			int m=0;
      String tipo="OE";
      String lega=null;
      double voto=0.00;
      Connection con= DriverMaagerConnectionPool.getConnection();
      Statement st= con.createStatement();
      Statement arb= con.createStatement();
      Statement oss= con.createStatement();
      Statement med= con.createStatement();
      ResultSet rs;
      ResultSet arbitri;
      ResultSet osserva;
      ResultSet vot;
      rs=st.executeQuery("select * from associato order by Cognome");
      while(rs.next()){
    	  if(!rs.getString("CM").equalsIgnoreCase(user.getCM()) && !rs.getString("Cognome").equalsIgnoreCase("--")){
    	  arbitri= arb.executeQuery("Select * from arbitro where CM='"+rs.getString("CM")+"'");
    	  	if(arbitri.next())
    	  		tipo="AE";
    	  	else
    	  		tipo="OE";
    	  	arb.cancel();
    	  	arbitri.close();
      %>
			<tr>
				<td><%=tipo %></td>
				<td><%=rs.getString("Cognome") %> <%=rs.getString("Nome") %></td>
				<td><%=rs.getString("CM") %></td>
				<td id="le">
					<% osserva=oss.executeQuery("select * from osservatore where CM='"+rs.getString("CM")+"'");
					while(osserva.next())
						lega=osserva.getString("Lega");
					 arbitri= arb.executeQuery("Select * from arbitro where CM='"+rs.getString("CM")+"'");
					while(arbitri.next())
						lega=arbitri.getString("Lega");%> <%=lega %></td>
				<td>
					<%vot=med.executeQuery("select * from rapporto where CM_Destinatario='"+rs.getString("CM")+"'");
				while(vot.next()){
					m++;
					voto=(voto+vot.getDouble("Voto"))/m;
				
				}
					
				%>
				<%=voto %>
				</td>
				<%voto=0.00; %>
				<td><button <%if (lega.equalsIgnoreCase("Seconda Categoria")){%>disabled <%} %> onclick="leghe('<%=rs.getString("CM") %>','promuovi')" class="waves-effect waves-light btn blue-grey">Promuovi</button></td>
				<td><button <%if(lega.equalsIgnoreCase("Settore Giovanile")){%>disabled <%} %> onclick="leghe('<%=rs.getString("CM") %>','retrocedi')" class="waves-effect waves-light btn blue-grey">Retrocedi</button></td>
			</tr>

			<%} }%>
		</tbody>
	</table>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	</main>
<%@include file="footer_presidente.jsp"%>
	<div id="back_to_top">
		<img src="img/top-btn.png">
	</div>
</body>
</html>