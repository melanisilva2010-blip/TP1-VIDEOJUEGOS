abstract class Entidad {
  protected float x, y;

  Entidad(float x, float y) {
    this.x = x;
    this.y = y;
  }

  abstract void mover();
  abstract void mostrar();
}
