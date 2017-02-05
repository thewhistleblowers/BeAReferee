function cancelladadatabase(CM){
	var  xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function (){
		if (xhttp.readyState == 4 && xhttp.status==200) {
			var risultato = xhttp.responseText;
			var esito = risultato.search("cancellazione riuscita");
			if(esito > 0){
				alert("Cancellazione avvenuta con successo!");
				location.reload();
			} 
		}
	};
		xhttp.open("GET", "controlloRimozione.jsp?CM="+ CM,true);
		xhttp.send();

	}
