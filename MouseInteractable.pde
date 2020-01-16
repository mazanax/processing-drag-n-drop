interface MouseInteractable extends Movable {  
  public void onMousePressed(MouseEvent event);
  
  public void onMouseReleased(MouseEvent event);
  
  public boolean isMouseOver();
}
