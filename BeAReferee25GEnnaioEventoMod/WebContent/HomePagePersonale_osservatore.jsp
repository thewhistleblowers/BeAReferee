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
		<link type="text/css" rel="stylesheet"  href="css/form.css" media="screen,projection"/>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
		<script type="text/javascript" src="js/materialize.js"></script>
		<script type="text/javascript" src="js/humburger.js"></script>
		<link rel="stylesheet" type="text/css" href="css/back_to_top.css">
	</head>
	<body class="news">
		<header>
			<nav>
			<div class="nav-wrapper blue darken-3">
            <a href="#" class="brand-logo">Be A Referee</a>
    		<ul id="slide-out" class="side-nav fixed">
    			<li class="logo">
    				<a id="logo-container" href="">
            		<object id="front-page-logo" data="img/osservatore_icon.png"></object></a>
            	</li>
            	<br>
            	<br>	
      			<li><a href="areaPersonale_osservatore.jsp?osservatore=<%=+user.getCM()%>"" class="waves-effect waves-teal">Area Personale</a></li>
      			<li class="no-padding">
        			<ul class="collapsible collapsible-accordion">
          		<li>
            	<a class="collapsible-header">Area Tecnica<i class="material-icons">arrow_drop_down</i></a>
            	<div class="collapsible-body">
              		<ul>
                		<li><a href="gestioneDesignazioni_osservatore.jsp?osservatore=<%=+user.getCM()%>" class="waves-effect waves-teal">Designazioni</a></li>
                		<li><a href="inserisciRapporto.jsp?osservatore=<%=+user.getCM()%>"" class="waves-effect waves-teal">Rapporto</a></li>
                		<li><a href="gestioneIndisponibilità_osservatore.jsp?osservatore=<%=+user.getCM()%>"" class="waves-effect waves-teal">Indisponibilità</a></li>
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
                		<li><a href="gestioneEventi_osservatore.jsp?osservatore=<%=+user.getCM()%>"" class="waves-effect waves-teal">Eventi</a></li>
                		<li><a href="gestioneComunicazioni_osservatore.jsp?osservatore=<%=+user.getCM()%>"" class="waves-effect waves-teal">Comunicazioni</a></li>
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
                		<li><a href="gestioneIban_osservatore.jsp?osservatore=<%=+user.getCM()%>"" class="waves-effect waves-teal">Gestione IBAN</a></li>
                		<li><a href="visualizzaRimborsi_osservatore.jsp?osservatore=<%=+user.getCM()%>"" class="waves-effect waves-teal">Rimborsi</a></li>
              		</ul>
            	</div>
            	</li>
        		</ul>
        		</li>
      			<li><a href="logout.jsp" class="waves-effect waves-teal">Logout</a></li>
    		</ul>
    		<a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
      			<ul class="side-nav" id="mobile-demo">
        			<li><a href="" class="waves-effect waves-teal">Area Personale</a></li>
        			<li><a href="" class="waves-effect waves-teal">Area Tecnica</a></li>
        			<li><a href="" class="waves-effect waves-teal">Area Associativa</a></li>
        			<li><a href="" class="waves-effect waves-teal">Gestione Contabile</a></li>
        			<li><a href="" class="waves-effect waves-teal">Logout</a></li>
      			</ul>
      			</div>
  			</nav>
		</header>
		<main>
			<h4>Bentornato su Be A Referee <%=user.getNome()%> <%=user.getCognome() %>, il tuo CM è: "<%=user.getCM()%>"</h4>
			<br>
			<br>
			<br>
			<br>
			<% 
	String arb = request.getParameter("cm");
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/be",
            "root", "nelloange9");
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
    int i=0;
    String casa="";
    String ospite="";    
    String date="";
    int id2=0;
    int id=0;
    ResultSet rs;
    ResultSet rs2;
    String query2 = "select * from gara where CM_Arbitro=" + user.getCM()+" and Stato_Arbitro=0";
    String query = "select * from gara where CM_Arbitro=" + user.getCM()+ " and Stato_Arbitro=1";
    rs = st.executeQuery(query); 
    rs2 = st2.executeQuery(query2); 
    while(rs.next()){
     id= rs.getInt("ID_Partita");
     if (id>=id2){
     casa= rs.getString("Squadra_Casa");
     ospite= rs.getString("Squadra_Ospite");
     date=rs.getString("Data");
     id2=id;
     }
     }
    while(rs2.next()){
    
  		i++;
  	
    }
        
    %>
			<h5>La tua ultima gara osservata è stata: "<%out.print(casa);%>-<%out.print(ospite);%>" del <% out.print(date);%></h5>
			<a class="btn-floating btn-large waves-effect waves-light blue darken-3"><i class="material-icons">send</i></a>
			<br>
			<br>
			<br>
			<h5>Hai <%out.print(i);%> designazioni da accettare</h5>
			<a class="btn-floating btn-large waves-effect waves-light blue darken-3"><i class="material-icons">send</i></a>			
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
			<img src="top-btn.png">
		</div>
	</body>
</html>