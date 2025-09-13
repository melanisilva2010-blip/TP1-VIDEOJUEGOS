Jugador jugador;
Enemigo enemigo;
boolean gameOver = false;

void setup() {
  size(600, 400);
  jugador = new Jugador(275, 350);
  enemigo = new Enemigo(random(width), -40);
}

void draw() {
  background(30);

  if (!gameOver) {
    jugador.mover();
    jugador.mostrar();

    enemigo.mover();
    enemigo.mostrar();

    if (enemigo.chocaCon(jugador)) {
      gameOver = true;
    }
  } else {
    fill(255, 0, 0);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("GAME OVER", width / 2, height / 2);
  }
}

void keyPressed() {
  jugador.teclaPresionada(keyCode);
}

void keyReleased() {
  jugador.teclaSoltada(keyCode);
}
