<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Login - Be a Referee</title>
<!-- CSS  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
<link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
<link href="css/login.css" type="text/css" rel="stylesheet"/>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
<div id="demo" class="container"> <br>
<main>
    <center>
      
      <div class="section"></div>

      <div class="section"></div>

      <div class="container" style="opacity:0.8">
        <div class="z-depth-1 grey lighten-4 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">

          <form class="col s12" method="post" action="controlloLogin.jsp">
            <div class='row'>
              <div class='col s12'>
              </div>
            </div>
  <h5 class="indigo-text">Entra nel sistema</h5>
            <div class='row'>
              <div class='input-field col s12'>
                <input class='validate' type='text' name='cm' id='email' required />
                <label for='email'>Codice Meccanografico</label>
              </div>
            </div>

            <div class='row'>
              <div class='input-field col s12'>
                <input class='validate' type='password' name='password' id='password' required/>
                <label for='password'>Password</label>
              </div>
              <label style='float: right;'>
								<a class='pink-text' href='#!'><b>Password dimenticata?</b></a>
							</label>
            </div>
            
<div class='row'>
	
    <p>
      <input name="log" type="radio" id="pres" value="presidente" checked="checked"/>
      <label for="pres">Presidente</label>
    </p>
    <p>
      <input name="log" type="radio" id="arbi" value="arbitro"/>
      <label for="arbi">Arbitro</label>
    </p>
    <p>
      <input name="log" type="radio" id="osse" value="osservatore"/>
      <label for="osse">Osservatore</label>
    </p>
	
</div>

            <br />
            <center>
              <div class='row'>
                <button type='submit' name='btn_login' class='col s12 btn btn-large waves-effect indigo'>Login</button>
              </div>
            </center>
          </form>
        </div>
      </div>
      
    </center>

    <div class="section"></div>
    <div class="section"></div>
  </main>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
  </div>
  
<div class="container">

  <div class="section">




      <!--   Icon Section   -->
      <div class="row">
        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center light-blue-text"><i class="material-icons">flash_on</i></h2>
            <h5 class="center">Velocità di navigazione</h5>

            <p class="light">Noi del team di sviluppo "The Whistleblowers" abbiamo dato priorità massima alla velocità di esecuzione di ogni funzione del sito, preservando però la sicurezza ed il completo funzionamento della Web-App</p>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center light-blue-text"><i class="material-icons">group</i></h2>
            <h5 class="center">Pensato per l'utente</h5>

            <p class="light">Utilizzando gli elementi e i principi del Material Design, abbiamo creato una grafica interattiva che permette un feedback piacevole all'utente.</p>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center light-blue-text"><i class="material-icons">settings</i></h2>
            <h5 class="center">Di facile utilizzo</h5>

            <p class="light">Abbiamo presentato una documentazione dettagliata che spiega le funzionalità del sistema e permette un facile utilizzo dopo la lettura e la conoscenza di esso</p>
          </div>
        </div>
      </div>

    </div>
    <br><br>

    <div class="section">

    </div>
  </div>
<footer class="page-footer orange">
    
      <div class="row">
        <div class="col l3 s12">
          <h5 class="white-text">Be a Referee</h5>
          <p class="grey-text text-lighten-4">Sei un arbitro, osservatore o presidente di una sezione dell'Associazione Italiana Arbitri? Gestire la propria vita sezionale o la sezione della quale si è gestore non è mai stato così facile! Entra nel sistema!</p>
        </div>
        <div class="col l3 s12">
          <h5 class="white-text">Affiliati</h5>
          <ul>
            <li><a class="white-text" href="http://www.aia-figc.it">Associazione Italiana Arbitri</a></li>
            <li><a class="white-text" href="http://www.figc.it">Federazione Italiana Giuoco Calcio</a></li></li>
            <li><a class="white-text" href="http://www.aia-figc.it/download/regolamenti/reg_2016.pdf">Regolamento del Giuoco del Calcio</a></li>
          </ul>
        </div>
      </div>
    <div class="footer-copyright">
      Made by <a class="orange-text text-lighten-3">The Whistleblowers</a>
      </div>
  </footer>
  </body>
  </html>
 


  <!--  Scripts-->
  <script src="js/jquery-1.10.2.js"></script>
  <script src="js/materialize.js"></script>
<script src="js/jquery.backstretch.js"></script>
  <script> 
  $('#demo').backstretch('img/sfondo.jpg');
  </script>

  
