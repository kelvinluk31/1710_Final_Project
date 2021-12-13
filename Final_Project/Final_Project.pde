import processing.sound.*;

///////////// RESOLUTION /////////////
int RESOLUTIONX = 1024;
int RESOLUTIONY = 768;

////////////// COLORS ///////////////
//stated colors so i don't have to reference the color number//
// Black   #000000   (0,0,0)
color BLACK = color(0, 0 ,0);
// White   #FFFFFF   (255,255,255)
color WHITE = color(255, 255 ,255);
// Red   #FF0000   (255,0,0)
color RED = color(255, 0, 0);
// Lime   #00FF00   (0,255,0)
color LIME = color(0, 255, 0);
// Blue   #0000FF   (0,0,255)
color BLUE = color(0, 0 ,255);
// Yellow   #FFFF00   (255,255,0)
color YELLOW = color(255, 255 ,0);
// Cyan / Aqua   #00FFFF   (0,255,255)
color CYAN = color(0, 255 , 255);
// Magenta / Fuchsia   #FF00FF   (255,0,255)
color MAGENTA = color(255, 0 , 255);
// Silver   #C0C0C0   (192,192,192)
color SILVER = color(192, 192 , 192);
// Gray   #808080   (128,128,128)
color GREY = color(128, 128 ,128);
// Maroon   #800000   (128,0,0)
color MAROON = color(128, 0 ,0);
// Olive   #808000   (128,128,0)
color OLIVE = color(128, 128 ,0);
// Green   #008000   (0,128,0)
color GREEN = color(0, 128 ,0);
// Purple   #800080   (128,0,128)
color PURPLE = color(128, 0 , 128);
// Teal   #008080   (0,128,128)
color TEAL = color(0, 128 ,128);
// Navy   #000080   (0,0,128)
color NAVY = color(0, 0 ,128);

PImage UIBackGround;
PShape WaveformBackGround;
Emotion_Engine PowerVR;

// UI Buttons //
Media_Button RecordButton;
Media_Button PlayButton;
Media_Button PauseButton;
Media_Button StopButton;
Media_Button SaveButton;
Media_Button LoadButton;
Media_Button AddButton;

// Control Buttons //
Control_Button AButton;
Control_Button SButton;
Control_Button DButton;
Control_Button FButton;
Control_Button JButton;
Control_Button KButton;
Control_Button LButton;
Control_Button SCButton;

// soundwave to be used by the program //
SinOsc sine[];
Midi midi[];

// Waveform for visualizer // 
Waveform waveform[];
Waveform master;
int samples;

void setup() {
  size(1024, 768, P3D);
  samples = 100;
  waveform = new Waveform[8];
  PowerVR = new Emotion_Engine();
  
  sine = new SinOsc[8];
  midi = new Midi[8];
  master = new Waveform(this, samples);
  
  for(int i = 0; i < 8; i++){
    sine[i] = new SinOsc(this);
    sine[i].stop();
    midi[i] = new Midi(sine[i]);
    waveform[i] = new Waveform(this, samples);
    waveform[i].input(midi[i].getTone());
  }
  
  // UI Button Initalization //
  RecordButton = new Media_Button("RecordButton", 333, 516);
  PlayButton = new Media_Button("PlayButton", 383, 516);
  PauseButton = new Media_Button("PauseButton", 433, 516);
  StopButton = new Media_Button("StopButton", 483, 516);
  SaveButton = new Media_Button("SaveButton", 533, 516);
  LoadButton = new Media_Button("LoadButton", 583, 516);
  AddButton = new Media_Button("AddButton", 633, 516);
  
  // Control Button Initalization //
  AButton = new Control_Button(1, midi[0]); //
  SButton = new Control_Button(2, midi[1]); //
  DButton = new Control_Button(3, midi[2]); //
  FButton = new Control_Button(4, midi[3]); //
  JButton = new Control_Button(5, midi[4]); //
  KButton = new Control_Button(6, midi[5]); //
  LButton = new Control_Button(7, midi[6]); //
  SCButton = new Control_Button(8, midi[7]); //
  
  UIBackGround = loadImage("2D/background.png");
  //WaveformBackGround = createShape(rect
  
}

void draw() {
  background(0);
  
  lights();
  //translate(width/2, height/2, x);
  //rotateX((5*PI)/6);
  


  for(int i = 0; i < 8; i++){
    waveform[i].analyze();
  }
  

  
  
  //drawing the UI needs to go after all the 3d so it's the "top layer"; Everything after this point is UI.
  image(UIBackGround,0,0);
  RecordButton.draw();
  PlayButton.draw();
  PauseButton.draw();
  StopButton.draw();
  SaveButton.draw();
  LoadButton.draw();
  AddButton.draw();
  AButton.draw();
  SButton.draw();
  DButton.draw();
  FButton.draw();
  JButton.draw();
  KButton.draw();
  LButton.draw();
  SCButton.draw();
  
  PowerVR.run();
  

  
}

void keyPressed(){
  // Events for Changing Octives //
  if (key == 'z' || key == 'Z'){
    AButton.changeOctive(false);
  }
  
  if (key == 'q' || key == 'Q'){
    AButton.changeOctive(true);
  }

  if (key == 'x' || key == 'X'){
    SButton.changeOctive(false);
  }
  
  if (key == 'w' || key == 'W'){
    SButton.changeOctive(true);
  }

  if (key == 'c' || key == 'C'){
    DButton.changeOctive(false);
  }
  
  if (key == 'e' || key == 'E'){
    DButton.changeOctive(true);
  }
  
  if (key == 'v' || key == 'V'){
    FButton.changeOctive(false);
  }
  
  if (key == 'r' || key == 'R'){
    FButton.changeOctive(true);
  }

  if (key == 'm' || key == 'M'){
    JButton.changeOctive(false);
  }
  
  if (key == 'u' || key == 'U'){
    JButton.changeOctive(true);
  }

  if (key == ',' || key == '<'){
    KButton.changeOctive(false);
  }
  
  if (key == 'i' || key == 'I'){
    KButton.changeOctive(true);
  }

  if (key == '.' || key == '>'){
    LButton.changeOctive(false);
  }
  
  if (key == 'o' || key == 'O'){
    LButton.changeOctive(true);
  }
  
  if (key == '/' || key == '?'){
    SCButton.changeOctive(false);
  }
  
  if (key == 'p' || key == 'P'){
    SCButton.changeOctive(true);
  }
  // Actual key depression //
  if(key == 'a' || key == 'A'){
    //AButton.toggleState();
    AButton.depress();
    PowerVR.bitFlip(0);
  }
  
  if(key == 's' || key == 'S'){
    //SButton.toggleState();
    SButton.depress();
    PowerVR.bitFlip(1);
  }
  
  if(key == 'd' || key == 'D'){
    //DButton.toggleState();
    DButton.depress();
    PowerVR.bitFlip(2);
  }
  
  if(key == 'f' || key == 'F'){
    //FButton.toggleState();
    FButton.depress();
    PowerVR.bitFlip(3);
  }
  
  if(key == 'j' || key == 'J'){
    //JButton.toggleState();
    JButton.depress();
    PowerVR.bitFlip(4);
  }
  
  if(key == 'k' || key == 'K'){
    //KButton.toggleState();
    KButton.depress();
    PowerVR.bitFlip(5);
  }
  
  if(key == 'l' || key == 'L'){
    //LButton.toggleState();
    LButton.depress();
    PowerVR.bitFlip(6);
  }
  
  if(key == ';' || key == ':'){
    //SCButton.toggleState();
    SCButton.depress();
    PowerVR.bitFlip(7);
  }

}

void keyReleased(){
  if(key == 'a' || key == 'A'){
    //AButton.toggleState();
    AButton.release();
    
  }
  
  if(key == 's' || key == 'S'){
    //SButton.toggleState();
    SButton.release();
  }
  
  if(key == 'd' || key == 'D'){
    //DButton.toggleState();
    DButton.release();
  }
  
  if(key == 'f' || key == 'F'){
    //FButton.toggleState();
    FButton.release();
  }
  
  if(key == 'j' || key == 'J'){
    //JButton.toggleState();
    JButton.release();
  }
  
  if(key == 'k' || key == 'K'){
    //KButton.toggleState();
    KButton.release();
  }
  
  if(key == 'l' || key == 'L'){
    //LButton.toggleState();
    LButton.release();
  }
  
  if(key == ';' || key == ':'){
    //SCButton.toggleState();
    SCButton.release();
  }
}
