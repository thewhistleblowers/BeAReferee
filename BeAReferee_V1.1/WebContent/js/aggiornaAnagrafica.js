function aggiungiAnagrafica(id){
	var xhttp; 
	var indirizzo = document.getElementById("indirizzo");
	var civico = document.getElementById("civico");
	var citta = document.getElementById("citta");
	var regione = document.getElementById("regione");
	var telefono = document.getElementById("telefono");
	var email = document.getElementById("email");
	var divisa = document.getElementById("divisa");
	var scarpe = document.getElementById("scarpe");
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function (){
		if (xhttp.readyState == 4 && xhttp.status==200) {
			var risultato = xhttp.responseText;
			var no= xhttp.responseText;
			var esito = risultato.search("ok");
			var none = risultato.search("no");
			if(esito > 0){
				alert("Modifica avvenuta con successo!");
				location.reload();
			}
			else{
				alert("Campo obbligatorio non inserito");
			}
		}
	};
	xhttp.open("GET", "controlloModifica.jsp?cm="+id+"&indirizzo="+indirizzo.value+"&civico="+civico.value+"&citta="+citta.value+"&regione="+regione.value+"&telefono="+telefono.value+"&email="+email.value+"&divisa="+divisa.value+"&scarpe="+scarpe.value, true);
	xhttp.send();
}

