const int numStrings = 1;

int readings[numStrings];


void setup() {
  Serial.begin(9600);
  muxStart();  
}

void loop(){ 
  readStrings();

  for(int i = 0; i < numStrings; i++){
      Serial.print(readings[i]);
      Serial.print(" ");
  }

  Serial.print("\n");   

}

void readStrings(){
  /*for(int pos = 0; pos < numStrings && pos < 8; pos++){
    readings[pos] = muxAnalogRead(0, pos);
    if(numStrings >= 8){
      readings[pos + 8] = muxAnalogRead(1, pos);
    }
  } */  
  
  for(int pos = 0; pos < numStrings && pos < 16; pos++){
    readings[pos] = muxAnalogRead(0,pos);
    if(numStrings > 16){
      readings[pos + 16] = muxAnalogRead(1, pos);
    }
    if(numStrings > 32){
      readings[pos + 32] = muxAnalogRead(2, pos);
    }     
  }
  
}




