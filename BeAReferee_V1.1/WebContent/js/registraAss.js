function assenza(){
	var  xhttp;
	var ass = document.getElementById("associato");
	var data = document.getElementById("data");
	
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function (){
		if (xhttp.readyState == 4 && xhttp.status==200) {
			var risultato = xhttp.responseText;
			var esito = risultato.search("assenzaok");
			//var esito2 = risultato.search("datasbagliata");
			if(esito > 0){
				alert("Assenza inserita con successo!");
				location.reload();
			} 
			else{
				alert("Data inserita errata, non ci sono state Riunione Tecniche nel giorno inserito!");
			}
		}
	};
		xhttp.open("GET", "controlloAssenzaInserimento.jsp?ass="+ass.value+"&dat="+data.value,true);
		xhttp.send();

	}
