
int i = 0;
int j = 0;

void setup()
{
 Serial.begin(9600); 
}

void loop()
{
  j = random(0, 1000);
  Serial.print(i);
  Serial.print(" ");
  Serial.println(j);
  i++;
  if(i>999) i=0;
  
  delay(20);
}
