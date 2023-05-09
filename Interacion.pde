/*gestos del mouse que duran un frame, por lo que
 hay que evaluar la condicion de que es algo que
 ocurre en un frame en particular y no que pasa
 constantemente en el tiempo.
 
 Para esto, hay que determinar este cambio de 
 estado, de algo que ocurría antes y algo que
 pasa ahora. 
 
 Para esto necesito dos variables de lo de antes
 y que pasa ahora.
 
 
 ---
 Luego tengo que saber la direccion de este barrido
 y tenemos que guardar la info de la direc en que 
 se esta moviendo.
 POr lo que listamos las 4 variables para guardar eso.
 
 */

class Interaccion {

  Dir_y_Vel mouse; //objeto dir y vel que me devulve la velocidad del mouse
  boolean seMovia; //Variable de lo que ocurria antes

  //variables direccion de movi del mouse.
  boolean arriba;
  boolean abajo;
  boolean izq;
  boolean der;



  Interaccion () {
    mouse = new Dir_y_Vel();
  }

  void actualizar() {
    mouse.calcularTodo (mouseX, mouseY);
    /*acá lo que quiero saber es que es lo que 
     está pasando en este momento*/

    //que pasa con el mouse en este frame
    boolean seMueveMouseFrame = false; //por defecto va a ser falso
    float sensibilidad = 35; //responde a la velocidad que el mouse tenga 
    
    //&& mouse.velocidad()<150 para que no haga saltos tan bruscos cuando muevo el mouse
    if (mouse.velocidad()>sensibilidad && mouse.velocidad()<150) {
      seMueveMouseFrame = true;
      //si se mueve mayor a la sensibilidad, se esta moviendo en este frame
    }

    //para que luego se pongan en falso otra vez 
    arriba = false;
    abajo = false;
    izq = false;
    der = false;


    //hago la comparación
    //si se mueve en este frame y en el anterior no, 
    if (seMueveMouseFrame && !seMovia) {
      //algo pasa acá
      println ("sweep");

      //determinamos arriba.
      /*como lo determinamos? 
       tenemos la variable, dirY y si es menor a - sens,
       tiene que ir hacia arriba y si no, false.
       */

      arriba = mouse.direccionY()<-sensibilidad?true:false;
      abajo = mouse.direccionY()>sensibilidad?true:false;
      izq = mouse.direccionX()>-sensibilidad?true:false;
      der = mouse.direccionX()>sensibilidad?true:false;

      /*estos valores tienen que volver a ser falsos
       despues de que los ponemos en verdadero
       por lo que antes de evaluar lo anteiror, todos
       los frames vamos a dar por sentado que son falsos
       */
    }

    //pasado todo esto, digo que se el mouse se movia en el anteior frame, ahora se mueve en este
    //así cuando yo actualice todo esto en el siguiente frame, dejo listo todo para el siguiente frame
    seMovia = seMueveMouseFrame;
  }
}
