const int pingPin1 = 2;
const int pingPin2 = 3;
const int pingPin3 = 4;
const int pingPin4 = 5;

const int door1 = 22;
const int doorbell1 = 24;
const int door2 = 26;
const int doorbell2 = 28;
const int bs = 10;

const int ppad = 30;

const int resetB = 6;
long duration, maxdis1, maxdis2, maxdis3, maxdis4, distanceCm;

void setup(){
  pinMode(door1, INPUT);
  pinMode(bs, INPUT);
  pinMode(doorbell1, INPUT);
  pinMode(door2, INPUT);
  pinMode(doorbell2, INPUT);
  pinMode(ppad, INPUT);
pinMode(resetB, INPUT);
  Serial.begin(9600);
  pinMode(13, OUTPUT);
  digitalWrite(13, HIGH);
  pinMode(pingPin1, OUTPUT);

digitalWrite(pingPin1, LOW);

delayMicroseconds(2);

digitalWrite(pingPin1, HIGH);

delayMicroseconds(5);

digitalWrite(pingPin1, LOW);

 

 pinMode(pingPin1, INPUT);

duration = pulseIn(pingPin1, HIGH);
maxdis1 = msCm(duration);
maxdis1 -= 2;
  pinMode(pingPin2, OUTPUT);

digitalWrite(pingPin2, LOW);

delayMicroseconds(2);

digitalWrite(pingPin2, HIGH);

delayMicroseconds(5);

digitalWrite(pingPin2, LOW);

 

 pinMode(pingPin2, INPUT);

duration = pulseIn(pingPin2, HIGH);
maxdis2 = msCm(duration);
maxdis2 -= 2;
pinMode(pingPin3, OUTPUT);

digitalWrite(pingPin3, LOW);

delayMicroseconds(2);

digitalWrite(pingPin3, HIGH);

delayMicroseconds(5);

digitalWrite(pingPin3, LOW);

 

 pinMode(pingPin3, INPUT);

duration = pulseIn(pingPin3, HIGH);
maxdis3 = msCm(duration);
maxdis3 -= 2;
pinMode(pingPin4, OUTPUT);

digitalWrite(pingPin4, LOW);

delayMicroseconds(2);

digitalWrite(pingPin4, HIGH);

delayMicroseconds(5);

digitalWrite(pingPin4, LOW);

 

 pinMode(pingPin4, INPUT);

duration = pulseIn(pingPin4, HIGH);
maxdis4 = msCm(duration);
maxdis4 -= 2;
digitalWrite(13, LOW);
Serial.print("L");
}

void loop() {
  

pinMode(pingPin1, OUTPUT);

digitalWrite(pingPin1, LOW);

delayMicroseconds(2);

digitalWrite(pingPin1, HIGH);

delayMicroseconds(5);

digitalWrite(pingPin1, LOW);


 pinMode(pingPin1, INPUT);

duration = pulseIn(pingPin1, HIGH);
distanceCm = msCm(duration);
if(digitalRead(resetB) == HIGH)
{
  Serial.print("A");
}
if(distanceCm < maxdis1)
{
  Serial.print("B");
}
  pinMode(pingPin2, OUTPUT);

digitalWrite(pingPin2, LOW);

delayMicroseconds(2);

digitalWrite(pingPin2, HIGH);

delayMicroseconds(5);

digitalWrite(pingPin2, LOW);

 

 pinMode(pingPin2, INPUT);

duration = pulseIn(pingPin2, HIGH);
distanceCm = msCm(duration);
if(distanceCm < maxdis2)
{
  Serial.print("C");
}
pinMode(pingPin3, OUTPUT);

digitalWrite(pingPin3, LOW);

delayMicroseconds(2);

digitalWrite(pingPin3, HIGH);

delayMicroseconds(5);

digitalWrite(pingPin3, LOW);

 

 pinMode(pingPin3, INPUT);

duration = pulseIn(pingPin3, HIGH);
distanceCm = msCm(duration);
if(distanceCm < maxdis3)
{
  Serial.print("D");
}
pinMode(pingPin4, OUTPUT);

digitalWrite(pingPin4, LOW);

delayMicroseconds(2);

digitalWrite(pingPin4, HIGH);

delayMicroseconds(5);

digitalWrite(pingPin4, LOW);

 

 pinMode(pingPin4, INPUT);

duration = pulseIn(pingPin4, HIGH);
distanceCm = msCm(duration);
if(distanceCm < maxdis4)
{
  Serial.print("E");
}
if(digitalRead(door1) == HIGH)
{
  Serial.print("F");
}
if(digitalRead(doorbell1) == HIGH)
{
  Serial.print("G");
}
if(digitalRead(door2) == HIGH)
{
  Serial.print("H");
}
if(digitalRead(doorbell2) == HIGH)
{
  Serial.print("I");
}
if(digitalRead(ppad) == HIGH)
{
  Serial.print("J");
}
if(digitalRead(bs) == HIGH){
 Serial.print("K");
delay(2000); 
}
 delay(100);
 
 }



  long msCm(long ms){

  return ms/29/2; 

 }

