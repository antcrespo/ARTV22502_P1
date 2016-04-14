/*
 * A simple programme that will change the intensity of
 * an LED based  * on the amount of light incident on 
 * the photo resistor.
 * 
 */
//this has not actually been tested sine I don't urrently hae an arduino
//PhotoResistor Pin
int minLightPin = 9;
//amount of photo resistors we're using
int pinAmt = 5;

//LED Pin
int ledPin = 13; 
void setup()
{
  for (int i = 0; i < pinAmt; i++)
    pinMode(i+minLightPin, INPUT);
  //initialize serial communications at a 9600 baud rate
  Serial.begin(9600);
}

void loop()
{
  int out = 0;
  
  for (int i = 0; i < pinAmt; i++) {
    //read light value
    int on = digitalRead(i+minLightPin);
    on = on == HIGH ? 1 : 0;
    out |= on << i;
  }
  Serial.println(out);
 //wait 100 milliseconds so we don't drive ourselves crazy
 delay(100);
}
