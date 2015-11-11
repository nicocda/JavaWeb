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
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		Partida p = (Partida) session.getAttribute("partida");
		Trebejo t = (Trebejo) request.getAttribute("fichasBlancas");
		int posfx = Integer.parseInt(request.getParameter("posfx"));
		int posfy  = Integer.parseInt(request.getParameter("posfy"));
		int opc = cp.mover(posfx, posfy, t, p);
	}

}
