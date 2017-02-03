function accettaind(cm,ind,resp){
	var  xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function (){
		if (xhttp.readyState == 4 && xhttp.status==200) {
			var risultato = xhttp.responseText;
			var esito = risultato.search("accettato");
			var esit2 = risultato.search("rifiutato");
			if(esito > 0 || esit2>0){
				alert("Operazione eseguita con successo!");
				location.reload();
			} 
		}
	};
		xhttp.open("GET", "controlloAccettaIndi.jsp?cm="+ cm+"&ind="+ind+"&resp="+resp,true);
		xhttp.send();

	}
