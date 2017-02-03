<%@ page language="java"
	contentType="text/html; charset=UTF-8; multipart/form-data"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.io.*, javax.servlet.*,  javax.servlet.annotation.*, javax.servlet.http.*"%>
<%@ page
	import="java.util.Date, java.text.SimpleDateFormat, java.text.ParseException.*"%>
<%@ page import="java.util.*"%>

<%@ page
	import="AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>

<%
	if (session.getAttribute("presidente") == null) {
%>
<h1>NON PUOI ACCEDERE</h1>
<%
	}
	presidente user = (presidente) session.getAttribute("presidente");
	String ass = null;
	Date dat = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String result = sdf.format(dat);
	//System.out.print(result);
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
<script type="text/javascript" src="js/certificato.js"></script>
<script type="text/javascript" src="js/valueselect.js"></script>
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
											class="waves-effect waves-teal">Gestisci Associato</a></li>
										<li><a
											href="certificato_presidente.jsp?presidente=<%=user.getCM()%>"
											class="blue-grey">Inserisci Certificato</a></li>
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
					<li><a href="" class="waves-effect waves-teal">Area
							Gestionale</a></li>
					<li><a href="" class="waves-effect waves-teal">Logout</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<main>
	<h4>Inserisci Certificato</h4>
		<p>*Il file deve essere di dimensioni max 5MB e in uno dei seguenti
		formati: PDF, TIFF, JPEG, RAW, PNG, BMP, PSD, TGA</p>
	<br>
	<br>
	<table>
		<thead>
			<tr>
				<th data-field="cm_certificato">Associato - Cod.Mecc.</th>
				<th data-field="data_certificato">Data Scadenza</th>
				<th data-field="rilascio">Rilasciato da</th>
			</tr>
		</thead>

		<tbody>
			<%
				Connection con = DriverMaagerConnectionPool.getConnection();
				ResultSet rs;
				ResultSet rt;
				Statement st = con.createStatement();
				Statement rrst = con.createStatement();
				
				rs = st.executeQuery("select * from associato order by Cognome");
				while (rs.next()) {
					rt=rrst.executeQuery("select * from certificato where AssociatoCM='"+rs.getString("CM")+"'");
					if (!rs.getString("CM").equalsIgnoreCase("09LRT5NN")) {
			%>

			<tr>
				<td id="associato"><%=rs.getString("Cognome")%> <%=rs.getString("Nome")%>
					- <%=rs.getString("CM")%></td>

				<td><input id="data" type="date" class="datepicker"
					min="<%=result%>" required>
					<%if (rt.next()){ %><label>Scadenza ultimo certificato: <%=rt.getString("Data_Scadenza") %></label><% rt.close();} %>
					
					</td>

				<td><input id="rilasciatoDa" placeholder="Rilasciato da"
					type="text" class="validate" required> <label
					for="rilasciatoDa"></label></td>

				<td><form action="upload.jsp?ass=<%=rs.getString("CM")%>" onsubmit="certif('<%=rs.getString("CM")%>')" name="inp"
						method="post" enctype="multipart/form-data">
						<div class="file-field input-field">
							<div class="btn">
								<span>Allega Certificato</span> <input id="alleg" type="file"
									name="CertificatoMedico" accept="application/pdf, image/*">
							</div>
							<div class="file-path-wrapper">
								<input id="allegat" class="file-path validate" type="text">
							</div>
						</div>

						<button id="submit" type="submit"
							class="waves-effect waves-light btn blue-grey">CONFERMA</button>
					</form></td>
			</tr>
			
			<%
			
				}
				}
			%>

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
	<br>
	</main>

	<%@include file="footer_presidente.jsp"%>

	<div id="back_to_top">
		<img src="img/top-btn.png">
	</div>
</body>
</html>