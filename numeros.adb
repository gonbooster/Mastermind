
with Ada.Text_Io;
package body Numeros is

   procedure Crear (
         S : in     String;
         N :    out Numero) is
            num: integer;
   begin
      -------------------Excepciones crear----------------------
      begin
         Num:=Integer'Value(S);
      exception
         when others =>
            raise Numero_String_Inadecuado;



      -------------------Excepciones crear----------------------
      end;
      if (s'length<4) or (s'length>6) then
         raise Longitud_Inadecuada;
      end if;
      for I in 1..S'Last loop
         for J in 1..S'Last loop
            if S(I)=S(J) and I/=J then
               raise Numero_Con_Cifras_Repetidas;
            end if;
         end loop;
      end loop;

      N.Num(1..S'Length):=S;
      N.Longitud:=S'Length;




   end Crear;

   procedure Comparar (
         N1 : in     Numero;
         N2 : in     Numero;
         R  :    out Resultados.Resultado) is
      Heridos,
      Muertos : Integer := 0;

   begin
      begin
         if N1.Longitud/=N2.Longitud then
            raise Longitud_Inadecuada;
         end if;
      end;

      for I in 1..N1.Longitud loop
         for J in 1..N2.Longitud loop
            if N1.Num(I)=N2.Num(J) and   J=I  then
               Heridos:=Heridos+1;
            elsif N1.Num(I)=N2.Num(J) and   I/=J then
               Muertos:=Muertos +1;
            end if;

         end loop;
      end loop;
      Resultados.Crear(Heridos,Muertos,R);

   end Comparar;

   procedure Imprimir (
         N : in     Numero) is

   begin
      Ada.Text_Io.Put(N.Num(1..N.Longitud));

   end Imprimir;

   function Longitud (
         N : in     Numero)
     return Integer is
   begin
      return N.Longitud;

   end Longitud;


   function "=" (
         N1 : in     Numero;
         N2 : in     Numero)
     return Boolean is
   begin
      if N1.Num=N2.Num then
         return True;
      else
         return False;
      end if;

   end "=";

end Numeros;


