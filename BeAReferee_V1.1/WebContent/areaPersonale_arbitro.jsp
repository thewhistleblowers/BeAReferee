<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
import="java.io.*, javax.servlet.*,  javax.servlet.annotation.*, javax.servlet.http.*"%>
<%@ page
	import="java.util.Date, java.text.SimpleDateFormat, java.text.ParseException.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="java.lang.*"%>
	
<%@ page import = "AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 

<%
    if ((session.getAttribute("arbitro") == null) || (session.getAttribute("userid") == ""))  
	   response.sendRedirect("index.jsp");   
 	 arbitro user = (arbitro) session.getAttribute("arbitro");
 %>
<html>
	<head>
		<title>Be a Referee</title>
		<!-- CSS  -->
		<link type="text/css" rel="stylesheet"  href="css/materialize.css" media="screen,projection"/>
		<link type="text/css" rel="stylesheet" href="css/fixedBar.css" media="screen,projection"/>
		<link  type="text/css" rel="stylesheet" href="css/back_to_top.css" media="screen,projection"/>
		<link type="text/css" rel="stylesheet"  href="css/form.css" media="screen,projection"/>
		<script type="text/javascript" src="js/aggiornaAnagrafica.js"></script>
		<!-- FONT -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>

	</head>
	<body class="news">
	<% Cookie[] cookies = request.getCookies();
				if (cookies != null) {   
					boolean trovato = false;
					for(int j=0; j<cookies.length; j++) {  
						Cookie c = cookies[j];  
						if (c.getName().equals("userinfo")) { 
						//	String divLogIn = "<div id=\"header_right\"> Bentornato: " + c.getValue() + "| <a href=\"logout.jsp\"> Logout </a></div>";
						//	out.println(divLogIn);
							trovato=true;
							break;   
							}
					}
				}
						%> 
		<header>
			<nav>
			<div class="nav-wrapper green">
            <a href="#" class="brand-logo">Be A Referee</a>
    		<ul id="slide-out" class="side-nav fixed">
    			<li class="logo">
    				<a id="logo-container" href="HomePagePersonale_arbitro.jsp">
            		<object id="front-page-logo" data="img/arbitro_icon.png"></object></a>
            	</li>
            	<br>
            	<br>
      			<li><a href="#!" class="green">Area Personale</a></li>
      			<li class="no-padding">
        			<ul class="collapsible collapsible-accordion">
          		<li>
            	<a class="collapsible-header">Area Tecnica<i class="material-icons">arrow_drop_down</i></a>
            	<div class="collapsible-body">
              		<ul>
                		<li><a href="gestioneDesignazioni_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Designazioni</a></li>
                		<li><a href="#!" class="waves-effect waves-teal">Referto</a></li>
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
                		<li><a href="gestioneEventi_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Eventi</a></li>
                		<li><a href="gestoneComunicazioni_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Comunicazioni</a></li>
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
                		<li><a href="gestioneIban_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Gestione IBAN</a></li>
                		<li><a href="visualizzaRimborsi_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="green">Rimborsi</a></li>
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
        			<li><a href="logout.jsp" class="waves-effect waves-teal">Logout</a></li>
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
        	
        		</div>
        	<h4>Taglia e Numero Scarpe</h4>	
        	<div class="input-field col s6">
    			<select id="divisa">
    				<option value="<%=user.getTaglia_Divisa() %>"><%=user.getTaglia_Divisa() %></option>
      				<option value="S">S</option>
      				<option value="M">M</option>
      				<option value="L">L</option>
      				<option value="XL">XL</option>
      				<option value="XXL">XXL</option>
    			</select>
    			<label>Taglia Divisa</label>
  			</div>
  			<div class="input-field col s6">
    			<select id="scarpe">
    			<option value="<%=user.getTaglia_Scarpe()%>"><%=user.getTaglia_Scarpe() %></option>
      				<option value="37">37</option>
      				<option value="38">38</option>
      				<option value="39">39</option>
      				<option value="40">40</option>
      				<option value="41">41</option>
      				<option value="42">42</option>
      				<option value="43">43</option>
      				<option value="44">44</option>
      				<option value="45">45</option>
      				<option value="46">46</option>
      				<option value="47">47</option>
      				<option value="48">48</option>
      				<option value="49">49</option>
      				<option value="50">50</option>
    			</select>
    			<label>Numero Scarpe</label>
  			</div>
        </div>	
        	
        <button class="btn waves-effect waves-light green" type="submit" name="action" onClick="aggiungiAnagrafica('<%=user.getCM()%>')">Applica Modifiche
    		<i class="material-icons right">send</i>
  		</button>
  		</main>
  		
<%@include file="footer.jsp" %>
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