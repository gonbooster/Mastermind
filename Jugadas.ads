-- Author: Isabel
with Numeros, Resultados;
package Jugadas is
   type Jugada is private;

   -- Operación constructora: CREAR
   --------------------------------
   procedure Crear (O: Integer; N:Numeros.Numero; R: Resultados.Resultado; J: out Jugada);


   -- Operaciones visualizadoras
   --------------------------------
   function Muertos (J: Jugada) return Integer;

   function Heridos (J: Jugada) return Integer;

   procedure Mostrar (J: Jugada);


   -- Operaciones de comparación
   --------------------------------
   function "<" (J1, J2: Jugada) return Boolean;



private
   type Jugada is record
      orden: Integer;
      intento: Numeros.Numero;
      resultado: Resultados.Resultado;
   end record;

end Jugadas;
