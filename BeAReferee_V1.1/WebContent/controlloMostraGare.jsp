<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page
	import="AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%>
<head>
<title>Controllo MostraGare</title>
<script type="text/javascript" src="js/materialize.js"></script>
<script type="text/javascript" src="js/gare.js"></script>
<script type="text/javascript" src="js/designa.js"></script>
</head>
<body>
	<%@ page import="java.sql.*, java.util.*"%>
	<%
		String lega = request.getParameter("lega");
		/* String casa =request.getParameter("casa");
		String ospite =request.getParameter("ospite");
		String data= request.getParameter("data");
		String ora =request.getParameter("ora");
		String stadio= request.getParameter("stadio");
		String arbitro =request.getParameter("arbitro");
		String osservatore =request.getParameter("osservatore"); */
		//"WebContent/dettaglio.jsp"
		String nome = null;
		String cognome = null;
		String ossnome = null;
		String osscognome = null;
		int po=0;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverMaagerConnectionPool.getConnection();
		Statement ar = con.createStatement();
		Statement st = con.createStatement();
		Statement ass = con.createStatement();
		Statement vediamo = con.createStatement();
		Statement vediamooss = con.createStatement();
		Statement statos;
		ResultSet rs;
		ResultSet arb;
		ResultSet asso;
		ResultSet vrimm;
		ResultSet vrimmoss;
		ResultSet stato;
		ArrayList<String> stri = new ArrayList<String>();
		ArrayList<String> strioss = new ArrayList<String>();
		String query = "select * from gara where Lega='" + lega + "' order by ID_Partita desc";
		rs = st.executeQuery(query);
		arb = ar.executeQuery("select * from arbitro");
		while (arb.next())
			stri.add(arb.getString("CM"));
		vrimm = vediamo.executeQuery("select * from associato");
		vrimmoss= vediamooss.executeQuery("select * from associato");
		asso = ass.executeQuery("select * from osservatore");
		while (asso.next()){
			strioss.add(asso.getString("CM"));
			}
		while (rs.next()) {
			po++;
			System.out.println("po e' uguale a:"+po);
	%>
	<tr>
		<td>
			<%
				out.print(rs.getString("Squadra_Casa"));
			%>-<%
				out.println(rs.getString("Squadra_Ospite"));
			%>
		</td>
		<td>
			<%
				out.print(rs.getString("Data"));
			%>,<%
				out.print(rs.getString("Ora"));
			%>
		</td>
		<td>
			<%
				out.print(rs.getString("Indirizzo_Stadio"));
			%>, <%
				out.print(rs.getString("Numero_Civico"));
			%>
		</td>

		<td>
			
    			<select id="ar">
				<%
					while (vrimm.next()) {
						System.out.println("po e' uguale a:"+po);
							for (int i = 0; i < stri.size(); i++) {
								if (vrimm.getString("CM").equalsIgnoreCase(stri.get(i))) {
									nome = vrimm.getString("Nome");
									cognome = vrimm.getString("Cognome");
									System.out.println(cognome + "," + vrimm.getString("CM"));
				%>
				<option value="<%=(vrimm.getString("CM"))%>" <%if(vrimm.getInt("Stato")!=0){%>disabled<%} %> <%if (vrimm.getString("CM").equalsIgnoreCase(rs.getString("CM_Arbitro"))){%> selected <%} %> >
					<%
						out.print(cognome);
					%>
					<%
						out.print(nome);
					%>-<%
						out.println(vrimm.getString("CM"));
					%>
				</option>
				<%
					}
							}
					
					}
				
				%>
		
		</select>
	
		</td>

		<td>
		<select id="os">
				<%
					while (vrimmoss.next()) {
						
							for (int i = 0; i < strioss.size(); i++) {
								if (vrimmoss.getString("CM").equalsIgnoreCase(strioss.get(i))) {
									
									ossnome = vrimmoss.getString("Nome");
									osscognome = vrimmoss.getString("Cognome");
									System.out.println(osscognome + "," + vrimmoss.getString("CM"));
				%>
				<option value="<%=(vrimmoss.getString("CM"))%>" <%if (vrimmoss.getString("CM").equalsIgnoreCase(rs.getString("CM_Osservatore"))){%> selected <%} %> >
					<%
						out.print(osscognome);
					%>
					<%
						out.print(ossnome);
					%>-<%
					if(ossnome.equalsIgnoreCase("--"))
						out.println("Nessuno");
					else
						out.println(vrimmoss.getString("CM"));
					%>
				</option>
				<%
					}
							}
							
						}
				
				
				%>
		
		</select>
		</td>
		<td><select id="soldi">
		<option value="25">25 euro</option>
		<option value="35">35 euro</option>
		<option value="45">45 euro</option>
		<option value="60">60 euro</option>
		</select>
		</td>
		
		<td><button onclick="designagar(<%=rs.getInt("ID_Partita")%>)" type="submit" class="btn waves-effect waves-light grey" >Designa</button> <%System.out.println("partita n."+rs.getInt("ID_Partita")); %></td>
		
		
		<%
		vrimm.close();	
		vrimmoss.close();
		vrimmoss= vediamooss.executeQuery("select * from associato");
		vrimm = vediamo.executeQuery("select * from associato");
		if (rs.getString("CM_Arbitro")==null && rs.getString("CM_Osservatore")==null){ %>
		<td>NON DESIGNATA</td>
		<%}
		if (rs.getString("CM_Arbitro")!=null && rs.getString("CM_Osservatore")!=null && rs.getInt("Stato_Arbitro")!=0 && rs.getInt("Stato_Osservatore")==0){%> 
		<td>Arb:SI - Oss:NO</td>
	<%}
		
		if (rs.getString("CM_Arbitro")!=null && rs.getString("CM_Osservatore")!=null && rs.getInt("Stato_Arbitro")==0 && rs.getInt("Stato_Osservatore")!=0){%> 
		<td>Arb:NO - Oss:SI</td>
		<%}
		if (rs.getString("CM_Arbitro")!=null && rs.getString("CM_Osservatore")==null && rs.getInt("Stato_Arbitro")==0 && rs.getInt("Stato_Osservatore")!=0){%> 
		<td>Arb:NO - NonOsserva</td>
		<%}
		if (rs.getString("CM_Arbitro")!=null && rs.getString("CM_Osservatore")!=null && rs.getInt("Stato_Arbitro")==0 && rs.getInt("Stato_Osservatore")==0){%> 
		<td>Arb:NO - Oss:NO</td> <%}
		if (rs.getInt("Stato_Arbitro")!=0 && rs.getInt("Stato_Osservatore")!=0) {%> 
		<td>CONFERMATA!</td> <%} %> 
		
	</tr>

	<%
		
		}
		rs.close();
	%>





















	<%-- <td><% out.print(rs.getString("Data")); %>,<%out.print(rs.getString("Ora")); %></td>
	   <td><% out.print(rs.getString("Indirizzo_Stadio"));%></td> 
	<%while(arb.next()){%>
		<option value="<%out.print(arb.getString("CM"));%>"><%out.print(arb.getString("CM"));%></option>
		<option value="<%out.print(arb.getString("CM"));%>"><%out.print(arb.getString("CM"));%></option>
		<%} %> --%>
	<%-- 			   
    
    String query1 = "select nomeProvincia from province where idRegione=" + id;
    ResultSet rt = st.executeQuery(query1);
    %> 
    <select name="province" onchange="visualizzacomune(this.value)" required>
   <%while (rt.next()) { %>
		<option value = "<% out.println(rt.getString("nomeProvincia")); %>" > <% out.println(rt.getString("nomeProvincia")); %> </option>	 
	  <%  }
%> </select> --%>
</body>
</html>