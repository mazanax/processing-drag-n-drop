abstract class GameObject implements Object {
  protected Position pos;
  protected Size size;
  
  protected State prevState;
  protected State state;
  
  GameObject(int x, int y, int width, int height) {
    this.pos = new Position(x, y);
    this.size = new Size(width, height);
    
    prevState = State.IDLE;
    state = State.IDLE;
  }
  
  public void setState(State state)
  {
    this.prevState = state;
    this.state = state;
  }
  
  public State getState()
  {
    return state;
  }
  
  public State getPrevState()
  {
    return prevState;
  }
  
  public Position getPosition()
  {
    return pos;
  }
  
  public Size getSize()
  {
    return size;
  }
  
  public void resize(int width, int height)
  {
    size.width = width;
    size.height = height;
  }
  
  public void move(int x, int y)
  {
    pos.x = x;
    pos.y = y;
  }
  
  public void move(int x, int y, int z)
  {
    pos.x = x;
    pos.y = y;
    pos.z = z;
  }
  
  abstract public void update();
  
  abstract public void draw();
}
