-- Author: Isabel
with Ada.Text_IO, Ada.Integer_text_IO;
package body Jugadas is

   procedure Crear (O: in Integer; N: in Numeros.Numero; R: in Resultados.Resultado; J: out Jugada) is
   begin
      J.Orden:= O;
      J.Intento:= N;
      J.Resultado:= R;
   end Crear ;

   function Muertos (J: Jugada) return Integer is
   begin
      return Resultados.Muertos(J.Resultado);
   end Muertos ;

   function Heridos (J: Jugada) return Integer is
   begin
      return Resultados.Heridos(J.Resultado);
   end Heridos ;

   function "<" (J1, J2: Jugada) return Boolean is
   begin
      return J1.orden < J2.orden;
   end "<";

   procedure Mostrar (J: Jugada) is

   begin
     Ada.Text_IO.Put("*** Jugada ");
     Ada.Integer_text_IO.Put(J.Orden, 1);
      Ada.Text_IO.Put("    ");
      Numeros.Imprimir(J.Intento);
      Ada.Text_IO.Put(", resultado: ");
      Ada.Text_IO.Put("**********  ");
      Resultados.Imprimir(J.Resultado);
      Ada.Text_IO.New_Line;
   END Mostrar ;

end Jugadas;
