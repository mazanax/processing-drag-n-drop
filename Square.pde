class Square extends GameObject {
  private Color currentColor;
  
  Square(int x, int y, int width, int height) {
    super(x, y, width, height);
    
    currentColor = Color.DEFAULT;
  }
  
  public void update() {
    if (state == State.IDLE) {
      currentColor = Color.DEFAULT;
    } else {
      currentColor = Color.HOVER;
    }
    
    println(pos.x, pos.y);
  }
  
  public void draw() {
    strokeWeight(1);
    stroke(0x000000);
    fill(currentColor.getCode());
    rect(pos.x, pos.y, size.width, size.height, size.width / 4);
  }
}
