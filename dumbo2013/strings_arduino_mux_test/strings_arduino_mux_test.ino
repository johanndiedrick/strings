const int numStrings = 3;

int readings[numStrings];


void setup() {
  Serial.begin(9600);
  muxStart();  
}

void loop(){ 
  for(int i =0; i < numStrings; i++){
    Serial.print(muxAnalogRead(0,numStrings));
    Serial.print(" ");
  }
  Serial.print("\n");  
  delay(5);
 
}






