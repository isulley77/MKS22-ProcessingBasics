int MAX_INT = 100;
int MIN_INT = -100;
Visualizer v;


class Visualizer{

  float x, y;
  float[] vals;
  float[] vlos;
  
  
  Visualizer(float x, float y){
    this.x = x;
    this.y = y;
    vals = new float[10];
    vlos = new float[10];
    
    for(int i = 0; i < vals.length; i++){
      vals[i] = random(-99, 99);
      vlos[i] = random(2);
    }
  }
  
  
  void display(){
    fill(255);
    rect(x, y, 400, 200);
    
    line(x, y + 100, x + 400, y + 100);
    
    float x2 = x;
    
    float increment = 400/ vals.length;
    
    for(int i = 0; i < vals.length; i++){
      float current = vals[i];
      
      if(current  > 50){
        fill(255,255,0);
      }
      if(current > 0 && current < 50){
        fill(255,165,0);
      }
      if(current > -50 && current < 0){
        fill(255,255,0);
      }
      if(current > -100 && current < -50){
        fill(0,128,0);
      }
      
      rect(x2, y + 100, increment, current);
      x2 += increment;
      
    }
    
  }
  
  void update() { 
    for(int i = 0; i < vals.length; i++){
      vals[i] += vlos[i];
      
      if(vals[i] > 100){
        vlos[i] = vlos[i] * -1;
      }
      
      if(vals[i] < -100){
        vlos[i] = vlos[i] * -1;
      }
    }
  }

}
void setup(){
  
  size(600, 500);
  v = new Visualizer(20, 20);
   
}


void draw(){
  v.display();
  v.update();
}
