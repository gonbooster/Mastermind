WITH Jugadas;
with listas_estaticas;
with numeros;
package Partida is
   Type Partida is limited private;


   Procedure Empezar (num_partida: in integer; una_partida: out partida);

   Procedure Realizar (Una_partida: in out partida);

   Function Intentos (una_partida: in Partida) return integer;

   Function Ganada(p: in partida) return boolean;

   Procedure mostrar(la_partida: in partida);

   Procedure copiar (p2: out partida; p1: in partida);

   function ">" (P1, P2: Partida) return Boolean;

   function "=" (p1: in partida; p2: in partida) return boolean;





private

    PROCEDURE jugadas_Copiar (C1: OUT jugadas.jugada; C2: IN jugadas.jugada);

package Lista_jugadas is new Listas_Estaticas(24,jugadas.Jugada,jugadas."<",jugadas_Copiar,jugadas."=");

   TYPE Partida IS RECORD
      Lista: Lista_jugadas.Lista;
      n_partida: integer;
      exito: boolean;
      n_cifras: integer;
      Num_oculto:numeros.Numero;
      max_intentos:Integer;
      n_intentos:integer;
   end record;

   end partida;