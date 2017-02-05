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
<script type="text/javascript" src="js/cancellaitem.js"></script>
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
											class="blue-grey">Gestisci Associato</a></li>
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

	<table>
		<thead>
			<tr>
				<th data-name="Qualifica">Qualifica</th>
				<th data-name="CM">CM</th>
				<th data-name="Cognome">Cognome</th>
				<th data-name="Nome">Nome</th>
				<th data-name="N_Telefonico">Telefono</th>
				<th data-name="Citta">Città</th>
				<th data-name="Indirizzo">Indirizzo</th>
				<th data-name="DataNascita">Data di Nascita</th>
				<th data-name="Rifiuti">Rifiuti</th>
				<th data-name="Email">Email</th>
				<th data-name="Certificati">Certificati</th>
				<th data-name="Rimuovi">Rimuovi</th>
			</tr>
		</thead>

		<tbody>

			<%
				presidenteModel model = new presidenteModel();
				session.setAttribute("modello", model);
				String Cognome = "Cognome";
				//  ArrayList<associato> ass= model.doRetrieveAll(Cognome);
				;
				Connection con = DriverMaagerConnectionPool.getConnection();
				ResultSet rs;
				Statement st = con.createStatement();
				ResultSet certif;
				Statement cer = con.createStatement();
				for (int i = 0; i < model.doRetrieveAll(Cognome).size(); i++) {
					certif = cer.executeQuery("select * from certificato where AssociatoCM='"
							+ model.doRetrieveAll(Cognome).get(i).getCM() + "'");
					String tipo = null;
					rs = st.executeQuery(
							"select * from arbitro where CM='" + model.doRetrieveAll(Cognome).get(i).getCM() + "'");
					if (rs.next())
						tipo = "AE";
					else {
						if (model.doRetrieveAll(Cognome).get(i).getCM().equalsIgnoreCase(user.getCM()))
							tipo = "PRES";
						else
							tipo = "OE";
					}

					if (!model.doRetrieveAll(Cognome).get(i).getCM().equalsIgnoreCase("09LRT5NN")) {
			%>

			<tr>
				<td><%=tipo%></td>
				<td data-name="CM"><%=model.doRetrieveAll(Cognome).get(i).getCM()%></td>
				<td><%=model.doRetrieveAll(Cognome).get(i).getCognome()%></td>
				<td><%=model.doRetrieveAll(Cognome).get(i).getNome()%></td>
				<td><%=model.doRetrieveAll(Cognome).get(i).getTelefono()%></td>
				<td><%=model.doRetrieveAll(Cognome).get(i).getCittà()%></td>
				<td><%=model.doRetrieveAll(Cognome).get(i).getIndirizzo()%>,<%=model.doRetrieveAll(Cognome).get(i).getCivico()%></td>
				<td><%=model.doRetrieveAll(Cognome).get(i).getNascita()%></td>
				<td><%=model.doRetrieveAll(Cognome).get(i).getRifiuti()%></td>
				<td><%=model.doRetrieveAll(Cognome).get(i).getE_mail()%></td>
				<%
					if (certif.next()) {
				%>
				<td><a href="<%=certif.getString("Path_Certificato")%>">Visualizza</a></td>
				<%
					certif.close();
							} else {
				%>
				<td>Non inserito</td>
				<%
					}
				%>

				<td><button
						onclick="cancelladadatabase('<%=model.doRetrieveAll(Cognome).get(i).getCM()%>')">
						<img src="img/remove.png">
					</button></td>

				<%
					}
					}
				%>

			</tr>





		</tbody>
	</table>





	<br>
	<br>
	<br>
	<br>
	<%@include file="footer_presidente.jsp"%>
	<div id="back_to_top">
		<img src="img/top-btn.png">
	</div>
</body>
</html>
