package bean;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import com.sun.javafx.fxml.BeanAdapter;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import bean.*;


/**
 * Servlet implementation class ProductControl
 */
@WebServlet(name="control", urlPatterns={"/control"})
public class control extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// ModelDM usa il DriverManager	
	static presidenteModel model;
	
	public control() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			//HttpSession session = request.getSession();       
//associato presidente= (associato) session.getAttribute("CM");
//arbitro bean = (arbitro) session.getAttribute("CM");
		ServletContext context=getServletContext();
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("Cerca")) {
					String code= request.getParameter("CM");
					int id= Integer.parseInt(code);
					//request.removeAttribute("product");
					request.setAttribute("CM", model.cercaCM(id));
				} else if (action.equalsIgnoreCase("Cancella")) {
					String code= request.getParameter("CM");
					int id= Integer.parseInt(code);
					model.rimozione(id);
				} else if (action.equalsIgnoreCase("control")) {
					

					arbitro richiesta=new arbitro();
					String rik=(String)request.getAttribute("richiesta");
						//control controllo= new control();
						//arbitro arbi= new arbitro();
						String user = null;
						String name=null;
					    int userid = Integer.parseInt(request.getParameter("cm"));    
					    String pwd = request.getParameter("password");
					    String cat= request.getParameter("log");
					    Class.forName("com.mysql.jdbc.Driver");
					    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/be", "root", "nelloange9");
					    Statement st = con.createStatement();
					    Statement nome= con.createStatement();
					    Statement arbitro= con.createStatement();
					    Statement osservatore= con.createStatement();
					    Statement presidente= con.createStatement();
					    ResultSet rs;
					    ResultSet nomeRes;
					    ResultSet arb;
					    ResultSet oss;
					    ResultSet pres;
					    rs = st.executeQuery("select * from utente where CM=" + userid + " and Password='" + pwd + "'");
					    nomeRes= nome.executeQuery("select * from associato where CM=" +userid);
					    arb= arbitro.executeQuery("select * from arbitro where CM=" +userid);
					    oss= osservatore.executeQuery("select * from osservatore where CM=" +userid);
					    pres= presidente.executeQuery("select * from presidente where CM_Presidente=" +userid);
					    if (nomeRes.next())
					    	name=nomeRes.getString("Nome");
					    if (rs.next()) {
					    	if (cat.equalsIgnoreCase("Arbitro") && (arb.next())){
					    		 user = "<a href=\"HomePagePersonale_arbitro.jsp?CM=" + rs.getString("CM")+ "\">";
					    		 	richiesta.setCM(userid);
					    			richiesta.setStato(nomeRes.getInt("Stato"));
									richiesta.setCognome(nomeRes.getString("Cognome"));
									richiesta.setNome(nomeRes.getString("Nome"));
									richiesta.setGare(nomeRes.getInt("Gare"));
									richiesta.setTelefono(nomeRes.getInt("Num_Telefono"));
									richiesta.setRifiuti(nomeRes.getInt("Rifiuti_ing"));
									richiesta.setCodFisc(nomeRes.getString("Codice_Fiscale"));
									richiesta.setSesso(nomeRes.getString("Sesso"));
									richiesta.setIndirizzo(nomeRes.getString("Indirizzo"));
									richiesta.setCivico(nomeRes.getString("Numero_Civico"));
									richiesta.setCittà(nomeRes.getString("Città_di_Residenza"));
									richiesta.setRegioneResid(nomeRes.getString("Regione_di_Residenza"));
									richiesta.setIBAN(nomeRes.getString("IBAN"));
									richiesta.setE_mail(nomeRes.getString("E_mail"));
									richiesta.setLega(arb.getString("Lega"));
									richiesta.setTaglia_Divisa(arb.getString("Taglia_Divisa"));
									richiesta.setTaglia_Scarpe(arb.getInt("Taglia_Scarpe"));

					    	     	String x = rs.getString("CM");
					    	     	Cookie userID = new Cookie("userid", x );
					    	     	Cookie cookie = new Cookie("userinfo", name);
					    	     	Cookie arbitroCookie = new Cookie("arbitro", rik);
					    	     	response.addCookie(cookie);
					    	     	response.addCookie(userID);
					    	     	response.addCookie(arbitroCookie);
					    	     	//HttpSession session = request.getSession();  
					    	}
					    	request.removeAttribute("arbitro");
							request.setAttribute("arbitro", richiesta);
							ServletRequest session=null;
							session.setAttribute("arbitro", request);
					     		     //arbitroLog.setCm(userid);
					     		    //arbitroLog.setNome(name);
					    	        //out.println("<a href='logout.jsp'>Log out</a>");
					    	   //response.sendRedirect("HomePagePersonale_arbitro.jsp?arbitro='" + rs.getString("CM"));
					     		    
					     		   RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/HomePagePersonale_arbitro.jsp");
					     			dispatcher.forward(request, response);
					    	}
					
					
					
					
					
					/*int cM= Integer.parseInt(request.getParameter("CM"));
					int stato= Integer.parseInt(request.getParameter("Stato"));
					String cognome = request.getParameter("Cognome");
					String nome= request.getParameter("Nome");
					int gare = Integer.parseInt(request.getParameter("Gare"));
					int telefono= Integer.parseInt(request.getParameter("Telefono"));
					int rifiuti=Integer.parseInt(request.getParameter("Rifiuti_ing"));
					String fiscale= request.getParameter("Codice_Fiscale");
					String sesso= request.getParameter("Sesso");
					String indirizzo= request.getParameter("Indirizzo");
					String civico= request.getParameter("Numero_Civico");
					String residenza= request.getParameter("Città_di_Residenza");
					String regione= request.getParameter("Regione_di_Residenza");
					String iban= request.getParameter("IBAN");
					String mail= request.getParameter("E_mail");
					
					arbitro bean= new arbitro();
					bean.setCM(cM);
					bean.setStato(stato);
					bean.setCognome(cognome);
					bean.setNome(nome);
					bean.setGare(gare);
					bean.setTelefono(telefono);
					bean.setRifiuti(rifiuti);
					bean.setCodFisc(fiscale);
					bean.setSesso(sesso);
					bean.setIndirizzo(indirizzo);
					bean.setCivico(civico);
					bean.setCittà(residenza);
					bean.setRegioneResid(regione);
					bean.setIBAN(iban);
					bean.setE_mail(mail);
					model.inserimentoAssociato(bean);
					request.setAttribute("arbitro", bean);*/
				}
				
			}
			
		}
			catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		/*RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/controlloLogin.jsp");
		dispatcher.forward(request, response);*/
	}
		/*String sort = request.getParameter("sort");

		try {
			request.removeAttribute("arbitro");
			request.setAttribute("arbitro", model.doRetrieveAll(sort));
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}*/
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
