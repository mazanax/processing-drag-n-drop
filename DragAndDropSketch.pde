ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
ArrayList<Drawable> drawables = new ArrayList<Drawable>();
ArrayList<Updatable> updatables = new ArrayList<Updatable>();
ArrayList<MouseInteractable> mouseInteractables = new ArrayList<MouseInteractable>();

enum State{ IDLE, HOVER, DRAG };

enum Color {
    DEFAULT(#cccccc),
    HOVER(#888888);

    private int code;
    
    private Color(int code){
      this.code = code;
    }
    
    public int getCode() {
      return code;
    }
};

void setup() {
  size(1280, 720);
  pixelDensity(displayDensity());
  
  for (int i = 0; i < 5; i++) {
    GameObject box = new DraggableDecorator(new Square(10 + 60 * i, 10, 50, 50));
    gameObjects.add(box);
  }
  
  for (GameObject o : gameObjects) {
    drawables.add(o);
    updatables.add(o);
    
    if (o instanceof MouseInteractable) {
      mouseInteractables.add((MouseInteractable)o);
    }
  }
}

void draw() {
  background(0xFFFFFF);
  for (Updatable o : updatables) {
    o.update();
  }
  
  ArrayList<Movable> topElements = new ArrayList<Movable>();
  
  for (Drawable o : drawables) {
    if (o instanceof Movable && ((Movable)o).getPosition().z == -1) {
      topElements.add((Movable)o);
    }
    
    push();
    o.draw();
    pop();
  }
  
  for (Movable o : topElements) {
    push();
    ((Drawable)o).draw();
    pop();
  }
}

void mousePressed() {  
  MouseEvent event = new MouseEvent();
  MouseInteractable target = getMouseTarget();
  event.setTarget(target);
  
  for (MouseInteractable o : mouseInteractables) {
    o.onMousePressed(event);
  }
}

MouseInteractable getMouseTarget() {
  if (mouseInteractables.size() == 0) {
    return null;
  }
  
  MouseInteractable target = mouseInteractables.get(0);
  
  for (MouseInteractable o : mouseInteractables) {
    if (o.isMouseOver() && o.getPosition().z >= target.getPosition().z) {
      target = o;
    }
  }
  
  return target;
}

void mouseReleased() {
  MouseEvent event = new MouseEvent();
  
  for (MouseInteractable o : mouseInteractables) {
    o.onMouseReleased(event);
  }
}
