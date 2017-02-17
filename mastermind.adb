with Sesion_Juego;
with Ada.Text_IO;
procedure Mastermind is

begin

   Ada.Text_Io.Put_Line("==================================================================");
   Ada.Text_Io.Put_Line("=============================MASTERMIND===========================");
   Ada.Text_Io.Put_Line("            En esta sesion puedes jugar hasta 20 partidas          ");
   Ada.Text_Io.Put_Line("                         ¡¡¡¡¡  SUERTE  !!!!!             ");
   Ada.Text_Io.Put_Line("==================================================================");
   Ada.Text_Io.Put_Line("==================================================================");

   Sesion_Juego.Empezar;

   Sesion_Juego.Realizar;

   Sesion_Juego.Mostrar_Partidas;

end Mastermind;
