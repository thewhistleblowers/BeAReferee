<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.io.*, javax.servlet.*,  javax.servlet.annotation.*, javax.servlet.http.*"%>
<%@ page
	import="java.util.Date, java.text.SimpleDateFormat, java.text.ParseException.*"%>
	<%@ page import="java.util.*"%>
<%@ page import = "AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 

<% if (session.getAttribute("osservatore")==null) {%> <h1>NON PUOI ACCEDERE</h1><%}

osservatore user = (osservatore) session.getAttribute("osservatore");
  %>

<html>
	<head>
		<title>Be a Referee</title>
		<link rel="stylesheet" href="css/materialize.css">
		<link rel="stylesheet" href="css/fixedBar.css">
		<link rel="stylesheet" href="css/form.css">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
		<script type="text/javascript" src="js/materialize.js"></script>
		<script type="text/javascript" src="js/humburger.js"></script>
		<script type="text/javascript" src="js/select.js"></script>
		<link rel="stylesheet" type="text/css" href="css/back_to_top.css">
	</head>
	<body class="news">
		<header>
			<nav>
			<div class="nav-wrapper blue darken-3">
            <a href="#" class="brand-logo">Be A Referee</a>
    		<ul id="slide-out" class="side-nav fixed">
    			<li class="logo">
    				<a id="logo-container" href="HomePagePersonale_osservatore.jsp?osservatore=<%= user.getCM()%>">
            		<object id="front-page-logo" data="img/osservatore_icon.png"></object></a>
            	</li>
            	<br>
            	<br>
      			<li><a href="#!" class="blue darken-3">Area Personale</a></li>
      			<li class="no-padding">
        			<ul class="collapsible collapsible-accordion">
          		<li>
            	<a class="collapsible-header">Area Tecnica<i class="material-icons">arrow_drop_down</i></a>
            	<div class="collapsible-body">
              		<ul>
                		<li><a href="#!" class="waves-effect waves-teal">Designazioni</a></li>
                		<li><a href="#!" class="waves-effect waves-teal">Rapporto</a></li>
                		<li><a href="#!" class="waves-effect waves-teal">Indisponibilità</a></li>
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
                		<li><a href="#!" class="waves-effect waves-teal">First</a></li>
                		<li><a href="#!" class="waves-effect waves-teal">Second</a></li>
                		<li><a href="#!" class="waves-effect waves-teal">Third</a></li>
                		<li><a href="#!" class="waves-effect waves-teal">Fourth</a></li>
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
                		<li><a href="gestioneIban_osservatore.jsp?osservatore=<%= user.getCM()%>" class="waves-effect waves-teal">Gestione IBAN</a></li>
                		<li><a href="visualizzaRimborsi_osservatore.jsp?osservatore=<%= user.getCM()%>" class="waves-effect waves-teal">Rimborsi</a></li>
              		</ul>
            	</div>
            	</li>
        		</ul>
        		</li>
      			<li><a href="logout.jsp" class="waves-effect waves-teal">Logout</a></li>
    		</ul>
    		<a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
      			<ul class="side-nav" id="mobile-demo">
        			<li><a href="" class="green">Area Personale</a></li>
        			<li><a href="" class="waves-effect waves-teal">Area Tecnica</a></li>
        			<li><a href="" class="waves-effect waves-teal">Area Associativa</a></li>
        			<li><a href="" class="waves-effect waves-teal">Gestione Contabile</a></li>
        			<li><a href="" class="waves-effect waves-teal">Logout</a></li>
      			</ul>
      			</div>
  			</nav>
		</header>
		<main>
		<h4>Dati Personali</h4>
		<div class="row">
     		 <div class="row">
        		<div class="input-field col s6">
          			<input disabled value="Nome" id="nome" type="text" class="validate">
          			<label for="nome"></label>
        		</div>
        		<div class="input-field col s6">
          			<input disabled value="Cognome" id="cognome" type="text" class="validate">
          			<label for="cognome"></label>
        		</div>
      		<div class="input-field col s6">
          			<input disabled value="Data Nascita 02/12/1992" id="data_nascita" type="text" class="validate">
          			<label for="data_nascita"></label>
        		</div>
        	<div class="input-field col s6">
          			<input disabled value="Sesso" id="sesso" type="text" class="validate">
          			<label for="sesso"></label>
        		</div>	
        	<div class="input-field col s6">
          			<input disabled value="Luogo di Nascita" id="luogo_nascita" type="text" class="validate">
          			<label for="luogo_nascita"></label>	
      		</div>
      		<div class="input-field col s6">
          			<input disabled value="Codice Fiscale" id="cf" type="text" class="validate">
          			<label for="cf"></label>
        		</div>	
        	<div class="input-field col s6">
          			<input id="indirizzo_di_residenza" type="text" class="validate">
          			<label for="indirizzo_di_residenza">Indirizzo di Residenza</label>
        		</div>
        	<div class="input-field col s6">
          			<input id="città_di_residenza" type="text" class="validate">
          			<label for="città_di_residenza">Città di Residenza</label>
        		</div>
        	<div class="input-field col s6">
          			<input id="recapito_telefonico" type="text" class="validate">
          			<label for="recapito_telefonico">Recapito Telefonico</label>
        		</div>				
        	<div class="input-field col s6">
          			<input id="indirizzo_e-mail" type="text" class="validate">
          			<label for="indirizzo_e-mail">Indirizzo e-mail</label>
        	</div>	
        	</div>
        	<h4>Dati Associativi</h4>
        	<div class="row">
        		<div class="input-field col s6">
          			<input disabled value="Codice Meccanografico" id="cm" type="text" class="validate">
          			<label for="cm"></label>
        		</div>
        		<div class="input-field col s6">
          			<input disabled value="Sezione A.I.A." id="sezione" type="text" class="validate">
          			<label for="sezione"></label>
        		</div>
        		<div class="input-field col s6">
          			<input disabled value="Qualifica" id="qualifica" type="text" class="validate">
          			<label for="qualifica"></label>
        		</div>
        		</div>
        </div>		
         <button class="btn waves-effect waves-light blue darken-3" type="submit" name="action">Applica Modifiche
    		<i class="material-icons right">send</i>
  		</button>
  		</main>
		<footer class="page-footer blue darken-3">
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
			<img src="img/top-btn.png">
		</div>
	</body>
</html>