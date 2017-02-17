-- Author: Isabel
with Ada.Text_IO, Ada.Integer_Text_IO;
package body Resultados is

    procedure Crear(M, H: Integer; R: out Resultado) is
    begin
        R := (M,H);
    end Crear;

    function Muertos (R: Resultado) return Integer is
    begin
        return R.Num_Muertos;
    end Muertos ;

    function Heridos (R: Resultado) return Integer is
    begin
        return R.Num_Heridos;
    end Heridos ;

    procedure Imprimir (R: Resultado) is
    begin
        Ada.Text_IO.Put(" ");
        Ada.Integer_Text_IO.Put(R.Num_Muertos, 1);
        Ada.Text_IO.Put(" muertos - ");
        Ada.Integer_Text_IO.Put(R.Num_Heridos, 1);
        Ada.Text_IO.Put(" heridos.");
    end Imprimir;

end Resultados;
