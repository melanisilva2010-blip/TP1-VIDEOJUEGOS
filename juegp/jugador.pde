class Jugador{
  private float ancho = 50;
  private float alto = 50;
  private int direccion = 0;
  private float velocidad = 5;

  Jugador(float x, float y) {
    super(x, y);
  }

  void mover() {
    x += direccion * velocidad;
    x = constrain(x, 0, width - ancho);
  }

  void mostrar() {
    fill(0, 150, 255);
    rect(x, y, ancho, alto);
  }

  void teclaPresionada(int keyCode) {
    if (keyCode == LEFT) direccion = -1;
    else if (keyCode == RIGHT) direccion = 1;
  }

  void teclaSoltada(int keyCode) {
    if (keyCode == LEFT || keyCode == RIGHT) direccion = 0;
  }

  // Getters
  float getX() { return x; }
  float getY() { return y; }
  float getAncho() { return ancho; }
  float getAlto() { return alto; }
}
