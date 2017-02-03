<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.io.*, javax.servlet.*,  javax.servlet.annotation.*, javax.servlet.http.*"%>
<%@ page
	import="java.util.Date, java.text.SimpleDateFormat, java.text.ParseException.*"%>
	<%@ page import="java.util.*"%>
<%@ page import = "AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%> 

<% 

arbitro user = (arbitro) session.getAttribute("arbitro");
String bo= (String)session.getAttribute("ind");
  %>

<%

//Collection<?> arbitro= (Collection<?>) request.getAttribute("userid");
//arbitro arbitr= (arbitro) request.getAttribute("userid");
	
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
                		<li><a href="gestioneIndisponibilità_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Indisponibilità</a></li>
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
                		<li><a href="gestioneComunicazioni_arbitro.jsp?arbitro='<%=user.getCM()%>'" class="waves-effect waves-teal">Comunicazioni</a></li>
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
                		<li><a href="visualizzaRimborsi_arbitro.jsp?arbitro=<%=user.getCM()%>" class="waves-effect waves-teal">Rimborsi</a></li>
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
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "") || user==null) {
    	response.sendRedirect("index.jsp");
    }%>

		<h4>Bentornato su Be A Referee <%=user.getNome()%> - Il tuo CM è: "<%=user.getCM()%>"</h4>
			<br>
			<br>
			<br>
			<br>
	<% 
	String arb = request.getParameter("cm");
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverMaagerConnectionPool.getConnection();
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
    String query2 = "select * from gara where CM_Arbitro='" + user.getCM()+"' and Stato_Arbitro=0";
    String query = "select * from gara where CM_Arbitro='" + user.getCM()+ "' and Stato_Arbitro=1";
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
			<h5>La tua ultima gara accettata è stata: "<%out.print(casa);%>-<%out.print(ospite);%>" del <% out.print(date);%></h5>
			<a class="btn-floating btn-large waves-effect waves-light green"><i class="material-icons">send</i></a>
			<br>
			<br>
			<br>
			<h5>Hai <%out.print(i);%> designazioni da accettare</h5>
			<a class="btn-floating btn-large waves-effect waves-light green"><i class="material-icons">send</i></a>			
			<br>
			<br>
			<%if (bo.equalsIgnoreCase("false")){ %><h5>Sei attualmente indisponibile</h5><%} %>
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