function aggiungiAnagrafica(id){
	var xhttp; 
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			xhttp.open("GET", "areaPersonale_arbitro.jsp?arbitro="+id, true);
			xhttp.send();
		}
	}
	
}

