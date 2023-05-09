// interaccion con el mouse.
//sa{ales continuaas

//movimiento arriba, abajo, izq, derecha


Interaccion i;
ArrayList <Caminante> c;


void setup() {
  size(600, 600);
  i= new Interaccion();
  c = new ArrayList <Caminante>();
  background (255);
}

void draw() {
  i.actualizar();

  if (i.arriba) {
    println ("arriba");
    //para agregar a cada una de estas condicones un caminante
    c.add(new Caminante(random(width), height, 0 , -1));
  }
  if (i.abajo) {
    println ("abajo");
  }
  if (i.der) {
    println ("derecha");
  }
  if (i.izq) {
    println ("izquierda");
  }
  
  for (Caminante c : c){
  c.dibujar ();
  }
  
  
}
