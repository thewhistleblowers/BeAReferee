function certif(cm){
	var  xhttp;

	var tipo = document.getElementById("data");
	var data = document.getElementById("rilasciatoDa");
	var all = document.getElementById("alleg");
	xhttp = new XMLHttpRequest();
	//if( file.size < 5242880) { // 5mb
	xhttp.onreadystatechange = function (){
		if (xhttp.readyState == 4 && xhttp.status==200) {
			var risultato = xhttp.responseText;
			var esito = risultato.search("ok");
			if(esito > 0){
				alert("Certificato aggiunto con successo!");
				
			} 
		}
	}
	
	//}
	//else
	//	alert("File troppo grande");
	
		xhttp.open("GET", "controlloCertificato.jsp?cm="+cm+"&all="+all.value+"&data="+tipo.value+"&rila="+data.value,true);
		xhttp.send();

	}
