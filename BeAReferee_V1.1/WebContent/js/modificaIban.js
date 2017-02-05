function cambiaIBAN(cm){
	var  xhttp;
	var iban = document.getElementById("iban");
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function (){
		if (xhttp.readyState == 4 && xhttp.status==200) {
			var risultato = xhttp.responseText;
			var esito = risultato.search("modificaRiuscita");
			if(esito > 0){
				alert("Iban modificato con successo!");
				location.reload();
			} 
		}
	};
		xhttp.open("GET", "controlloAggiornaIBAN.jsp?cm="+ cm+"&iban="+iban.value,true);
		xhttp.send();

	}
