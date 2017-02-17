-- Author: Isabel
with Ada.Numerics.Discrete_Random, Ada.Text_IO;
package body Generador_Numeros is

   subtype Cifra is Natural range 0 .. 9;
   package Cifra_Random is new Ada.Numerics.Discrete_Random(Cifra);
   Semilla : Cifra_Random.Generator;

   Numero_Oculto: Numeros.Numero;

   function Num_Oculto return Numeros.Numero is
   begin
      return Numero_Oculto;
   end Num_Oculto;

   procedure Empezar(N_Cifras: in out Integer) is
      Num: String(1..N_Cifras);
      N: Cifra;
      Repetir : Boolean := True;
   begin

      Cifra_Random.Reset(Semilla);

      -- Trata las excepciones Numero_string_inadecuado y
      -- Numero_con_cifras_repetidas como parte de un ciclo indefinido
      -- controlado por la variable booleana Repetir.
      -- El ciclo finaliza cuando el número oculto generado es válido

      while Repetir loop
        begin
            for I in 1..N_Cifras loop
               N := Cifra_Random.Random(Semilla);
               Num(I) := Integer'Image(N)(2);
            end loop;
            Numeros.Crear(Num, Numero_oculto);
            Repetir := False;
         exception
            when Numeros.Numero_string_inadecuado => null;
            when Numeros.Numero_con_cifras_repetidas => null;
         end;
      end loop;
      -- Ada.Text_IO.Put_line(" *** Numero generado: " & Num);

   --  Trata la excepción Longitud_Inadecuada generado un mensaje para el
   --  usuario y generando un número aleatorio de 4 cifras.

      exception
     when Numeros.Longitud_Inadecuada =>
         Ada.Text_IO.Put_line("Numero demasiado corto o demasiado largo: tendra 4 cifras.");
         N_Cifras := 4;
         Empezar(N_Cifras);
      when others => Ada.Text_IO.Put_line("Se eleva excepcion");
   end Empezar;


   procedure Comparar_oculto (N: Numeros.Numero; Resul: out Resultados.Resultado) is
   begin
      Numeros.Comparar(Numero_Oculto, N, Resul);
   end Comparar_oculto;

end Generador_Numeros;
