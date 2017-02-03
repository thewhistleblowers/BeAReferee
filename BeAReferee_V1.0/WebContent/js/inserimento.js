function inserisci(){
	var  xhttp;
	var nome= document.getElementById("nome");
	var cognome= document.getElementById("cognome");
	var nascita= document.getElementById("nascita");
	var sesso= document.getElementById("sesso");
	var cf= document.getElementById("cf");
	var indiRes = document.getElementById("indirizzo");    
	var civ= document.getElementById("civico");
	var citta = document.getElementById("citta");
	var reg = document.getElementById("regione");
	var telefono= document.getElementById("telefono");
	var email= document.getElementById("email");
	var cat= document.getElementById("categoria");
	
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function (){
		if (xhttp.readyState == 4 && xhttp.status==200) {
			var risultato = xhttp.responseText;
			var codf = risultato.search("cf no");
			var esito = risultato.search("inserimento ok");
			var data= risultato.search("no data");
	if(codf<0){
			if(data >0){
				alert("Formato data non valido")
			}
			if(esito > 0 && data<1){
				alert("Associato inserito con successo!");
				location.reload();
			}
			else{
				alert("La città inserita non esiste o non si trova in Campania!");
			}
		}
	if(codf>0)
		alert("Il codice fiscale inserito è gia inserito per un altro associato!");
	}
		};
		xhttp.open("GET", "controlloInserimento.jsp?nome="+ nome.value+"&cognome="+cognome.value+"&nascita="+nascita.value+"&sesso="+sesso.value+"&cf="+cf.value+"&indirizzo="+indiRes.value+"&civico="+civ.value+"&citta="+citta.value+"&regione="+reg.value+"&telefono="+telefono.value+"&email="+email.value+"&categoria="+cat.value,true);
		xhttp.send();

	}
