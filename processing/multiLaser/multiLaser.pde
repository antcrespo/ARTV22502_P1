import processing.serial.*;

Serial myPort;
String val;
PImage cat;  // Declare variable "a" of type PImage
PImage dog;
int pinAmt = 5;

void setup() {
  //Still unsure how to programatically detemine a port for the Arduino
  String portName = "//dev//ttyUSB0";//Serial.list()[2];
  myPort = new Serial(this, portName, 9600); 
  
  size(640, 480);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  cat = loadImage("cat.jpg");  
  dog = loadImage("dog.jpg");
}

void draw()
{
  boolean[] lightVals = new boolean[pinAmt];
  if (myPort.available() > 0) 
    val = myPort.readStringUntil('\n');
    if (val != null ) {
      val = trim(val);
      if (val.length()  == 0)
        return; //<>//
      int lightLevel = new Integer(val);
      for (int i = 0; i < pinAmt; i++) {
        lightVals[i] = (lightLevel & (1 << i)) > 0;
      }
      drawLasers(lightVals);
    }
    
}

void drawLasers(boolean[] lights) {
  for (int i = 0; i < lights.length; i++) {
    char on = lights[i] ? 'O' : 'X';
    print(on);
  }
  println();
}