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
  <link rel="stylesheet" href="css/estiloEjemploLogin.css">
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body>
  <section class="container">
    <div class="login">
      <h1>Bienvenido Jugador N° <%= session.getAttribute("dni") %></h1>
      <form action="Jugar" method="post">
        
        <% ArrayList<Jugador> jugadores = (ArrayList<Jugador>) session.getAttribute("oponentes"); 
       		%>
        <table>
        <tr>
        <td>Seleccione Oponente: </td> 
        <td>
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
        </td>
        </tr>
       <tr>
       <td> 
        </br> 
       <input type="text" name="dni2" id="dni2" value="" placeholder="O Ingrese DNI Oponente">
       </td>
       <td align="center">
        </br> 
        <input type="submit" name="jugar" id="jugar" value="Jugar">
        </td>
        </tr>
        </table>
      </form>
    </div>
  </section>

