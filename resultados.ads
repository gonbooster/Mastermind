package Resultados is

Type resultado is private;

   procedure Crear(M, H: Integer; R: out Resultado);
   --Entrada: Muertos y heridos.
   --Salida: R que es un registro con dos campos M y H.

   function Muertos (R: Resultado) return Integer;
   --Entrada: Los muertos del resultado.
   --Salida: Los muertos.

   function Heridos (R: Resultado) return Integer;
   --Entrada: Los heridos del resultado.
   --Salida: Los heridos.


   procedure Imprimir (R: Resultado);
   --Entrada: Un resultado.

   Private

   type Resultado is record
      Num_Muertos: integer;
      Num_Heridos: Integer;
   end record;

end resultados;