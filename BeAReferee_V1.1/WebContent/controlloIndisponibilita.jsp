
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="javafx.scene.control.Alert"%>
<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page
	import="AreaPersonale.*, AreaAssociativa.*, AreaTecnica.*, Sistema.*"%>
<%@ page import="java.util.*, java.text.*"%>



<title>controlloIndisponibilita</title>
</head>
<body>
	<%
		arbitro user = (arbitro) session.getAttribute("arbitro");
		String cm = user.getCM();
		String x = request.getParameter("cm");
		String tipo = request.getParameter("tipo");
		String dataIn = request.getParameter("dataIni");
		String dataFi = request.getParameter("dataFin");
		
	if(tipo!="" && dataIn!="" && dataFi!=""){	
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = formatter.parse(dataIn);
		Date cal = formatter.parse(dataFi);

		indisponibilita ind = new indisponibilita();

		associatoModel modello = new associatoModel();
		ind.setCM_Richiedente(user.getCM());
		ind.setTipo(tipo);
		ind.setData_Inizio(date);
		ind.setData_Fine(cal);
		double y = ind.getGiorni();
		/* if (y>15 && tipo.equalsIgnoreCase("Indisponibilita"))
		{
			response.sendRedirect("No_INDI.jsp?arbitro="+cm); 
		} */
		ind.setStato(0);
		Date attuale = new Date();
		int day = attuale.getDate();
		int month = attuale.getMonth() + 1;
		int years = attuale.getYear() + 1900;
		System.out.println("" + day + "/" + month + "/" + years + "...Date.getDate=  " + date.getYear());

		if (cal.before(date)
				|| (((date.getDate()) < day) && ((date.getMonth() + 1) <= month) && (date.getYear() <= years))
				|| ((date.getYear() + 1900) < years)) {
			response.sendRedirect("successLogin.jsp?arbitro=" + cm);
		}

		if (y>15 && tipo.equalsIgnoreCase("Indisponibilita"))
			response.sendRedirect("insGiorni.jsp?arbitro=" + cm);
		
		else {

			modello.richiediIndisponibilita(user, ind);
			out.print("ok");
		}
	}
		//response.sendRedirect("areaPersonale_arbitro.jsp?arbitro=" + cm);}
	%>
</body>
</html>