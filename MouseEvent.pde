class MouseEvent {
  private MouseInteractable target;
  
  MouseEvent() {
  }
  
  public void setTarget(MouseInteractable target) {
    this.target = target;
  }
  
  public MouseInteractable getTarget() {
    return this.target;
  }
}
