int numberOfSwitches = 32;
int numberOfMultiplexors = 3;

void setup() {
  Serial.begin(9600);
  muxStart();
  /*
  for(int i = initialPin; i <= numberOfSwitches+initialPin; i++){
    pinMode(i, INPUT);
  } 
*/  
 }
 
void loop(){
  
  
  for(int pinMux0 = 0; pinMux0 < 16; pinMux0++){
    Serial.print(muxDigitalRead(0,pinMux0));  
    Serial.print(",");
  
  }
  
  
  for(int pinMux1 = 0; pinMux1 < 16; pinMux1++){
    Serial.print(muxDigitalRead(1,pinMux1));  
    Serial.print(",");
  
  }
  Serial.print("\n"); 
  /*
  for(int pinMux2 = 0; pinMux2 < 16; pinMux2++){
    Serial.print(muxDigitalRead(2,pinMux2)); 
    if(pinMux2 == 15){ //lastPin
        Serial.print("\n"); 
      }
      else{
        Serial.print(",");  
      }  
  }*/
  
  
}
