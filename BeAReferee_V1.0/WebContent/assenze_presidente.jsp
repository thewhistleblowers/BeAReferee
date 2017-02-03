<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.io.*, javax.servlet.*,  javax.servlet.annotation.*, javax.servlet.http.*"%>
<%@ page
	import="java.util.Date, java.text.SimpleDateFormat, java.text.ParseException.*"%>
<%@ page import="java.util.*"%>
<%@ page
	import="AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%>

<%
	if (session.getAttribute("presidente") == null) {
%>
<h1>NON PUOI ACCEDERE</h1>
<%
	}

	presidente user = (presidente) session.getAttribute("presidente");
%>

<html>
<head>
<title>Be a Referee</title>
<link rel="stylesheet" href="css/materialize.css">
<link rel="stylesheet" href="css/fixedBar.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/materialize.js"></script>
<script type="text/javascript" src="js/humburger.js"></script>
<script type="text/javascript" src="js/registraAss.js"></script>
<link rel="stylesheet" type="text/css" href="css/back_to_top.css">
</head>
<body class="news">
	<header>
		<nav>
			<div class="nav-wrapper blue-grey">
				<a href="#" class="brand-logo">Be A Referee</a>
				<ul id="slide-out" class="side-nav fixed">
					<li class="logo"><a id="logo-container" href="#!"> <object
								id="front-page-logo" data="img/presidente_icon.png"></object></a></li>
					<br>
					<br>
					<li><a
						href="areaPersonale_presidente.jsp?presidente=<%=user.getCM()%>"
						class="waves-effect waves-teal">Area Personale</a></li>
					<li class="no-padding">
						<ul class="collapsible collapsible-accordion">
							<li><a class="collapsible-header">Area Tecnica<i
									class="material-icons">arrow_drop_down</i></a>
								<div class="collapsible-body">
									<ul>
										<li><a
											href="gara_presidente.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Designa Gare</a></li>
										<li><a
											href="gestione_leghe.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Gestione Leghe</a></li>
										<li><a
											href="valutazione_oss_presidente.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Valutazione Osservatore</a></li>
										<li><a
											href="congedi_presidente.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Gestione Indisponibilità</a></li>
									</ul>
								</div></li>
						</ul>
					</li>
					<li class="no-padding">
						<ul class="collapsible collapsible-accordion">
							<li><a class="collapsible-header">Area Amministrativa<i
									class="material-icons">arrow_drop_down</i></a>
								<div class="collapsible-body">
									<ul>
										<li><a
											href="speseSezione_presidente.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Gestione Spese Sezione</a></li>
										<li><a
											href="eventi_presidente.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Inserisci
												Comunicazioni/Eventi</a></li>
										<li><a
											href="assenze_presidente.jsp?presidente=<%=user.getCM()%>"
											class="blue-grey">Gestione Registro Assenze</a></li>
									</ul>
								</div></li>
						</ul>
					</li>
					<li class="no-padding">
						<ul class="collapsible collapsible-accordion">
							<li><a class="collapsible-header">Area Gestionale<i
									class="material-icons">arrow_drop_down</i></a>
								<div class="collapsible-body">
									<ul>
										<li><a
											href="iscriviAssociato_presidente.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Iscrivi Associato</a></li>
										<li><a
											href="gestisciAssociato_presidente.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Gestisci Associato</a></li>
										<li><a
											href="certificato_presidente.jsp?presidente=<%=user.getCM()%>"
											class="waves-effect waves-teal">Inserisci Certificato</a></li>
									</ul>
								</div></li>
						</ul>
					</li>

					<li><a href="logout.jsp" class="waves-effect waves-teal">Logout</a></li>
				</ul>
				<a href="#" data-activates="slide-out" class="button-collapse"><i
					class="material-icons">menu</i></a>
				<ul class="side-nav" id="mobile-demo">
					<li><a href="areaPersonale_associato.html"
						class="waves-effect waves-teal">Area Personale</a></li>
					<li><a href="" class="waves-effect waves-teal">Area
							Tecnica</a></li>
					<li><a href="" class="waves-effect waves-teal">Area
							Associativa</a></li>
					<li><a href="" class="waves-effect waves-teal">Logout</a></li>
				</ul>
			</div>
		</nav>
		</header>
		<main>
			<h4>Inserisci Assenza</h4>
		<div class="row">
     		 <div class="row">
        		<div class="input-field col s6">
          			<select id="associato">
<%Connection con= DriverMaagerConnectionPool.getConnection();
	Statement st= con.createStatement();
	ResultSet rs; 
	rs=st.executeQuery("select * from associato");
	while(rs.next()){
			if(!rs.getString("CM").equalsIgnoreCase(user.getCM()) && !(rs.getString("Cognome").equalsIgnoreCase("--"))){%>          			
          			<option value="<%=rs.getString("CM")%>">
          			<%=rs.getString("Cognome") %> <%=rs.getString("Nome") %>-<%=rs.getString("CM") %>
          			</option>
          			<%} }
          			rs.close();
          			st.close();
          			%>
          			</select>
        		</div>
        	<div class="input-field col s6">
        			Data Riunione
          			<input id="data" type="date" class="validate">
          			
        		</div>
        	</div>
        </div>
        <button onclick="assenza()" class="btn waves-effect waves-light blue-grey" type="submit" name="action">Aggiungi Assenza
        <i class="material-icons right">send</i>
  		</button>	
  		<br>
  		<br>
  		<br>
  		<br>
  		<br>
  		<h4>Storico Assenze </h4>
  		<table>
  			<tr>
  					<th>Cognome&Nome</th>
  					<th>CM associato</th>
  					<th>Numero assenze</th>
  					<th>Data ultima assenza</th>
  			</tr>			
  		
  		 	<tbody>
  		 	<% int f=0; 
  		 	String da="No assenza!";
  		 	Statement ok=con.createStatement();
  		 	Statement kok=con.createStatement();
  		 	Statement ut=con.createStatement();
  		 	Statement st2=con.createStatement();
  		 	ResultSet set;
  		 	ResultSet sets;
  		 	ResultSet rs2;
  		 //	ResultSet vbb;
  		 	rs=ok.executeQuery("select * from associato order by Cognome");
  		 		
  		 		while(rs.next()){
  		 			if(!rs.getString("Cognome").equalsIgnoreCase("--")){					%>
  		 	
  		 	<tr>
  		 			<td><%=rs.getString("Cognome") %> <%=rs.getString("Nome") %></td>
  		 			<td><%=rs.getString("CM") %></td>
  		 			<td><%rs2=st2.executeQuery("select count(Associato) from registro_assenze where Associato='"+rs.getString("CM")+"'"); %> <%while(rs2.next()) f=rs2.getInt("count(Associato)");%><%=f %></td>
  		 			<td>
  		 			<%
  		 			set=kok.executeQuery("select ID_Riunione from registro_assenze where Associato='"+rs.getString("CM")+"'"); 
  		 			while(set.next()){	
  		 			sets=ut.executeQuery("select Data from avviso where ID_Avviso="+set.getInt("ID_Riunione"));
  		 		
  		 				while(sets.next())
  		 					
  		 				da=sets.getString("Data");
  		 					
  		 				}
  		 			%><%=da %>
  		 			</td>
  		 	
  		 	</tr>	
  		 		<%}da="No assenza!"; } %>
  		 	
  		 	</tbody>
  		 	
  		 		
  		</table>
  		
  			
		</main>
			<%@include file="footer_presidente.jsp" %>
		<div id="back_to_top">
			<img src="img/top-btn.png">
		</div>
	</body>
</html>