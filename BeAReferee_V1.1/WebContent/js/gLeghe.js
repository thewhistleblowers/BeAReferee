function leghe(CM,scelta){
	var  xhttp;
	
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function (){
		if (xhttp.readyState == 4 && xhttp.status==200) {
			var risultato = xhttp.responseText;
			var esito = risultato.search("okok");
			if(esito > 0){
				alert("Cambio lega avvenuto con successo!");
				location.reload();
			} 
		}
	};
		xhttp.open("GET", "controlloLega.jsp?cm="+CM+"&scelta="+scelta,true);
		xhttp.send();

	}
