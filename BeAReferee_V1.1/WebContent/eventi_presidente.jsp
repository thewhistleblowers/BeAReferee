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
<script type="text/javascript" src="js/evento.js"></script>

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
											class="blue-grey">Inserisci Comunicazioni/Eventi</a></li>
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
	<h4>Inserimento comunicazioni/eventi</h4>
	<div class="row">
		<div class="input-field col s6">
			<select id="tipo">
				<option value="Comunicazione">Comunicazione</option>
				<option value="Evento">Evento</option>
			</select> <label for="tipo">Tipo</label>
		</div>

		<div class="input-field col s6">
		Data:	<input id="data" type="date" class="datepicker" min="<%=result %>" required>
		</div>
		
		<div class="input-field col s6">
			<input id="motivo" type="text" required>
			<label for="motivo">Motivazione</label>
		</div>
		
		<div class="input-field col s6">
			 <button onclick="invia()" class="btn waves-effect waves-light grey" type="submit" name="action">Invia
        <i class="material-icons right">send</i>
  		</button>
		</div>
		
	</div>


	<br>
	<br>
	<br>
	<h4>Storico Indisponibilità/Congedi</h4>
	
	<table>
		<thead>
		
			<tr>
				<th data-field="ti">Tipo</th>
				<th data-field="c">Data</th>
				<th data-field="x">Motivo</th>
			</tr>
		</thead>

		<tbody>
		<%
		Connection connection = DriverMaagerConnectionPool.getConnection();
		Statement st=connection.createStatement();
		ResultSet rs;
		Statement st2=connection.createStatement();
		ResultSet rs2;
		rs=st.executeQuery("select * from avviso order by ID_Avviso desc");
		
		String tip="Comunicazione";
		while(rs.next()){ 
			rs2=st2.executeQuery("select * from evento where ID_Evento="+rs.getInt("ID_Avviso"));
			if(rs2.next()){
				tip="Evento";
				}
				else
				tip="Comunicazione";%>
				<tr>
				<td><%=tip%></td>
				<td><%=rs.getString("Data") %></td>
				<td><%=rs.getString("Note") %></td>
				</tr>
				<% } %>
		</tbody>
	</table>


	</main>

	<%@include file="footer_presidente.jsp"%>

	<div id="back_to_top">
		<img src="img/top-btn.png">
	</div>
</body>
</html>
