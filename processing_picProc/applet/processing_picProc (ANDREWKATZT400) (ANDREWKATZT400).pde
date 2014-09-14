import processing.serial.*;

Serial arduino;
Serial OUT;
String[] fileList;
PImage cur;
class check implements java.io.FilenameFilter{
 public boolean accept(File dir, String fname){
    String[] ext = {".png", ".jpg", ".jpeg", ".JPG", ".tga", ".gif"};
    for(int i = 0; i < ext.length; i++){
      if(fname.toLowerCase().endsWith(ext[i])) return true; 
    }
   return false;
   } 
}
void load(){
java.io.File dir = new java.io.File(dataPath(""));
fileList = dir.list(new check());
}
void info(){
 print("A = reset, B = US1, C = US2, D = US3, E = US4, F = door 1, G = doorbell 1,");
print("H = door 2, I = doorbell 2, J = pressure Pad, All other characters are errors");
print('\n'+"OUTPUT:"+'\n');
}
void setup(){
  load();
  imageMode(CENTER);
  size(screen.width, screen.height);
  println(Serial.list());
  arduino = new Serial(this, Serial.list()[1], 9600);
  OUT = new Serial(this, Serial.list()[2], 115200);
  background(0);
  info();
  cur = loadImage(dataPath("") + fileList[0]);
}
int getPic(char c)
{
  
  if(c == 'A'){
    return 0;
  }else if(c == 'B'){
    return 1;
  }else if(c == 'C'){
    return 2;
  }else if(c == 'D'){
    return 3;
  }else if(c == 'E'){
    return 4;
  }else if(c == 'F'){
    return 5;
  }else if(c == 'G'){
    return 6;
  }else if(c == 'H'){
    return 7;
  }else if(c == 'I'){
    return 8;
  }else if(c == 'J'){
    return 9;
  }else{
    println("Error: Bad char: " + c + " Char code: " + int(c));
    return 10; 
    
  
  }

}
int lastind = -1;
void draw (){

  if(arduino.available() > 0){
      background(0);
    char inByte = arduino.readChar();
    print(inByte);
    
   int ind = getPic(inByte);
      cur = loadImage(dataPath("")+fileList[ind]);
      cur.resize(0, height);
      
 image(cur, width/2, height/2);
  if(ind != lastind){
    OUT.write("Y");  
  }
lastind = ind;  
}
}
