package aim;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Partida;
import entidades.Trebejo;
import negocio.ControladorPartida;

/**
 * Servlet implementation class Mover
 */
@WebServlet("/Mover")
public class Mover extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ControladorPartida cp = new ControladorPartida();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mover() {
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
		HttpSession session = request.getSession(false);
		Partida p = (Partida) session.getAttribute("partida");
		String  t = request.getParameter("fichasBlancas");
		int posfx = Integer.parseInt(request.getParameter("posfx"));
		int posfy  = Integer.parseInt(request.getParameter("posfy"));
		
		int posIX = 0, posIY = 0, contador = 0;
		for (int i = 0; i <t.length(); i++)
		{
			if (t.charAt(i) == '(')
			{
				contador++;
				if (contador == 1)
					posIX = Character.getNumericValue(t.charAt(i+1));
				if (contador == 2)
					posIY = Character.getNumericValue(t.charAt(i+1));
			}
		}
		Trebejo T = cp.buscarTrebejoPorClavePrimaria(posIX, posIY, p.getBlanco().getDni(), p.getNegro().getDni());

		int opc = cp.mover(posfx, posfy, T, p);

switch (opc)
				{
					case 1:
						request.setAttribute("opc", "Hay un trebejo aliado en esa posición");
						break;
					case 2:
						request.setAttribute("opc", "Has eliminado un trebejo enemigo");
						break;
					case 3:
						request.setAttribute("opc", "Se movió un trebejo exitosamente");
						break;
					case 4:
						request.setAttribute("opc", "Este trebejo no se puede mover así");
						break;
					case 5: 
						request.setAttribute("opc", "Ganaste la Partida");
						break;
					default:
						request.setAttribute("opc", "Error desconocido, consulte al operador");
						break;
				}
		request.getRequestDispatcher("mensajeMovimiento.jsp").forward(request, response);
	}

}
