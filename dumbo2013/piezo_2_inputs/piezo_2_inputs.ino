
void setup()
{
  
  Serial.begin(9600); 
}

void loop()
{
 Serial.print(analogRead(0));
 Serial.print(" ");
 Serial.println(analogRead(1));
  delay(5);
}
