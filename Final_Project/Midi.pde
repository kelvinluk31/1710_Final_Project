// generating Midi notes for the program
// ref: https://newt.phys.unsw.edu.au/jw/notes.html
class Midi{
  float frequency[];
  SinOsc wave;
  int currentFreq;
  
  Midi(SinOsc sine){
    frequency = new float[48];
    wave = sine;
    currentFreq = 0;
    //I couldn't figure out the math so I just did this using https://pages.mtu.edu/~suits/notefreqs.html
    frequency[0] = 110.00;
    frequency[1] = 116.54;
    frequency[2] = 123.47;
    frequency[3] = 130.81;
    frequency[4] = 138.59;
    frequency[5] = 146.83;
    frequency[6] = 155.56;
    frequency[7] = 164.81;
    frequency[8] = 174.61;
    frequency[9] = 185.00;
    frequency[10] = 196.00;
    frequency[11] = 207.65;
    frequency[12] = 220.00;
    frequency[13] = 233.08;
    frequency[14] = 246.94;
    frequency[15] = 261.63;
    frequency[16] = 277.18;
    frequency[17] = 293.66;
    frequency[18] = 311.13;
    frequency[19] = 329.63;
    frequency[20] = 349.23;
    frequency[21] = 369.99;
    frequency[22] = 392.00;
    frequency[23] = 415.30;
    frequency[24] = 440.00;
    frequency[25] = 466.16;
    frequency[26] = 493.88;
    frequency[27] = 523.25;
    frequency[28] = 554.37;
    frequency[29] = 587.33;
    frequency[30] = 622.25;
    frequency[31] = 659.25;
    frequency[32] = 698.46;
    frequency[33] = 739.99;
    frequency[34] = 783.99;
    frequency[35] = 830.61;
    frequency[36] = 880.00;
    frequency[37] = 932.33;
    frequency[38] = 987.77;
    frequency[39] = 1046.5;
    frequency[40] = 1108.73;
    frequency[41] = 1174.66;
    frequency[42] = 1244.51;
    frequency[43] = 1318.51;
    frequency[44] = 1396.91;
    frequency[45] = 1479.98;
    frequency[46] = 1567.98;
    frequency[47] = 1661.22;    
  } 
  
  void setFreq(int freq){
    currentFreq = freq;
  }
  
  void increaseOctive(){
    if (currentFreq < 40){
      currentFreq = currentFreq + 8;
      wave.freq(frequency[currentFreq]);
    }
    else {
      System.out.println("tried to increase octive beyond 48");
    }  
  }
  
  void decreaseOctive(){
    if (currentFreq > 7){
      currentFreq = currentFreq - 8;
      wave.freq(frequency[currentFreq]);
    }
    else {
      System.out.println("tried to decrease octive beyond 0");
    }  
  }
  
  SinOsc getTone(){
    
    return wave;
  }
}
