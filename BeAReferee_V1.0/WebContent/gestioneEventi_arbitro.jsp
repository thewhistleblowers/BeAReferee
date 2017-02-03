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
ArrayList <evento> evento= new ArrayList<evento>();

Connection con = DriverMaagerConnectionPool.getConnection();
Statement st = con.createStatement();
Statement ev = con.createStatement();
ResultSet rs;
ResultSet eve;
int id=0;
int idev=0;
Date data= new Date();
Date when= new Date();
String note="";
String partecipanti="";




%>

<html>
	<head>
		<title>Be a Referee</title>
		<!-- CSS  -->
		<link type="text/css" rel="stylesheet"  href="css/materialize.css" media="screen,projection"/>
		<link type="text/css" rel="stylesheet" href="css/fixedBar.css" media="screen,projection"/>
		<link type="text/css" rel="stylesheet" href="css/back_to_top.css" media="screen,projection"/>
		<link type="text/css" rel="stylesheet"  href="css/form.css" media="screen,projection"/>
		<!-- FONT -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
      			<li><a href="areaPersonale_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Area Personale</a></li>
      			<li class="no-padding">
        			<ul class="collapsible collapsible-accordion">
          		<li>
            	<a class="collapsible-header">Area Tecnica<i class="material-icons">arrow_drop_down</i></a>
            	<div class="collapsible-body">
              		<ul>
                		<li><a href="gestioneDesignazioni_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Designazioni</a></li>
                		<li><a href="inserisciReferto.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Referto</a></li>
                		<li><a href="gestioneIndisponibilità.jsp?arbitro='<%=user.getCM()%>'">Indisponibilità</a></li>
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
                		<li><a href="#!" class="green">Eventi</a></li>
                		<li><a href="gestioneComunicazioni_arbitro.jsp?arbitro='<%=user.getCM()%>'"class="waves-effect waves-teal">Comunicazioni</a></li>
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
        			<li><a href="areaPersonale_associato.html" class="waves-effect waves-teal">Area Personale</a></li>
        			<li><a href="" class="waves-effect waves-teal">Area Tecnica</a></li>
        			<li><a href="" class="waves-effect waves-teal">Area Associativa</a></li>
        			<li><a href="" class="waves-effect waves-teal">Gestione Contabile</a></li>
        			<li><a href="logout.jsp" class="waves-effect waves-teal">Logout</a></li>
      			</ul>
      			</div>
  			</nav>
		</header>
		<main>
		
			<h4>Gestione Eventi</h4>
			<br>
			<br>
			 <table class="striped">
        <thead>
          <tr>
              <th data-field="oggetto_eve">Oggetto</th>
              <th data-field="data_eve">Data</th>
              <th data-field="accetta_eve">Azioni</th>
          </tr>
        </thead>
<form method="post" action="controlloEventi.jsp">
        <tbody>
        <%
      //sistemare tutto questo:
       
         rs=st.executeQuery("select * from avviso");
        while(rs.next()){
        id= rs.getInt("ID_Avviso");
        data= rs.getDate("Data");
        note= rs.getString("Note");
        }
       
        eve=ev.executeQuery("select * from evento where ID_Evento="+id);
	while(eve.next())
	{	
		evento eveni= new evento();
	idev=eve.getInt("ID_Evento");
	partecipanti=eve.getString("Partecipanti");
	eveni.setID_Evento(idev);
	eveni.setPartecipanti(partecipanti);
	evento.add(eveni);
	}
	 for (int j=0; j<evento.size();j++) {
		 if(evento.get(j).getPartecipanti()==user.getCM())
			 break;
	 		session.setAttribute("evento", evento.get(j));
	 
	 %>
          <tr>
            <td><%out.print(note);%></td>
            <td><%out.print(data); %></td>
           <td> <button class="btn waves-effect waves-light green" type="submit" name="decisione" value="accetta" id="invio">Partecipa
            			<i class="material-icons right">send</i>
  		</button></td>
  		 <%}%>
       
        </tbody>
       </form>
      </table>
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