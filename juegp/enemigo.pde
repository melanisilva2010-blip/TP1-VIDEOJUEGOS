class Enemigo extends Entidad {
  private float tam = 40;
  private float velocidad = 4;

  Enemigo(float x, float y) {
    super(x, y);
  }

  void mover() {
    y += velocidad;
    if (y > height) {
      y = -tam;
      x = random(width);
    }
  }

  void mostrar() {
    fill(255, 100, 100);
    ellipse(x + tam / 2, y + tam / 2, tam, tam);
  }

  boolean chocaCon(Jugador j) {
    return x < j.getX() + j.getAncho() &&
           x + tam > j.getX() &&
           y < j.getY() + j.getAlto() &&
           y + tam > j.getY();
  }
}
