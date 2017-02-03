function invia(){
	var  xhttp;
	var tipo = document.getElementById("tipo");
	var data = document.getElementById("data");
	var motivo = document.getElementById("motivo");
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function (){
		if (xhttp.readyState == 4 && xhttp.status==200) {
			var risultato = xhttp.responseText;
			var esito = risultato.search("invioriusciuto");
			if(esito > 0){
				alert("Invio "+tipo.value+" avvenuto con successo!");
				location.reload();
			} 
		}
	};
		xhttp.open("GET", "controlloInviaEvento.jsp?tipo="+tipo.value+"&data="+data.value+"&motivo="+motivo.value,true);
		xhttp.send();

	}
