function visualizzagare(lega) {
	  var xhttp; 
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (xhttp.readyState == 4 && xhttp.status == 200) {
	    document.getElementById("bo").innerHTML = xhttp.responseText;
	    /*document.getElementById("data").innerHTML = xhttp.responseText;
	    document.getElementById("indirizzo").innerHTML = xhttp.responseText;*/
	    /*document.getElementById("arbitro").innerHTML = xhttp.responseText;
	    document.getElementById("osservatore").innerHTML = xhttp.responseText;
	    */
	    		 }
	  };
	  xhttp.open("GET", "controlloMostraGare.jsp?lega=" + lega, true);
	  xhttp.send();
	  
	  
	}
