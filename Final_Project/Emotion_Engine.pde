//Because it's analogue... get it? Emotion Engine? Analogue? (if not: https://www.youtube.com/watch?v=IRv_xKS4q7o)
class Emotion_Engine {
 
 boolean bits[];
 color emotion;
 int r;
 int g;
 int b;
 int posneg;
 
 Emotion_Engine(){
   bits = new boolean[8];
   for(int i = 0; i < 8; i++){
     bits[i] = false;
   }
   r = 255;
   g = 255;
   b = 255;
   emotion = color(r, g ,b);
 }
 
 void run(){
   this.draw();
   this.express();
 }
 
 void express(){
  if(bits[1]){
    if(r < 255){
      r = r + 1;
   }
  }
   
 if(bits[2]){
   if(r > 0){
     r = r - 1;
   }
 }
 
 if(bits[3]){
   if(g < 255){
     g = g + 1;
   }
 }
 
 if(bits[4]){
   if(g > 0){
     g = g - 1;
   }
 }
 
 if(bits[5]){
   if(b < 255){
     b = b + 1;
   }
 }
 
 if(bits[6]){
   if(b > 0){
     b = b - 1;
   }
 }
  
  emotion = color(r,g,b);
 }
 
 void draw(){
  stroke(BLACK);
  strokeWeight(2);
  fill(BLACK);
  rect(350, 405, 310, 90, 24);
  fill(WHITE); //if I don't do this, the entire UI gets tinted :(
  
  stroke(emotion);
  strokeWeight(2);
  noFill();
  beginShape();
  for(int i = 0; i < samples; i++)
  {
    master.data[i] = 0;
    for(int j = 0; j < 8; j++){
      master.data[i] = master.data[i] + waveform[j].data[i];
    }
    vertex(
      map(i, 0, samples, 350, 660),
      map((master.data[i]/8), -1, 1, 405, 495)
    );
  }
  endShape();
 }
 
 void bitFlip(int i){
   if(bits[i]){
     bits[i] = false;
   }
   else{
     bits[i] = true;
   }
 }
 
}
