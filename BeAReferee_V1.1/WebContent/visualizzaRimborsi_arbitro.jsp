<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.io.*, javax.servlet.*,  javax.servlet.annotation.*, javax.servlet.http.*"%>
<%@ page
	import="java.util.Date, java.text.SimpleDateFormat, java.text.ParseException.*"%>
	<%@ page import="java.util.*"%>
	
<%@ page import = "AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 

<% if (session.getAttribute("arbitro")==null) {%> <h1>NON PUOI ACCEDERE</h1><%}
arbitro user = (arbitro) session.getAttribute("arbitro");


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
		<link rel="stylesheet" type="text/css" href="css/back_to_top.css">
	</head>
	<body class="news">
		<header>
			<nav>
			<div class="nav-wrapper green">
            <a href="#" class="brand-logo">Be A Referee</a>
    		<ul id="slide-out" class="side-nav fixed">
    			<li class="logo">
    				<a id="logo-container" href="#!">
            		<object id="front-page-logo" data="img/arbitro_icon.png"></object></a>
            	</li>
            	<br>
            	<br>	
      			<li><a href="areaPersonale_arbitro.jsp?arbitro=<%=user.getCM()%>" class="waves-effect waves-teal">Area Personale</a></li>
      			<li class="no-padding">
        			<ul class="collapsible collapsible-accordion">
          		<li>
            	<a class="collapsible-header">Area Tecnica<i class="material-icons">arrow_drop_down</i></a>
            	<div class="collapsible-body">
              		<ul>
                		<li><a href="gestioneDesignazioni_arbitro.jsp?arbitro=<%=user.getCM()%>" class="waves-effect waves-teal">Designazioni</a></li>
                		<li><a href="inserisciReferto.jsp?arbitro=<%=user.getCM()%>" class="waves-effect waves-teal">Referto</a></li>
                		<li><a href="gestioneIndisponibilità_arbitro.jsp?arbitro=<%=user.getCM()%>" class="waves-effect waves-teal">Indisponibilità</a></li>
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
                		<li><a href="gestioneEventi_arbitro.jsp?arbitro=<%=user.getCM()%>" class="waves-effect waves-teal">Eventi</a></li>
                		<li><a href="gestioneComunicazioni_arbitro.jsp?arbitro=<%=user.getCM()%>" class="waves-effect waves-teal">Comunicazioni</a></li>
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
                		<li><a href="gestioneIban_arbitro.jsp?arbitro=<%=user.getCM()%>" class="waves-effect waves-teal">Gestione IBAN</a></li>
                		<li><a href="#!" class="green">Rimborsi</a></li>
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
        			<li><a href="" class="waves-effect waves-teal">Gestione Contabile</a></li>
        			<li><a href="" class="waves-effect waves-teal">Logout</a></li>
      			</ul>
      			</div>
  			</nav>
		</header>
		<main>
			<table>
        		<thead>
          			<tr>
          				<th data-field="lega">Lega</th>
              			<th data-field="gara">Gara</th>
              			<th data-field="data">Data</th>
              			<th data-field="somma">Somma</th>
              			
          			</tr>
        		</thead>
        		<tbody>
        <%
        Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverMaagerConnectionPool.getConnection();
    	Statement st = con.createStatement();
    	Statement st2 = con.createStatement();
      	int i=0;
    	String data=null;
    	String x="ciao";
    	String note="";
    	ResultSet rs;
    	ResultSet ro;
    	rs=st.executeQuery("select * from rimborso where CM_Arbitro='"+user.getCM()+"' order by ID_Partita desc");
    	ro=st2.executeQuery("select * from gara where CM_Arbitro='"+user.getCM()+"' and Stato_Arbitro=1");
    	while(rs.next()&&ro.next()){
                   %>  		
          			<tr>
          				<td><%=ro.getString("Lega")%></td>
            			<td><%=ro.getString("Squadra_Casa")%> - <%=ro.getString("Squadra_Ospite") %></td>
            			<td><%=ro.getString("Data")%>,ore <%=ro.getString("Ora")%></td>
            			<td><%=rs.getInt("Somma")%>€</td>
           			</tr>
      <%} %>    			
        		</tbody>
      		</table>
      	<br>
      	<br>
      	<br>
      	<br>
      	<br>
      	<br>	
		</main>
		<footer class="page-footer green darken-1">
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