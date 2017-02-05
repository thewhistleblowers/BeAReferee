function prendi(lega) {
	  var xhttp; 
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (xhttp.readyState == 4 && xhttp.status == 200) {
	    document.getElementById("prez").value = xhttp.responseText;
	    
	    /*document.getElementById("data").innerHTML = xhttp.responseText;
	    document.getElementById("indirizzo").innerHTML = xhttp.responseText;*/
	    /*document.getElementById("arbitro").innerHTML = xhttp.responseText;
	    document.getElementById("osservatore").innerHTML = xhttp.responseText;
	    */
	    		 }
	  };
	  xhttp.open("GET", "certificato_presidente.jsp?ass=" + lega, true);
	  xhttp.send();
	  
	  
	}
