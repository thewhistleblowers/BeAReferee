function designagar(part){
	var fun;
	var soldi= document.getElementById("soldi");
	var ar= document.getElementById("ar");
	var os= document.getElementById("os");
	fun = new XMLHttpRequest();
	fun.onreadystatechange = function (){
		if (fun.readyState == 4 && fun.status==200) {
			var risultat = fun.responseText;
			var esit = risultat.search("designazione ok");
			if(esit > 0){
				alert("Designazione avvenuta con successo!");
				location.reload();
			} 
		}
	}
	;
		fun.open("POST", "controlloDesignaGara.jsp?arb="+ ar.value+"&oss="+os.value+"&part="+part+"&soldi="+soldi.value,true);
		fun.send();

	}
