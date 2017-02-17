with Numeros, Resultados;
package Generador_Numeros is

   function Num_Oculto return Numeros.Numero;
   -- Operaci�n visualizadora

    procedure Empezar(N_Cifras: in out Integer);
   -- Entrada: numero de letras
   -- Efecto: genera de forma aleatoria el n�mero oculto con el n�meor de cifras indicado
   -- Excepciones: Trata las excepciones Numero_string_inadecuado 
   --              y Numero_con_cifras_repetidas hasta que el n�mero
   --              oculto generado es v�lido 
   --              Trata la excepci�n Longitud_Inadecuada generado un mensaje para el
   --              usuario y generando un n�mero aleatorio de 4 cifras.


   procedure Comparar_Oculto (N: Numeros.Numero; Resul: out Resultados.Resultado);
   -- Entrada: N, un n�mero
   -- Salida: obtiene el resultado de la comparaci�n entre N y el n�mero oculto de la MAE

end Generador_Numeros;