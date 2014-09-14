const int buzzer = 13;
const int beep = 12;

void setup() {                
 Serial.begin(9600);
  pinMode(buzzer, OUTPUT);  
pinMode(beep, OUTPUT);    
}
boolean bp = false;

void loop() {
  if (Serial.available() > 0) {
		
		bp = Serial.read() == 'Y';
  }
  
  
  
 if(bp){
   for(int i = 0; i<5;i++){
  digitalWrite(buzzer, HIGH);   
  delay(1000);              
  digitalWrite(buzzer, LOW);    
  delay(1000);  
   }
  for(int i = 0; i <100; i++){
   digitalWrite(12, HIGH);
 delay(10);
 digitalWrite(12, LOW);
  }
 }
bp=false;
}
