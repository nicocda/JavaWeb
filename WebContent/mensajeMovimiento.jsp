<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mensaje</title>
<link rel="stylesheet" href="css/SeleccionOponente.css">
</head>
<body>
	<section>
    	<div>
	    	<h1>Mensaje del sistema</h1>
			<form>	
				<label id = "mensaje">	<%=request.getAttribute("opc")%></label>
				<br>
					<div class = "divVolver">
						<a href="/AjedrezWeb/panelJuego.jsp"> Volver al panel de Juego</a>
					</div>
				<br>
					<div class = "divVolver">
						<a href="/AjedrezWeb/SeleccionOponente.jsp"> Volver a la Seleccion de Oponente</a>
					</div>
				<br>
				<div class = "divVolver">
					<a href="/AjedrezWeb/formularioInicio.html"> Volver al panel Inicial</a>
				</div>
			</form>
		</div>
	</section>
</body>
</html>