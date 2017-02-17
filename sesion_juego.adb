with Partida; use Partida;
with Ada.Calendar;use Ada.Calendar;
WITH Ada.Text_IO; USE Ada.Text_IO;
with Listas_Estaticas;
package body Sesion_Juego is
 package package_lista_partidas is new Listas_estaticas(26,Partida.Partida,partida.">",partida.copiar, partida."=");
   type Sesion_de_juego is record
      Num_Partidas: Integer;
      Hora_Comienzo:Ada.Calendar.Time;
      Hora_Final:Ada.Calendar.Time;
      Num_Exitos: Integer;
      lista_partidas: package_lista_partidas.Lista;
   end record;

   Sesion:Sesion_de_juego; -- objeto encapsulado


   procedure Empezar is
   begin
      package_lista_partidas.Crear_Vacia(Sesion.lista_partidas);
      Sesion.Hora_comienzo:=clock;
      Sesion.Num_Partidas:=0;
      Sesion.Num_Exitos:=0;
    end Empezar;

   procedure Realizar is
      continuar: character:='s';
      La_Partida:Partida.Partida;
      aux: boolean:=false;
   begin
      while continuar = 's' and then Sesion.Num_Partidas <= N_Max_Partidas loop
         Sesion.Num_Partidas:=Sesion.Num_Partidas+1;
         partida.Empezar(Sesion.Num_Partidas,La_partida);
         partida.Realizar(La_partida);
         partida.mostrar(La_partida);

         package_lista_partidas.Colocar(Sesion.lista_partidas,La_partida);

         if Ganada(La_partida) then
            Sesion.Num_Exitos:=Sesion.Num_Exitos+1;
         end if;
         New_Line;

         Put(" Deseas jugar otra partida? s/n: ");
         
         WHILE Aux=False LOOP
	  Ada.Text_IO.Get(Continuar);
          skip_line;
            IF Continuar/='s' AND Continuar/='n' THEN
               Put("El caracter que has introducido no es valido, escribe 's' o 'n'");
               new_line;
            ELSE
               aux:=true;
               end if;
         end loop;

         new_line;
      end loop;
      Sesion.Hora_Final:=clock;
   end Realizar;

   procedure Mostrar_Partidas is
     element_partida: partida.Partida;
   begin
      Put_line("================================================================================");
      Put_line(" =====================  RESUMEN DE LA SESION DE JUEGO  ======================== ");
      Put_line("================================================================================");
      Put_Line("La partida ha durado" & duration'Image("-"(Sesion.Hora_Final,Sesion.Hora_Comienzo)) & " segundos.");
      Put_Line("Has jugado un total de" & Integer'Image(Sesion.Num_Partidas) & " partidas.");
      Put_Line("Has fallado" & Integer'Image(Sesion.Num_Partidas-Sesion.Num_Exitos) & " partidas.");
      new_line;
      Put_line("Lista de partidas ganadas (ordenadas por el numero de intentos): ");
      new_line;
      if Sesion.Num_Exitos /= 0 then
         for I in 1..Sesion.Num_Partidas loop
            begin
            package_lista_partidas.Elemento_en_posicion(Sesion.lista_partidas,I,element_partida);
         if partida.Ganada(element_partida) then
            partida.mostrar(element_partida);
         end if;
            exception
               when package_lista_partidas.Elemento_inexistente_en_posicion => null;
            end;
         end loop;
      else
         Put_line("No has ganado ninguna partida...dedicate a otra cosa!!!");
      end if;
     end Mostrar_Partidas;

end Sesion_Juego;


