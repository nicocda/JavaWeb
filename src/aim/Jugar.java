package aim;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.bcel.internal.generic.CPInstruction;

import entidades.Partida;
import negocio.ControladorPartida;
/**
 * Servlet implementation class Jugar
 */
@WebServlet("/Jugar")
public class Jugar extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ControladorPartida cp = new ControladorPartida();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Jugar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		int dni1 = (int) session.getAttribute("dni");
		int dni2;
		try
		{	
			if (request.getParameter("dni2") != "")
			{
				dni2 = Integer.parseInt(request.getParameter("dni2"));
			}
			else 
			{
				dni2 = Integer.parseInt(request.getParameter("comboBox"));
			}
			if (cp.buscarJugador(dni2) != null)
			{
				Partida p = cp.cargarPartida(dni1, dni2);
				session.setAttribute("partida", p);
				request.getRequestDispatcher("panelJuego.jsp").forward(request, response);
			}
			else
			{
				session.setAttribute("mostrarAlerta2", "2");
				response.sendRedirect("SeleccionOponente.jsp");
			}
		}
		catch (NumberFormatException nfe)
		{
			session.setAttribute("mostrarAlerta2", "1");
			response.sendRedirect("SeleccionOponente.jsp");
		}
	}

}
