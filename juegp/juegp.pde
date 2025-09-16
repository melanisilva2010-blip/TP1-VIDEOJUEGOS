Jugador jugador;
ArrayList<Enemigo> enemigos; 
int estadoJuego = 0; 

void setup() {
  size(600, 400);
  jugador = new Jugador(width/2, height-40);

  enemigos = new ArrayList<Enemigo>();
  for (int i = 0; i < 5; i++) { 
    enemigos.add(new Enemigo(random(width), random(-400, 0)));
  }
}

void draw() {
  background(0);

  if (estadoJuego == 0) {
    // Pantalla de carga
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    text(" Mi Juego de Naves ", width/2, height/2 - 40);
    textSize(20);
    text("Presiona ESPACIO para comenzar", width/2, height/2 + 20);
  } 
  else if (estadoJuego == 1) {

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
    fill(255, 0, 0);
    textAlign(CENTER, CENTER);
    textSize(40);
    text("GAME OVER", width/2, height/2 - 40);
    textSize(20);
    fill(255);
    text("Presiona ESPACIO para reiniciar", width/2, height/2 + 20);
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
