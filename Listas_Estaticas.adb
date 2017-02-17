-- Author: Isabel

package body Listas_Estaticas is

    procedure Crear_Vacia (L : out Lista) is
    begin
        L.N_Elementos := 0;
    end Crear_Vacia ;

    procedure Colocar (L : in out Lista; E : in Componente) is
        I: Integer;
    begin
        if L.N_Elementos = MAX then raise Lista_LLena;
        end if;
        L.N_Elementos := L.N_Elementos + 1;
        I := 1;
        while I<L.N_elementos and not(E>L.Info(I))loop
            I := I+1;
        end loop;
        for J in reverse I+1 .. L.N_elementos loop
            Copiar(L.Info(J),L.Info(J-1));
        end loop;
        Copiar(L.Info(I), E);
    end Colocar ;


    procedure Elemento_en_posicion (L : in Lista; P: integer; E: out Componente) is
    begin
        if P>L.N_Elementos or P<1
        then raise Elemento_Inexistente_en_posicion;
        end if;
        Copiar (E, L.Info(P));
    end Elemento_en_posicion ;


    function Num_Elementos (L : in Lista) return Integer is

    begin
        return L.N_Elementos;
    end Num_Elementos ;


   function "=" (L1, L2 : in Lista) return Boolean is
      I: Positive := 1;
   begin
      if L1.N_elementos /= L1.N_elementos
      then return false;
      end if;
      while I<= L1.N_elementos loop
         if not Igual(L1.Info(I),L2.Info(I))
         then return false;
         end if;
         I := I + 1;
      end loop;
      return true;
   end "=";


    procedure Copiar (L1 : out Lista; L2 : in Lista) is
    begin
        L1.N_Elementos := L2.N_Elementos;
        for I in 1 .. L2.N_Elementos loop
            Copiar(L1.Info (I), L2.Info (I));
        end loop;
    end Copiar ;

end Listas_Estaticas;
