class Control_Button {
  PImage buttonUp;
  PImage buttonDown;
  PImage currentButtonState;
  boolean state; //true if pressed, false if not;
  PVector Pos;
  PVector PosEnd;
  Midi tone;
  int octive;

  PImage Slider[][]; //storing all images in double array

  Control_Button(int button, Midi parentTone) {
    //Temporary unless I have enough time to make buttons
    buttonUp = loadImage("2D/RecordButtonUp.png");
    buttonUp.resize(45, 43);
    buttonDown = loadImage("2D/RecordButtonDown.png");
    buttonDown.resize(45, 43);
    currentButtonState = buttonUp;
    tone = parentTone;

    if (button == 1) {
      Pos = new PVector(35, 525);
      tone.setFreq(16);
    }
    else if (button == 2) {
      Pos = new PVector(115, 525);
      tone.setFreq(17);
    }
    else if (button == 3) {
      Pos = new PVector(195, 525);
      tone.setFreq(18);
    }
    else if (button == 4) {
      Pos = new PVector(275, 525);
      tone.setFreq(19);
    }
    else if (button == 5) {
      Pos = new PVector(704, 525);
      tone.setFreq(20);
    }
    else if (button == 6) {
      Pos = new PVector(784, 525);
      tone.setFreq(21);
    }
    else if (button == 7) {
      Pos = new PVector(864, 525);
      tone.setFreq(22);
    }
    else if (button == 8) {
      Pos = new PVector(944, 525);
      tone.setFreq(23);
    }
    
    
    octive = 3; //defaulting to 3 for the octive

    Slider = new PImage[6][2]; // 0 for unlit, 1 for lit
    for (int i = 0; i < 6; i++) {
      Slider[i][0] = loadImage("2D/SliderBar/Unlit" + (i+1) + ".png");
      Slider[i][1] = loadImage("2D/SliderBar/Lit" + (i+1) + ".png");
    }
    
    state = false;
  }

  void draw() {

    for (int i = 0; i < 6; i++) {
      if ((6-i) > octive) {
        image(Slider[i][0], Pos.x + 15, Pos.y + (33 * i));
      } else {
        image(Slider[i][1], Pos.x + 15, Pos.y + (33 * i));
      }

      if ((6-i) == octive) {
        image(currentButtonState, Pos.x, Pos.y - 22 + (33*i));
      }
    }
  }

  void changeOctive(boolean increase) {
    if (increase && octive < 6) {
      octive++;
      tone.increaseOctive();
    } else if (!increase && octive > 1) {
      octive--;
      tone.decreaseOctive();
    }
  }

  /* //might be safer to do it this way... I'll come back later if this toggling it breaks
  void depress() {
    state = true;
    currentButtonState = buttonDown;
  }
  
  void release() {
    state = false;
    currentButtonState = buttonUp;
  }*/

  void toggleState() {
    if (state) {
      state = false;
      currentButtonState = buttonUp;
      tone.getTone().stop();
    } else {
      state = true;
      currentButtonState = buttonDown;
      tone.getTone().play();
    }
  }
}
