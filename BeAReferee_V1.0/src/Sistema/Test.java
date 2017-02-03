package Sistema;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;


public class Test {


	public Test(String d,String pre,String nome, String cognome,String oss, String vot,String casa,String osp,String mot) {

	
		Document document = new Document();
		Date dat= new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String result=sdf.format(dat);
		try {

			
			PdfWriter.getInstance(document, new FileOutputStream("C:/Users/Nello_9/Desktop/prova/ref/WebContent/"+oss+"/"+"Rapporto"+result+".pdf"));
		
			document.open();
			
		
			Paragraph p1 = new Paragraph(new Phrase("INFORMAZIONI RAPPORTO", FontFactory.getFont(
					FontFactory.HELVETICA, 18)));
			p1.add("\n");
			Paragraph p2 = new Paragraph("",FontFactory.getFont(FontFactory.HELVETICA, 14));
			p2.add("Rapporto per l'osservatore: "+nome+ " "+cognome+"-"+oss+"\nInviato il "+dat+"\n");
			p2.add("Voto assegnato: "+vot+"\n");
			p2.add("Partita esaminata in oggetto: " + casa + "-"+osp+" del "+d+"\n");
			
			
			p2.add("\n\n");
			document.add(p1);
			document.add(p2);

			Paragraph p3 = new Paragraph(new Phrase("MOTIVAZIONE", FontFactory.getFont(
					FontFactory.HELVETICA, 16)));
			p3.add("\n");
			Paragraph p4 = new Paragraph("",FontFactory.getFont(FontFactory.HELVETICA, 14));
			p4.add( mot + "\n");
			
			p4.add("\n\n");
			document.add(p3);
			document.add(p4);

			Paragraph p5 = new Paragraph("Il presidente",FontFactory.getFont(
					FontFactory.HELVETICA, 10));
			p5.add("\n");
			Paragraph p6 = new Paragraph("Codice Meccanografico "+pre,FontFactory.getFont(FontFactory.HELVETICA, 8));
			
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
