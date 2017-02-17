With resultados;
package Numeros is

   type Numero is private;
   numero_string_inadecuado, numero_con_cifras_repetidas, longitud_inadecuada: exception;

   procedure Crear(S: in String; N: out Numero);

   procedure Comparar( N1: in Numero; N2: in Numero; R:out Resultados.resultado);

   procedure Imprimir(N: in Numero);

   function Longitud (N:in Numero) return integer;

   function "=" (N1: in Numero; N2: in Numero) return Boolean;


   PRIVATE
     type Numero is record
      Num:String(1..6);
      Longitud: Integer range 4..6;
   end record;

End numeros;


