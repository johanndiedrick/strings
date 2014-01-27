int n = 6;

void setup()
{
  n = 6;
  Serial.begin(9600); 
}

void loop()
{
  for(int i =0; i < n; i++){
    Serial.print(analogRead(i));
    Serial.print(" ");
  }
  Serial.print("\n");  
  delay(5);
}
