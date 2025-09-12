Jugador jugador;
void setup() {
  size(600, 400);
  jugador = new Jugador(275, 350);
  enemigo = new Enemigo(random(width), -40);
}

void draw() {
  background(30);


void keyPressed() {
  jugador.teclaPresionada(keyCode);
}

void keyReleased() {
  jugador.teclaSoltada(keyCode);
}
