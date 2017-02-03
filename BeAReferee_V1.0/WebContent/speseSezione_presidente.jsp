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
											class="blue-grey">Gestione Spese Sezione</a></li>
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
			<h4>Inserisci Spese</h4>
			<br>
			<br>
			
			<table>
        		<thead>
          			<tr>
              			<th data-field="tipo_spesa">Inserisci Tipo</th>
              			<th data-field="quota_spesa">Inserisci Quota</th>
              			<th data-field="data_spesa">Data Spesa</th>
              			<th data-field="motivazione_spesa">Motivazione</th>
          			</tr>
        		</thead>
        		<tbody>
          			<tr>
            			<td>
            				<div class="input-field col s6">
          						<select id="categoria">
          						<option value="Spesa">Spesa</option>
          						<option value="Riscossione Quota">Riscossione Quota</option>
          						</select>
            			</td>
            			<td>
            				<div class="input-field col s6">
          						<input name="Inserisci Cifra" id="quota" type="text" class="validate" required>
          						<label for="quota">Inserisci Cifra</label>
        					</div>
            			</td>
            			<td>
            				<input id="data" name="data" type="date" class="datepicker">
            			</td>
            			<td>
            				<div class="input-field col s6">
          						<input name="Inserisci Motivazione" id="motivazione" type="text" class="validate">
          						<label for="motivazione">Motivazione(se "Riscossione Quota" indicare il CM dell'associato pagante)</label>
        					</div>
            			</td>	
          			</tr>
        		</tbody>
      		</table>
      		<br>
  			<button onclick="gestiscisoldi()" class="waves-effect waves-light btn blue-grey"><i class="material-icons right">send</i>Registra</button>
  	<%
		Connection con = DriverMaagerConnectionPool.getConnection();
		Statement st;
		ResultSet rs;
		
		%>
  			<br>
  			<br>
  			<h4>Storico Entrate/Uscite</h4>
  			<table>
        <thead>
          <tr>
              <th data-field="tipo_storico_spesa">Tipo</th>
              <th data-field="quota_storico_spesa">Importo</th>
              <th data-field="data_storico_spesa">Data</th>
              <th data-field="motivazione_storico_spesa">Motivazione</th>
          </tr>
        </thead>
       
        <tbody>
       <% st=con.createStatement();
       rs=st.executeQuery("select * from spesa order by ID_Spesa desc");
       while(rs.next()){%>
          <tr>
            <td><%=rs.getString("Causale")%></td>
            <td><%=rs.getDouble("Importo") %> €</td>
            <td><%=rs.getString("Data") %></td>
            <td><%=rs.getString("Destinatario") %></td>
          </tr>
       
          <%}%>
       
        </tbody>
        </table>
  			<br>
  			<br>
		</main>
		<footer class="page-footer blue-grey">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="white-text">Be A Referee</h5>
              </div>
              <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Links</h5>
                <ul>
                  <li><a class="grey-text text-lighten-3" href="http://www.aia-figc.it">Associazione Italiana Arbitri</a></li>
                  <li><a class="grey-text text-lighten-3" href="http://www.figc.it">Federazione Italiana Giuoco Calcio</a></li>
                  <li><a class="grey-text text-lighten-3" href="http://www.aia-figc.it/download/regolamenti/reg_2016.pdf">Regolamento del Giuoco del Calcio</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="footer-copyright">
            <div class="container">
            © 2016 Copyright The Whistleblowers
            </div>
          </div>
        </footer>
		<div id="back_to_top">
			<img src="top-btn.png">
		</div>
	</body>
</html>