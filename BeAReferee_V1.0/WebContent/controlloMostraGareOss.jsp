<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page
	import="AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*, java.sql.*"%>
<head>
<title>ControlloMostraGareOss</title>

</head>
<body>
	<%@ page import="java.sql.*, java.util.*"%>
	<%
		String ass = request.getParameter("cm");
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
		Connection con = DriverMaagerConnectionPool.getConnection();
		Statement st = con.createStatement();
		ResultSet rs;
		rs=st.executeQuery("select * from gara where CM_Osservatore='"+ass+"'");%>
		
		<select id="partita">
			<%while(rs.next()){
				%>
				<option value="<%=rs.getInt("ID_Partita")%>"><%=rs.getString("Squadra_Casa") %>-<%= rs.getString("Squadra_Ospite") %> del <%=rs.getString("Data") %> </option>
			<%}
				%>
		</select>




















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