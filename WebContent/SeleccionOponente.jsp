<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.ArrayList"
    import="entidades.Jugador" %>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Panel Inicial</title>
  <link rel="stylesheet" href="css/SeleccionOponente.css">
  
  <script type="text/javascript">
	 var Msg = '<%=session.getAttribute("mostrarAlerta2")%>';
	  	if (Msg == 1) 
	  	{
			function alertName()
			{
				alert("Ingrese un nùmero!");
	  		}
	  	}
	  	if (Msg == 2)
	  	{
	  		function alertName()
	  		{
	  			alert("El oponente no existe!");
	  		}
	  	}
	  	if (Msg == 3)
	  	{
	  		function alertName()
	  		{
	  			alert("No se puede seleccionar uno mismo como oponente");
	  		}
	  	}
  </script>
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body>
  <section>
    <div>
      <h1>Bienvenido Jugador N° <%= session.getAttribute("dni") %></h1>
      <form action="Jugar" method="post">

        <% ArrayList<Jugador> jugadores = (ArrayList<Jugador>) session.getAttribute("oponentes"); 
       		%>
          
            <label for="comboBox">Seleccione Oponente:</label>
            <select name="comboBox" id="comboBox">
            	<% 
            	for(int i=0; i< jugadores.size(); i++)
            	{           	
            	%>
            		<option value="<%= jugadores.get(i).getDni()%>"><%= jugadores.get(i).getDni()%> </option>           		
            	<%
            	}
            	%>
            </select>
       <label for="dni2">Ingrese nuevo oponente:</label> 
       <input type="text" name="dni2" id="dni2" value="" placeholder="Ingrese DNI Oponente">
       <input type="submit" name="jugar" id="jugar" value="Jugar">
      </form>
    </div>
  </section>

  <script type="text/javascript"> window.onload = alertName; </script>