function invia(){
	var  xhttp;
	var oss = document.getElementById("osservatore");
	var voto= document.getElementById("voto");
	var partita= document.getElementById("partita");
	var mot= document.getElementById("motivo");
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function (){
		if (xhttp.readyState == 4 && xhttp.status==200) {
			var risultato = xhttp.responseText;
			var esito = risultato.search("vabbe");
			if(esito > 0){
				alert("Rapporto salvato!");
				location.reload();
			} 
		}
	};
		xhttp.open("GET", "controlloInviaRap.jsp?cm="+ oss.value+"&voto="+voto.value+"&partita="+partita.value+"&mot="+mot.value,true);
		xhttp.send();

	}
