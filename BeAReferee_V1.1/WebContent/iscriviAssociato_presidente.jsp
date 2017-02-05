<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.io.*, javax.servlet.*,  javax.servlet.annotation.*, javax.servlet.http.*"%>
<%@ page
	import="java.util.Date, java.text.SimpleDateFormat, java.text.ParseException.*"%>
	<%@ page import="java.util.*"%>
	
<%@ page import = "AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 

<% if (session.getAttribute("presidente")==null) {%> <h1>NON PUOI ACCEDERE</h1><%}
presidente user = (presidente) session.getAttribute("presidente");


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
		<script type="text/javascript" src="js/inserimento.js"></script>
		<link rel="stylesheet" type="text/css" href="css/back_to_top.css">
	</head>
	<body class="news">
		<header>
			<nav>
			<div class="nav-wrapper blue-grey">
            <a href="#" class="brand-logo">Be A Referee</a>
    		<ul id="slide-out" class="side-nav fixed">
    			<li class="logo">
    				<a id="logo-container" href="#!">
            		<object id="front-page-logo" data="img/presidente_icon.png"></object></a>
            	</li>
            	<br>
            	<br>	
      			<li><a href="areaPersonale_presidente.jsp?presidente=<%=user.getCM()%>" class="waves-effect waves-teal">Area Personale</a></li>
      			<li class="no-padding">
        			<ul class="collapsible collapsible-accordion">
          		<li>
            	<a class="collapsible-header">Area Tecnica<i class="material-icons">arrow_drop_down</i></a>
            	<div class="collapsible-body">
              		<ul>
                		<li><a href="gara_presidente.jsp?presidente=<%=user.getCM()%>" class="waves-effect waves-teal">Designa Gare</a></li>
                		<li><a href="gestione_leghe.jsp?presidente=<%=user.getCM()%>" class="waves-effect waves-teal">Gestione Leghe</a></li>
                		<li><a href="valutazione_oss_presidente.jsp?presidente=<%=user.getCM()%>" class="waves-effect waves-teal">Valutazione Osservatore</a></li>
                		<li><a href="congedi_presidente.jsp?presidente=<%=user.getCM()%>" class="waves-effect waves-teal">Gestione Indisponibilità</a></li>
              		</ul>
            	</div>
          		</li>
        		</ul>
      			</li>
      			<li class="no-padding">
        			<ul class="collapsible collapsible-accordion">
          		<li>
      			<a class="collapsible-header">Area Amministrativa<i class="material-icons">arrow_drop_down</i></a>
            	<div class="collapsible-body">
              		<ul>
                		<li><a href="speseSezione_presidente.jsp?presidente=<%=user.getCM()%>" class="waves-effect waves-teal">Gestione Spese Sezione</a></li>
                		<li><a href="eventi_presidente.jsp?presidente=<%=user.getCM()%>" class="waves-effect waves-teal">Inserisci Comunicazioni/Eventi</a></li>
                		<li><a href="assenze_presidente.jsp?presidente=<%=user.getCM()%>" class="waves-effect waves-teal">Gestione Registro Assenze</a></li>
              		</ul>
            	</div>
            	</li>
        		</ul>
      			</li>
      		<li class="no-padding">
        			<ul class="collapsible collapsible-accordion">
          		<li>
      			<a class="collapsible-header">Area Gestionale<i class="material-icons">arrow_drop_down</i></a>
            	<div class="collapsible-body">
              		<ul>
                		<li><a href="iscriviAssociato_presidente.jsp?presidente=<%=user.getCM()%>" class="blue-grey">Iscrivi Associato</a></li>
                		<li><a href="gestisciAssociato_presidente.jsp?presidente=<%=user.getCM()%>" class="waves-effect waves-teal">Gestisci Associato</a></li>
                		<li><a href="certificato_presidente.jsp?presidente=<%=user.getCM()%>" class="waves-effect waves-teal">Inserisci Certificato</a></li>
                	</ul>
            	</div>
            	</li>
        		</ul>
      			</li>		
      			<li><a href="logout.jsp" class="waves-effect waves-teal">Logout</a></li>
    		</ul>
    		<a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
      			<ul class="side-nav" id="mobile-demo">
        			<li><a href="areaPersonale_associato.html" class="waves-effect waves-teal">Area Personale</a></li>
        			<li><a href="" class="waves-effect waves-teal">Area Tecnica</a></li>
        			<li><a href="" class="waves-effect waves-teal">Area Associativa</a></li>
        			<li><a href="" class="waves-effect waves-teal">Area Gestionale</a></li>
        			<li><a href="" class="waves-effect waves-teal">Logout</a></li>
      			</ul>
      			</div>
  			</nav>
		</header>
		<main>
		
			<h4>Iscrivi Associato</h4>
		<div class="row">
     		 <div class="row">
        		<div class="input-field col s6">
          			<input name="nome" id="nome" type="text" class="validate" required>
          			<label for="nome">Nome*</label>	
        		</div>
        		<div class="input-field col s6">
          			<input name="cognome" id="cognome" type="text" class="validate" required>
          			<label for="cognome">Cognome*</label>
        		</div>
      		<div class="input-field col s6">
          			<input name="nascita" id="nascita" type="text" class="validate" required>
          			<label for="data_nascita">Data Nascita*(formato gg/mm/aaaa)</label>
        		</div>
        	<div class="input-field col s6">
          			<select name="sesso" id="sesso">
      				<option value="M">M</option>
      				<option value="F">F</option>
    				</select>
    				<label for="sesso">Sesso*</label>
        		</div>	
        	<div class="input-field col s6">
          			<input name="cf" id="cf" type="text" class="validate" required>
          			<label for="cf">Codice Fiscale*</label>
        		</div>	
        	<div class="input-field col s6">
          			<input disabled name="regione" value="Campania" id="regione" type="text" class="validate">
          			<label for="regione_di_residenza">Campania</label>
        		</div>
        	<div class="input-field col s6">
          			<input name="citta" id="citta" type="text" class="validate" required>
          			<label for="indirizzo_di_residenza">Città*</label>
        		</div>
        	<div class="input-field col s6">
          			<input name="indirizzo" id="indirizzo" type="text" class="validate" required>
          			<label for="indirizzo_di_residenza">Indirizzo di Residenza*</label>
        		</div>
        	<div class="input-field col s6">
          			<input name="civico" id="civico" type="text" class="validate">
          			<label for="numero_civico">Numero Civico</label>
        		</div>	
           	<div class="input-field col s6">
          			<input name="telefono" id="telefono" type="text" class="validate" required>
          			<label for="recapito_telefonico">Recapito Telefonico*</label>
        		</div>				
        	<div class="input-field col s6">
          			<input name="email" id="email" type="text" class="validate">
          			<label for="indirizzo_e-mail">Indirizzo e-mail</label>
        	</div>	
        	</div>
        	<h4>Dati Associativi</h4>
        	<div class="row">
        		<div class="input-field col s6">
    			<select name="categoria" id="categoria">
      				<option value="Osservatore">Osservatore</option>
      				<option value="Arbitro">Arbitro</option>
    			</select>
    			
        <button onclick="inserisci()" class="btn waves-effect waves-light grey" type="submit" name="action">Iscrivi Associato
        <i class="material-icons right">send</i>
  		</button>
  	
  		<p>I campi contrassegnati con * sono obbligatori</p> 
		</main>
		<%@include file="footer_presidente.jsp" %>
		<div id="back_to_top">
			<img src="img/top-btn.png">
		</div>
	</body>
</html>