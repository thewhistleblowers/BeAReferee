function inser(id){
	var xhttp; 
	var tipo = document.getElementById("tipo");
	var dataIni = document.getElementById("dataIni");
	var dataFin = document.getElementById("dataFin");
	
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function (){
		if (xhttp.readyState == 4 && xhttp.status==200) {
			var risultato = xhttp.responseText;
			var no= xhttp.responseText;
			var esito = risultato.search("ok");
			
			if(esito > 0){
				alert("Indisponibilità inviato con successo!");
				location.reload();
			}
			else{
				alert("Campo obbligatorio non inserito");
			}
		}
	};
	xhttp.open("GET", "controlloIndisponibilita.jsp?cm="+id+"&tipo="+tipo.value+"&dataIni="+dataIni.value+"&dataFin="+dataFin.value, true);
	xhttp.send();
}

