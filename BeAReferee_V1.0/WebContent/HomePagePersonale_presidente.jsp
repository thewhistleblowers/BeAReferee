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

<%@ page contentType="text/html; charset=UTF-8" import="java.util.*"%>
	<head>
		<title>Be a Referee</title>
				<!-- CSS  -->
		<link type="text/css" rel="stylesheet"  href="css/materialize.css" media="screen,projection"/>
		<link type="text/css" rel="stylesheet" href="css/fixedBar.css" media="screen,projection"/>
		<link  type="text/css" rel="stylesheet" href="css/back_to_top.css" media="screen,projection"/>
		<link type="text/css" rel="stylesheet"  href="css/form.css" media="screen,projection"/>
		<!-- FONT -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	</head>
	<body class="news">
	
	
	
	<% Cookie[] cookies = request.getCookies();
				if (cookies != null) {   
					boolean trovato = false;
					for(int i=0; i<cookies.length; i++) {  
						Cookie c = cookies[i];  
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
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
    	//response.sendRedirect("index.jsp");
    }%>

		<h4>Bentornato su Be A Referee <%=user.getNome()%> - Il tuo CM è: "<%=user.getCM()%>"</h4>
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
			<br>
			<br>
			<br>
			<br>
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