class DraggableDecorator extends HoverableDecorator implements MouseInteractable {  
  private State previousState = State.IDLE;
  private State currentState = State.IDLE;
  
  private GameObject decoratedObj;
  private boolean pressed = false;
  
  private int z;
  
  DraggableDecorator(GameObject obj) {
    super(obj);
    
    decoratedObj = obj;
    pos = decoratedObj.getPosition();
    z = pos.z;
  }
  
  public void update() {
    if (isMouseOver() && !isDragged()) {
      changeState(State.HOVER);
      decoratedObj.move(pos.x, pos.y, z);
    } else if (isDragged()) {
      changeState(State.DRAG);
      
      decoratedObj.move(pos.x + (mouseX - pmouseX), pos.y + (mouseY - pmouseY), -1);
      pos = decoratedObj.pos;
    } else {
      changeState(State.IDLE);
      
      decoratedObj.move(pos.x, pos.y, z);
    }
    
    decoratedObj.setState(currentState);
    decoratedObj.update();
  }
  
  public void onMousePressed(MouseEvent event) {
    if ((event.getTarget() == this || event.getTarget() == null) && isMouseOver() && !pressed) {
      pressed = true;
    }
  }
  
  public void onMouseReleased(MouseEvent event) {
    if (pressed) {
      pressed = false;
    }
  }
  
  public void draw() {
    decoratedObj.draw();
  }
  
  public boolean isDragged() {
    return pressed
      && (previousState == State.HOVER || currentState == State.DRAG);
  }
  
  private void changeState(State newState) {
    previousState = currentState;
    currentState = newState;
  }
}
