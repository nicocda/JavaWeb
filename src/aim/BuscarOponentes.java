package aim;

import javax.servlet.http.HttpServlet;
import negocio.ControladorPartida;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Jugador;

@WebServlet("/buscarOp")
public class BuscarOponentes extends HttpServlet {

	private ControladorPartida cp = new ControladorPartida();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession(true);
		try
		{
			int dni = Integer.parseInt(request.getParameter("dni"));
			ArrayList<Jugador> jugadores= new ArrayList<Jugador>();
			jugadores=cp.buscarOponentes(dni);
			System.out.println("todo bien");
			session.setAttribute("dni", dni);
			session.setAttribute("oponentes", jugadores);
			request.getRequestDispatcher("SeleccionOponente.jsp").forward(request, response);
		}
		catch(NumberFormatException nfe)
		{
			session.setAttribute("mostrarAlerta", "Yes");
			response.sendRedirect("formularioInicio.jsp");
		}
	}
	
}

