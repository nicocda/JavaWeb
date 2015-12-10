<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="entidades.Partida"
    import="entidades.Trebejo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Ajedrez Match 2.0</title>
	</head>
	<body>
		<% Partida p = (Partida) session.getAttribute("partida"); %>
		<form action="Mover" method="post">
			<table>
				<tr>
				<% if(p.getBlanco().getDni() == (Integer)session.getAttribute("dni")){%>
					<td> <h3>Fichas de <%= p.getBlanco().getNombre() %></h3></td>
					<td> <h3>Fichas de <%= p.getNegro().getNombre() %></h3></td>
				</tr>
				<tr>
					<td>

						<select name="fichasBlancas" size="16" <%if(p.getTurno()){%>disabled<%}%>>
							<%for(Trebejo t : p.getFichas())
							{ %>
							<%if (t.getColor()){%>
							<option value="<%= t %>"> <%= t %> </option>
							<%} %>
							<%} %>
						</select>
						</td>
						<td>
						<select name="fichasNegras" size="16" disabled>
							<%for(Trebejo t : p.getFichas())
							{ %>
							<%if (!t.getColor()) {%>
							<option value="<%= t %>"> <%= t %> </option>
							<%} %>
							<%} %>
						</select>
					<%}else{%>
				<td> <h3>Fichas de <%= p.getNegro().getNombre() %></h3></td>
				<td> <h3>Fichas de <%= p.getBlanco().getNombre() %></h3></td>
					</tr>
					<tr>
						<td>
						<select name="fichasBlancas" size="16" <%if(!p.getTurno()){%>disabled<%}%>>
							<%for(Trebejo t : p.getFichas())
							{ %>
							<%if (!t.getColor()){%>
							<option value="<%= t %>"> <%= t %> </option>
							<%} %>
							<%} %>
						</select>
						</td>
						<td>
						<select name="fichasNegras" size="16" disabled>
							<%for(Trebejo t : p.getFichas())
							{ %>
							<%if (t.getColor()) {%>
							<option value="<%= t %>"> <%= t %> </option>
							<%} %>
							<%} %>
						</select>
					<%}%>
					</td>
				</tr>
				<tr>
					<td>Posicion final: <input type="text" name="posfx" id="posfx" value="" size="5"> <input type="text" name="posfy" id="posfy" value="" size="5"> </td>
					<td> <input type="submit" value="Mover">  <a href="/AjedrezWeb/formularioInicio.html">Volver</a></td>
				</tr>
			</table>
		</form>
	</body>
</html>