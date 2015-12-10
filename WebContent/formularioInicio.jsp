<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Login Form</title>
  <link rel="stylesheet" href="css/estiloEjemploLogin.css">
 
 <script type="text/javascript">
	 var Msg = '<%=session.getAttribute("mostrarAlerta")%>';
	  	if (Msg == "1") 
	  	{
			function alertName()
			{
				alert("Ingrese un nùmero!");
	  		}
	  	}
	  	if (Msg == "2")
	  	{
	  		function alertName()
	  		{
	  			alert("El jugador no existe!");
	  		}
	  	}
  </script>
  
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body onload="carga();">
  <section class="container">
    <div class="login">
      <h1>Selección de oponentes</h1>
      <form action="buscarOp" method="post" onsubmit="return valideDatos();">
        <p><input type="text" name="dni" id="dni" value="" placeholder="Ingrese su DNI"></p>
        <p class="submit"><input type="submit" name="aceptar" value="Buscar Oponente"></p>
       
      </form>
    </div>
  </section>
 
  <script type="text/javascript"> window.onload = alertName; </script>