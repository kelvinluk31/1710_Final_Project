class Media_Button {
  PImage buttonUP;
  PImage buttonDown;
  PImage currentButtonState;
  boolean state; //true if depressed, false if not
  PVector Pos;
  PVector PosEnd;
  
  
  //default constructor for the media button
  Media_Button(String ButtonName, int x, int y){ //takes in a string to use for loading the image
    buttonUP = loadImage("2D/"+ButtonName+"Up.png");
    buttonUP.resize(45,43);
    buttonDown = loadImage("2D/"+ButtonName+"Down.png");
    buttonDown.resize(45,43);
    state = false;
    currentButtonState = buttonDown;
    Pos = new PVector(x,y);
    PosEnd = new PVector(x + 45, y + 43);
  }
  
  boolean getState(){
    return state;
  }
  
  void toggleState(){
    if(state){
      state = false;
    }
    else {
      state = true;
    }
  }
  
  PImage getImage(){
    return currentButtonState;
  }
  
  void draw(){
    image(currentButtonState,Pos.x, Pos.y);
  }
  
  
  
}
