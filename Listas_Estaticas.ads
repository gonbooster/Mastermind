-- Author: Isabel

generic
    MAX: Integer;
    type Componente is limited private;
    with function ">" (C1, C2: Componente) return boolean;
    with procedure Copiar (C1: out Componente; C2: in Componente);
    with function Igual (C1, C2: Componente) return Boolean;
package Listas_Estaticas is

    type Lista is limited private;      -- Tipo lista ordenada

        procedure Crear_Vacia (L : out Lista);
        -- Entrada:
        -- Salida: lista vacia L
        -- Efecto: crea la lista vacia L

        procedure Colocar (L : in out Lista; E : in Componente);
        -- Entrada: lista ordenada L
        --          elemento E
        -- Salida: lista L actualizada con el elemento E
        --         en su lugar correspondiente
        -- Efecto: Coloca el elemento E en L en funcion de la
        --         operacion de comparacion "<"
        -- Excepciones: Lista_Llena, si la memoria se termina

    procedure Elemento_en_posicion (L : in Lista; P: integer; E: out Componente);
    -- Entrada: lista ordenada L
    -- Salida: Primer elemento de la lista L
    -- Efecto: Obtiene el primer elemento de la lista L (si L no es vacia)
    -- Excepciones: Lista_Vacia, si L es vacia

    function Num_Elementos (L : in Lista) return Integer;
    -- Entrada: lista ordenada L
    -- Salida: Primer elemento de la lista L
    -- Efecto: Obtiene el primer elemento de la lista L (si L no es vacia)
    -- Excepciones: Lista_Vacia, si L es vacia


      function "=" (L1, L2 : in Lista) return Boolean;
      -- Entrada: listas ordenadas L1 y L2
      -- Salida: True, si L1 y L2 son iguales
      --         False, en caso contrario
      -- Efecto: Compara L1 y L2 elemento a elemento

        procedure Copiar (L1 : out Lista; L2 : in Lista);
        -- Entrada: lista ordenada L2
        -- Salida: lista ordenada L1 (copia de L2)
        -- Efecto: Copia L2 en L1 (crea una nueva lista)

        Lista_Vacia, Lista_Llena, Elemento_inexistente_en_posicion : exception;

private
        -- implementación estática

        type Contenido is array (1 .. MAX) of Componente;
        type Lista is record
            Info: Contenido;
            N_Elementos: Integer := 0;
        end record;
end Listas_Estaticas;
