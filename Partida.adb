
with Ada.Text_IO; use Ada.Text_IO; with ada.Integer_Text_IO;
with Generador_Numeros; use Generador_Numeros;
with Numeros; use Numeros;
with Resultados; use Resultados;
package body Partida is


    PROCEDURE jugadas_Copiar (C1: OUT jugadas.jugada; C2: IN jugadas.jugada) is
      BEGIN
         c1:=c2;
   END jugadas_Copiar;

   Procedure empezar( num_partida:in integer; una_partida: out partida) is
      Cifras_Num_Ocult : Integer;

   Begin
      ada.text_io.put_line("Partida: " & Integer'Image(num_partida));
      Ada.Text_Io.Put("Con cuantas cifras quieres jugar? (4, 5 o 6): ");
      Ada.Integer_Text_IO.Get(Cifras_Num_Ocult);
      IF Cifras_Num_Ocult >6 THEN
         Cifras_Num_Ocult:=7;
      end if;
     Generador_numeros.empezar(cifras_num_ocult);

      Put_line(" *** Dispones de" & Integer'Image(4*cifras_num_ocult) & " intentos (Jugadas).");
      new_line;
      Lista_jugadas.Crear_Vacia(una_partida.Lista);
      una_partida.n_partida:=num_partida;
      una_partida.exito:=false;
      una_partida.n_cifras:=cifras_num_ocult;
      una_partida.num_oculto:=generador_numeros.num_oculto;
      una_partida.max_intentos:=4*cifras_num_ocult;
      una_partida.n_intentos:=0;
      new_line;

     end empezar;

   Procedure Realizar (Una_partida: in out partida) is
      continuar: character:= 's';
      x: String(1..Una_partida.n_cifras);
      num: Numero;
      Result: Resultado;
      Jugada_Creada:Jugadas.Jugada;
      aux: boolean:=false;
   begin

      while continuar = 's' AND not Una_partida.exito AND Una_partida.n_intentos < Una_partida.max_intentos  loop
         begin
          Una_partida.n_intentos:= Una_partida.n_intentos+1;
         Put_line("Jugada" & Integer'Image(Una_partida.n_intentos));
            Put_Line("Inserta un numero: ");
            Ada.Text_IO.Get(X);
            Skip_Line;
         numeros.Crear(X,num);
         Numeros.Comparar(num, Generador_Numeros.Num_Oculto,Result);
         Put(" Numero insertado: ");
         numeros.imprimir(num);
         New_Line;
         Put_line(" Resultado: ");
         resultados.Imprimir(Result);
            New_Line;
         if resultados.Muertos(Result) = una_partida.n_cifras   then
          Una_partida.exito := true;
         end if;
            Jugadas.Crear(una_partida.n_intentos,num,result,jugada_creada);
            Lista_jugadas.Colocar(una_partida.Lista,jugada_creada);

            IF NOT Ganada(Una_Partida) THEN

               Put(" Deseas continuar con la partida? s/n: ");
               while aux=false loop
                  Ada.Text_IO.Get(Continuar);
                  skip_line;
               IF Continuar/='s' and Continuar/='n' THEN
                     Put("No has introducido corractamente el codigo, pulsa 's' o 'n'");
                     new_line;
                  ELSE
                    aux:=true;
               END IF;
               END LOOP;
               aux:=false;

               new_line;
            end if;

             exception
            when longitud_inadecuada=>put_line("La longitud no es correcta");
            when numero_con_cifras_repetidas=>put_line("No se pueden usar cifras repetidas");
            WHEN Numero_String_Inadecuado=>Put_Line("El valor que has introducido no es numero");
            WHEN OTHERS => Put("No has elegido un valor, el valor sera 4 ahora");

            end;
            end loop;


   end Realizar;

   function Intentos( Una_partida:  in Partida) return integer is
   begin
      return Una_partida.N_Intentos;
   end Intentos;

   function Ganada(P: in Partida) return boolean is
   begin
      return P.Exito;
   end Ganada;

   procedure Mostrar(La_partida: in Partida) is
      registro: character:='n';
      I: integer := Lista_jugadas.Num_Elementos(La_partida.Lista);
      Jugada_Mostrar: Jugadas.Jugada;
      aux:boolean:=false;
   begin
      new_line;
      Put_line("********");
      new_line;
      Put("Partida numero" & Integer'image(La_partida.n_partida) & " de" & Integer'image(La_partida.n_cifras) & " cifras." );
      Put(" El numero oculto es ");
      numeros.Imprimir(La_partida.Num_oculto);
      Put_line(".");
      if Ganada(La_partida) then
         Put_line("Has utilizado" & Integer'image(intentos(La_partida)) & " de" & Integer'image(La_partida.max_intentos) & " intentos. Enhorabuena, veo que al menos sirves para algo." );
         New_Line;
         new_line;
      else
         Put_line("Has utilizado" & Integer'image(intentos(La_partida)) & " de" & Integer'image(La_partida.max_intentos) & " intentos. Deja los jueguitos y haz algo productivo!!!!" );
         new_line;
         new_line;
         Put(" Deseas ver el registro de partidas? s/n: ");
         while aux=false loop
            Ada.Text_IO.Get(registro);
            Skip_Line;
            IF Registro/='s' AND Registro/='n' THEN
               Put("El caracter  introducido no es valido, introduce 's' o 'n'");
               NEW_Line;
            ELSE
               Aux:=True;
            END IF;
         end loop;
         new_line;
         if registro = 's' then
            Put_Line("Jugadas efectuadas en la partida" & Integer'image(La_partida.n_partida) & ".");
            new_line;
            while I >0  loop
               Lista_jugadas.Elemento_en_posicion(La_partida.Lista,I,jugada_mostrar);
               jugadas.Mostrar(jugada_mostrar);
               I:= I-1;
            end loop;
         end if;
      end if;
   end Mostrar;

   procedure Copiar( P2: out Partida;  P1: in Partida) is
   begin
      Lista_jugadas.Crear_Vacia(P2.Lista);
      p2.exito:=p1.exito;
      p2.n_intentos:=p1.n_intentos;
      p2.n_partida:=p1.n_partida;
      p2.Num_oculto:=p1.Num_oculto;
      p2.n_cifras:=p1.n_cifras;
      p2.max_intentos:=p1.max_intentos;
      Lista_jugadas.Copiar(p2.Lista,p1.Lista);
    end Copiar;

   function ">" (P1, P2: Partida) return Boolean is
   begin
      return P1.n_intentos > P2.n_intentos;
   end ">";

   function "="( P1: in Partida;  P2: in Partida) return boolean is
   begin

      if P1.n_partida = P2.n_partida then
         return true;
      else
         return false;
      end if;
   END "=";


   end Partida;