Jugador jugador;
ArrayList<Enemigo> enemigos; 
int estadoJuego = 0; 

PImage imgCarga, imgGameOver;

void setup() {
  size(600, 400);
  jugador = new Jugador(width/2, height-40);

  imgCarga = loadImage("Cubic Running.jpg");
  imgGameOver = loadImage("game over.jpg");

  enemigos = new ArrayList<Enemigo>();
  for (int i = 0; i < 5; i++) {
    enemigos.add(new Enemigo(random(width), random(-400, 0)));
  }
}

void draw() {
  background(0);

  if (estadoJuego == 0) {
    // Pantalla de carga 
    image(imgCarga, 0, 0, width, height);
  } 
  else if (estadoJuego == 1) {
    // Juego activo
    jugador.mover();
    jugador.mostrar();

    for (Enemigo e : enemigos) {
      e.mover();
      e.mostrar();

      if (e.chocaCon(jugador)) {
        estadoJuego = 2;
      }
    }
  } 
  else if (estadoJuego == 2) {
    // Game Over 
    image(imgGameOver, 0, 0, width, height);
  }
}

void keyPressed() {
  if (estadoJuego == 0 && key == ' ') {
    estadoJuego = 1;
  } else if (estadoJuego == 1) {
    jugador.teclaPresionada(keyCode);
  } else if (estadoJuego == 2 && key == ' ') {
    reiniciarJuego();
  }
}

void keyReleased() {
  if (estadoJuego == 1) {
    jugador.teclaSoltada(keyCode);
  }
}

void reiniciarJuego() {
  jugador = new Jugador(width/2, height-40);
  enemigos.clear();
  for (int i = 0; i < 5; i++) {
    enemigos.add(new Enemigo(random(width), random(-400, 0)));
  }
  estadoJuego = 1;
}
