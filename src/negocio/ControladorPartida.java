package negocio;
import java.util.ArrayList;

import datos.*;
import entidades.Jugador;
import entidades.Partida;
import entidades.Trebejo;

public class ControladorPartida 
	{
		private CatalogoPartida cp = new CatalogoPartida();
		private CatalogoTrebejos ct = new CatalogoTrebejos();
		private CatalogoJugadores cj = new CatalogoJugadores();
	
	
		public Partida cargarPartida(int dni1, int dni2) 
		{
			if (!cp.existePartida(dni1, dni2))
			//Si la partida no existe la creo nueva (con los valores predeterminado de las piezas)y la agrego en la BD
			{
				if ((cj.buscarJugador(dni2) != null) && (dni1 != dni2))
					//verifico que exista el segundo jugador, si quiero crear un new game
					//y que no ponga dos jugadores iguales
				{
				cp.agregarPartida(dni1, dni2);
				ct.addTrebejos(dni1, dni2);
				}
				else {
					return null;
				}
			}
			//ahora busco en la base de datos la partida que quiero y la retorno
			Partida p = cp.buscarUnaPartida(dni1, dni2);
			return p;
	
		}

	public ArrayList<Jugador> buscarOponentes(int dni)
	{
		ArrayList<Jugador> listaOponentes = cp.buscarOponente(dni);
		return(listaOponentes);
	}
	
	
	public int mover(int finalPosX, int finalPosY, Trebejo treb, Partida part){
		boolean encontroTrebejo = false;
		for  (Trebejo t : part.getFichas())
		{
			if(t.getPosX()== finalPosX && t.getPosY()==finalPosY)
			{
					encontroTrebejo = true;
					if(treb.movimientoPermitido(finalPosX, finalPosY, true))
					{
						if (t.getColor() == treb.getColor())
						{
							//No puedo mover
							return 1 ;
						}
						//Como
						else 
						{
							part.getFichas().remove(t);
							ct.borrarTrebejos(t);
							ct.actualizarTrebejos(finalPosX, finalPosY, treb);
							int pos= this.buscarPosicion(treb,part);
							part.getFichas().get(pos).setPosX(finalPosX);
							part.getFichas().get(pos).setPosY(finalPosY);
							if(t.getTipo() == 'K')
							{
								cp.eliminarPartida(part);
								return 5;
							}
							//Cambio el turno
							part.setTurno(!part.getTurno());
							cp.actualizarPartida(part.getBlanco().getDni(), part.getNegro().getDni(), part.getTurno());
							return 2;
						}
					}
					//Si el movimiento no es permitido
					else 
						return 4;
			}
		};
			if(!encontroTrebejo)
			{	
				if(treb.movimientoPermitido(finalPosX, finalPosY, false))
				{
					int pos= this.buscarPosicion(treb,part);
					ct.actualizarTrebejos(finalPosX, finalPosY, treb);
					treb.setPosX(finalPosX);
					treb.setPosY(finalPosY);
					part.getFichas().set(pos, treb);
					part.setTurno(!part.getTurno());
					cp.actualizarPartida(part.getBlanco().getDni(), part.getNegro().getDni(), part.getTurno());
					return 3 ;
				}
				else
					return 4;
			}
			else return 0;
		}

	private int buscarPosicion(Trebejo treb, Partida part) {
		int i= 0;
		for(Trebejo t : part.getFichas())
		{
			if(t.getPosX()==treb.getPosX() && t.getPosY() == treb.getPosY())
			{
				i=part.getFichas().indexOf(t);
			}
		}
		return i;
	}

	public Trebejo buscarTrebejoPorClavePrimaria(int posIX, int posIY, int dni, int dni2) 
	{
		return CatalogoTrebejos.getInstance().buscarTrebejoPorClavePrimaria(posIX, posIY, dni, dni2);
	}
	
	public Jugador buscarJugador(int dni)
	{
		return cj.buscarJugador(dni);
	}
		
}



