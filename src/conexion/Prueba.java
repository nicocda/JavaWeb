package conexion;

public class Prueba {

	public static void main(String[] args) 
	{
		String t = "Posicion: (1),(2)";
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
		System.out.println(posIX);
		System.out.println(posIY);
	}

}
