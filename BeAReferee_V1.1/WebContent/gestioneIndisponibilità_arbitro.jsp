<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page
	import="java.io.*, javax.servlet.*,  javax.servlet.annotation.*, javax.servlet.http.*"%>
<%@ page
	import="java.util.Date, java.text.SimpleDateFormat, java.text.ParseException.*"%>
	<%@ page import="java.util.*"%>
	
<%@ page import = "AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 

<% if (session.getAttribute("arbitro")==null) {%> <h1>NON PUOI ACCEDERE</h1><%}
arbitro user = (arbitro) session.getAttribute("arbitro");
associatoModel model= new associatoModel();
ArrayList <indisponibilita> indiFatte= new ArrayList<indisponibilita>(model.visualizzaIndisponibilitaInviate(user));
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
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
		<script type="text/javascript" src="js/materialize.js"></script>
		<script type="text/javascript" src="js/humburger.js"></script>
		<script type="text/javascript" src="js/select.js"></script>
		<script type="text/javascript" src="js/in.js"></script>
		<link rel="stylesheet" type="text/css" href="img/back_to_top.css">
	</head>
	<body class="news">
		<header>
			<nav>
			<div class="nav-wrapper green">
            <a href="#" class="brand-logo">Be A Referee</a>
    		<ul id="slide-out" class="side-nav fixed">
    			<li class="logo">
    				<a id="logo-container" href="HomePagePersonale_arbitro.jsp?arbitro='<%=user.getCM()%>'">
            		<object id="front-page-logo" data="img/arbitro_icon.png"></object></a>
            	</li>
            	<br>
            	<br>	
      			<li><a href="areaPersonale_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Area Personale</a></li>
      			<li class="no-padding">
        			<ul class="collapsible collapsible-accordion">
          		<li>
            	<a class="collapsible-header">Area Tecnica<i class="material-icons">arrow_drop_down</i></a>
            	<div class="collapsible-body">
              		<ul>
                		<li><a href="gestioneDesignazioni_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Designazioni</a></li>
                		<li><a href="inserisciReferto.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Referto</a></li>
                		<li><a href="#!" class="green">Indisponibilità</a></li>
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
                		<li><a href="visualizzaRimborsi_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Rimborsi</a></li>
              		</ul>
            	</div>
            	</li>
        		</ul>
        		</li>
      			<li><a href="logout.jsp" class="waves-effect waves-teal">Logout</a></li>
    		</ul>
    		<a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
      			<ul class="side-nav" id="mobile-demo">
        			<li><a href="areaPersonale_associato.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Area Personale</a></li>
        			<li><a href="" class="waves-effect waves-teal">Area Tecnica</a></li>
        			<li><a href="" class="waves-effect waves-teal">Area Associativa</a></li>
        			<li><a href="" class="waves-effect waves-teal">Gestione Contabile</a></li>
        			<li><a href="logout.jsp" class="waves-effect waves-teal">Logout</a></li>
      			</ul>
      			</div>
  			</nav>
		</header>
		<main>
			<h4>Richiedi Indisponibilità/Congedi</h4>
			<br>
			<br>
			
			<table>
        		<thead>
          			<tr>
              			<th data-field="tipo">Scegli Tipo</th>
              			<th data-field="data_inizio">Data Inizio</th>
              			<th data-field="data_fine">Data Fine</th>
          			</tr>
        		</thead>
        		<tbody>
          			<tr>
            			<td>
            				<div class="input-field col s6">
    							<select id="tipo">
      								<option value="Indisponibilita">Indisponibilità</option>
      								<option value="Congedo">Congedo</option>
    							</select>
  							</div>
            			</td>
            			
            			<td>
            				<input id="dataIni" type="date" class="datepicker" min="<%=result %>" required>
            			</td>
            			<td>
            				<input id="dataFin" type="date" class="datepicker" min="dataIni" required>
            			</td>	
          			</tr>
        		</tbody>
      		</table>
      		<br>
      		<br>
      		
  			 <button class="btn waves-effect waves-light green" type="submit" name="action" onclick="inser('<%=user.getCM()%>')">Richiedi
    		<i class="material-icons right">send</i>
  		</button>
  			
  		
  			<br>
  			<br>
  			<h4>Storico Indisponibilità</h4>
  			<table>
        <thead>
          <tr>
              <th data-field="tipo_storico">Tipo</th>
              <th data-field="data_inizio_storico">Data Inizio</th>
              <th data-field="data_fine_storico">Data Fine</th>
              <th data-field="stato_accettazione">Stato</th>
          </tr>
        </thead>
        <tbody>
          
         <%for (int j=0; j<indiFatte.size();j++) {%>
          <tr>
            <td><%out.print(indiFatte.get(j).getTipo());%></td>
            <td><%out.print(indiFatte.get(j).getData_Inizio());%></td>
            <td><%out.print(indiFatte.get(j).getData_Fine());%></td>
            <%if (indiFatte.get(j).getStato()==0){ %>
            <td><i class="small material-icons">-</i></td><%} %>
            <%if (indiFatte.get(j).getStato()==1){ %>
            <td><i class="small material-icons">thumb_up</i></td><%} %>
            <%if (indiFatte.get(j).getStato()==3){ %>
            <td><i class="small material-icons">thumb_down</i></td><%} %>
          </tr>
          <%} %>
         
        </tbody>
        </table>
  			<br>
  			<br>
		</main>
		<br>
		<br>
		<br>
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