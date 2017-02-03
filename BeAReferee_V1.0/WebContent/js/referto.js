function inviaR(cm){
	var  xhttp;
	var gara = document.getElementById("gara");
	var lega= document.getElementById("lega");
	var luogo= document.getElementById("luogo");
	var golcasa= document.getElementById("casa");
	var golfuor= document.getElementById("ospite");
	var soscasa= document.getElementById("soscasa");
	var sosfuori= document.getElementById("sosfuori");
	var ammcasa= document.getElementById("ammcasa");
	var ammfuori= document.getElementById("ammfuori");
	var espcasa= document.getElementById("espcasa");
	var espfuori= document.getElementById("espfuori");
	
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function (){
		if (xhttp.readyState == 4 && xhttp.status==200) {
			var risultato = xhttp.responseText;
			var esito = risultato.search("ok");
			if(esito > 0){
				alert("Referto salvato!");
				location.reload();
			} 
		}
	};
		xhttp.open("GET", "controlloInserisciReferto.jsp?cm="+cm+"&lega="+lega.value+"&gara="+ gara.value+"&luogo="+luogo.value+"&golcasa="+golcasa.value+"&golfuor="+golfuor.value+"&soscasa="+soscasa.value+"&sosfuori="+sosfuori.value+"&ammcasa="+ammcasa.value+"&ammfuori="+ammfuori.value+"&espcasa="+espcasa.value+"&espfuori="+espfuori.value,true);
		xhttp.send();

	}
/**
 * 
 */