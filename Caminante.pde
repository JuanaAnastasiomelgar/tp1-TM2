class Caminante {
  float x,y;
  float velx, vely;
  color col;
  
  Caminante (float cx, float cy, float vx, float vy){
    x=cx;
    y=cy;
    velx=vx;
    vely=vy;
    col = color (random (255), random (255), random (255));
  }
  

  
// metodo que se dibuja y se actualiza la posicion
  void dibujar(){
    x += velx;
    y +=vely;
    noStroke();
    fill(col, 50);
    rect (x,y,10,10);
  
  }



}
