<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.io.*, javax.servlet.*,  javax.servlet.annotation.*, javax.servlet.http.*"%>
<%@ page
	import="java.util.Date, java.text.SimpleDateFormat, java.text.ParseException.*"%>
	<%@ page import="java.util.*"%>
<%@ page import = "AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 

<% 
presidente user = (presidente) session.getAttribute("presidente");

  %>
<html>

<%@ page contentType="text/html; charset=UTF-8" import="java.util.*"%>
	<head>
		<title>Be a Referee</title>
				<!-- CSS  -->
		<link type="text/css" rel="stylesheet"  href="css/materialize.css" media="screen,projection"/>
		<link type="text/css" rel="stylesheet" href="css/fixedBar.css" media="screen,projection"/>
		<link  type="text/css" rel="stylesheet" href="css/back_to_top.css" media="screen,projection"/>
		<link type="text/css" rel="stylesheet"  href="css/form.css" media="screen,projection"/>
		<script type="text/javascript" src="js/anagraPre.js"></script>
		<!-- FONT -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
      			<li><a href="areaPersonale_presidente.jsp?presidente=<%=user.getCM()%>" class="blue-grey">Area Personale</a></li>
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
                		<li><a href="iscriviAssociato_presidente.jsp?presidente=<%=user.getCM()%>" class="waves-effect waves-teal">Iscrivi Associato</a></li>
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
          			<input disabled value="<%=user.getNome() %>" id="nome" type="text" class="validate">
          			<label for="nome">Nome</label>
        		</div>
        		<div class="input-field col s6">
          			<input disabled value="<%=user.getCognome() %>" id="cognome" type="text" class="validate">
          			<label for="cognome">Cognome</label>
        		</div>
      		<div class="input-field col s6">
          			<input disabled value="<%=user.getNascita() %>" id="data_nascita" type="text" class="validate">
          			<label for="data_nascita">Data di nascita</label>
        		</div>
        	<div class="input-field col s6">
          			<input disabled value="<%=user.getSesso() %>" id="sesso" type="text" class="validate">
          			<label for="sesso">Sesso</label>
        		</div>	
        	<div class="input-field col s6">
          			<input disabled value="<%=user.getCodFisc()%>" id="cf" type="text" class="validate">
          			<label for="cf">Codice Fiscale</label>
        		</div>	
        	<div class="input-field col s6">
          			<input value="<%=user.getIndirizzo()%>" name="indirizzo" id="indirizzo" type="text" class="validate">
          			<label for="indirizzo_di_residenza">Indirizzo di Residenza</label>
        		</div>
        	<div class="input-field col s6">
          			<input value="<%=user.getCittà()%> "name="citta" id="citta" type="text" class="validate">
          			<label for="città_di_residenza">Città di Residenza</label>
        		</div>
        		<div class="input-field col s6">
          			<input value="<%=user.getCivico()%> "name="civico" id="civico" type="text" class="validate">
          			<label for="città_di_residenza">Numero Civico</label>
        		</div>
        		<div class="input-field col s6">
          			<input value="<%=user.getRegioneResid()%> "name="regione" id="regione" type="text" class="validate">
          			<label for="città_di_residenza">Regione di Residenza</label>
        		</div>
        	<div class="input-field col s6">
          			<input value="<%=user.getTelefono()%>" name="telefono" id="telefono" type="text" class="validate">
          			<label for="recapito_telefonico">Recapito Telefonico</label>
        		</div>				
        	<div class="input-field col s6">
          			<input value="<%=user.getE_mail()%>" name="email" id="email" type="text" class="validate">
          			<label for="indirizzo_e-mail">Indirizzo e-mail</label>
        	</div>	
        	</div>
        	<h4>Dati Associativi</h4>
        	<div class="row">
        		<div class="input-field col s6">
          			<input disabled value="<%=user.getCM()%>" id="cm" type="text" class="validate">
          			<label for="cm">Codice Meccanografico</label>
        		</div>
        		<div class="input-field col s6">
          			<input disabled value="Napoli" id="sezione" type="text" class="validate">
          			<label for="sezione">Sezione</label>
        		</div>	
        	
        <button class="btn waves-effect waves-light blue-grey" type="submit" name="action"  onClick="aggiunAnagrafica('<%=user.getCM()%>')">Applica Modifiche
    		<i class="material-icons right">send</i>
  		</button>
  		</main>
  		
<%@include file="footer_presidente.jsp" %>
		<div id="back_to_top">
			<img src="img/top-btn.png">
		</div>
		<!-- JS -->
		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
		<script type="text/javascript" src="js/materialize.js"></script>
		<script type="text/javascript" src="js/humburger.js"></script>
		<script type="text/javascript" src="js/select.js"></script>
		<script type="text/javascript" src="js/data.js"></script>
	</body>
</html>