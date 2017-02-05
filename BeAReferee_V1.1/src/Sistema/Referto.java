package Sistema;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;


public class Referto {


	public Referto(String cas, String fuo, String dt,String leg,String cm,String luogo,String golcasa, String golfuor,String soscasa, String sosfuori,String ammcasa,String ammfuori,String espcasa,String espfuori) {

	
		Document document = new Document();
		Date dat= new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String result=sdf.format(dat);
		try {

			
			PdfWriter.getInstance(document, new FileOutputStream("C:/Users/Nello_9/Desktop/prova/ref/WebContent/"+cm+"/"+"Referto"+result+".pdf"));
		
			document.open();
			
		
			Paragraph p1 = new Paragraph(new Phrase("INFORMAZIONI PARTITA", FontFactory.getFont(
					FontFactory.HELVETICA, 18)));
			p1.add("\n");
			Paragraph p2 = new Paragraph("",FontFactory.getFont(FontFactory.HELVETICA, 14));
			p2.add("Referto per la gara: "+cas+ "-"+fuo+"\ndel: "+dt+"\nInviato il "+dat+"\n");
			p2.add("Dall'arbitro: "+cm+"\n");
			p2.add("Lega: "+leg+"\nGiocata a: "+luogo+"\n");
			p2.add("Risultato finale:\nSquadra Ospitante: " + golcasa + "- Squadra Ospitata:"+golfuor+"\n");
			
			p2.add("\n\n");
			document.add(p1);
			document.add(p2);

			Paragraph p3 = new Paragraph(new Phrase("SOSTITUZIONI", FontFactory.getFont(
					FontFactory.HELVETICA, 16)));
			p3.add("\n");
			p3.add("Squadre ospitante: " +soscasa + "\n\n\n\nSquadra ospitata: "+sosfuori);
			Paragraph p4 = new Paragraph("AMMONIZIONI",FontFactory.getFont(FontFactory.HELVETICA, 14));
			p4.add("Squadre ospitante: "+ammcasa+ "\n\nSquadra ospitata: "+ammfuori);
			
			p4.add("\n\n");
			document.add(p3);
			document.add(p4);

			Paragraph p5 = new Paragraph("ESPULSIONI",FontFactory.getFont(
					FontFactory.HELVETICA, 14));
			p5.add("\n");
			p5.add("Squadre ospitante: "+espcasa+     " \n\n\n\n\n\n Squadra ospitata: "+espfuori);
			
			Paragraph p6 = new Paragraph("L'arbitro: "+cm,FontFactory.getFont(FontFactory.HELVETICA, 8));
			
			p6.add("\n\n");
			document.add(p5);
			document.add(p6);

		} catch (DocumentException de) {
			System.err.println(de.getMessage());
		} catch (IOException ioe) {
			System.err.println(ioe.getMessage());
		}
		
		document.close();
	}




}
