<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="entidades.Partida"
    import="entidades.Trebejo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Ajedrez Match 2.0</title>
		<link rel="stylesheet" href="css/SeleccionOponente.css">
	</head>
	<body>
		<% Partida p = (Partida) session.getAttribute("partida"); %>
		<form class = form2 action="Mover" method="post">
			<% if(p.getBlanco().getDni() == (Integer)session.getAttribute("dni")){%>
				<table>
				<tr>
					<td>
					<label class = "jugadoresNombres" = for = "tabla1">Fichas de <%= p.getBlanco().getNombre() %></label>
					<select id = "tabla1" class = "tabla" name="fichasBlancas" size="16" <%if(p.getTurno()){%>disabled<%}%>>
						<%for(Trebejo t : p.getFichas())
						{ %>
						<%if (t.getColor()){%>
						<option value="<%= t %>"> <%= t %> </option>
						<%} %>
						<%} %>
					</select>
					</td>


					<td>
					<label class = "jugadoresNombres" for = "tabla2">Fichas de <%= p.getNegro().getNombre() %></label>
					<select id = "tabla2" class = "tabla" name="fichasNegras" size="16" disabled>
						<%for(Trebejo t : p.getFichas())
						{ %>
						<%if (!t.getColor()) {%>
						<option value="<%= t %>"> <%= t %> </option>
						<%} %>
						<%} %>
					</select>
					</td>
				</tr>
				</table>
					<%}else{%>
				
				<table>
				<tr>
					<td>
					<label class = "jugadoresNombres" for = "tabla3">Fichas de <%= p.getNegro().getNombre() %></label>
					<select id = "tabla3" class = "tabla" name="fichasBlancas" size="16" <%if(!p.getTurno()){%>disabled<%}%>>
						<%for(Trebejo t : p.getFichas())
						{ %>
						<%if (!t.getColor()){%>
						<option value="<%= t %>"> <%= t %> </option>
						<%} %>
						<%} %>
					</select>
					</td>
					
					<td>
					<label class = "jugadoresNombres" for = "tabla4">Fichas de <%= p.getBlanco().getNombre() %></label>
					<select id = "tabla4" class = "tabla" name="fichasNegras" size="16" disabled>
					<%for(Trebejo t : p.getFichas())
					{ %>
						<%if (t.getColor()) {%>
						<option value="<%= t %>"> <%= t %> </option>
						<%} %>
					<%} %>
					</select>
					</td>
				</tr>
				</table>
					<%}%>
				<label for=posfx>Posicion final: </label>
				<input type="text" name="posfx" id="posfx" value="" placeholder="Ingrese la posición X"> 
				<input type="text" name="posfy" id="posfy" value="" placeholder="Ingrese la posición Y">
				<input type="submit" value="Mover"> 
				<div class = "divVolver">
					<a href="/AjedrezWeb/formularioInicio.html">Volver</a>
				</div>
		</form>
	</body>
</html>