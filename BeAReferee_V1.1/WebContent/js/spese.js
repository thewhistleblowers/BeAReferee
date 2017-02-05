function gestiscisoldi(){
	var  xhttp;
	var cat = document.getElementById("categoria");
	var quo = document.getElementById("quota");
	var dat = document.getElementById("data");
	var mot = document.getElementById("motivazione");
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function (){
		if (xhttp.readyState == 4 && xhttp.status==200) {
			var risultato = xhttp.responseText;
			var esito = risultato.search("spesaaggiunta");
			if(esito > 0){
				alert("Azione avvenuta con succeesso!");
				location.reload();
			} 
		}
	};
		xhttp.open("GET", "controlloSpesa.jsp?cat="+cat.value+"&quo="+quo.value+"&dat="+dat.value+"&mot="+mot.value,true);
		xhttp.send();

	}
