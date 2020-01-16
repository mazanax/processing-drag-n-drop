class Hoverable extends GameObject {  
  private GameObject decoratedObj;
  
  Hoverable(GameObject obj) {
    super(0, 0, 0, 0);
    
    decoratedObj = obj;
    pos = decoratedObj.getPosition();
    size = decoratedObj.getSize();
  }
  
  public void update() {
    if (isMouseOver()) {
      decoratedObj.setState(State.HOVER);
    }
    
    decoratedObj.update();
  }
  
  public void draw() {
    decoratedObj.draw();
  }
  
  public boolean isMouseOver() {
    return mouseX > pos.x
      && mouseX <= pos.x + size.width
      && mouseY > pos.y
      && mouseY <= pos.y + size.height;
    
  }
}
