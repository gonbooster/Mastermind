with Numeros, Resultados;
package Generador_Numeros is

   function Num_Oculto return Numeros.Numero;
   -- Operación visualizadora

    procedure Empezar(N_Cifras: in out Integer);
   -- Entrada: numero de letras
   -- Efecto: genera de forma aleatoria el número oculto con el númeor de cifras indicado
   -- Excepciones: Trata las excepciones Numero_string_inadecuado 
   --              y Numero_con_cifras_repetidas hasta que el número
   --              oculto generado es válido 
   --              Trata la excepción Longitud_Inadecuada generado un mensaje para el
   --              usuario y generando un número aleatorio de 4 cifras.


   procedure Comparar_Oculto (N: Numeros.Numero; Resul: out Resultados.Resultado);
   -- Entrada: N, un número
   -- Salida: obtiene el resultado de la comparación entre N y el número oculto de la MAE

end Generador_Numeros;