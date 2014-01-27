import processing.serial.*;
import rwmidi.*;

int numberOfSwitches = 31;
int [] prevSwitchValues;
int [] currentSwitchValues;
int vuelta = 0;


//pentatonic scale intervals {0, 2, 2, 3, 2, idem + 7}
//pentatonic scale distances {0,2,4,7,9}
//pentatonic scale distances for 12 notes {0,2,4,7,9, 7, 9, 11, 14, 16, 14, 16}
//int notes[] = {0,2,4,5,7,9,11, 12, 14, 16, 17, 19}; //major scale: distance to the tonic in semitones
//int notes[] =  {0,2,4,7,9, 12, 14, 16, 19, 21, 24, 26};
/*int notes[] =  {0,2,4,7,9, 12, 14, 16, 19, 21, 24, 26,
0,2,4,7,9, 12, 14, 16, 19, 21, 24, 26,
0,2,4,7,9, 12, 14, 16, 19, 21, 24, 26};*/
int notes[] = { 
19, 21, 24, 26, 28, 31, 33, 36,
19, 21, 24, 26, 28, 31, 33, 36,
0, 2, 4, 7, 9, 12, 14, 16,
0, 2, 4, 7, 9, 12, 14, 16};

int midiTonic = 36;

MidiOutput output1;
MidiOutput output2;

Serial myPort;      

void setup () {
  size(400, 300);      
  background(0); 
  output1 = RWMidi.getOutputDevices()[0].createOutput();
  output2 = RWMidi.getOutputDevices()[1].createOutput();
  println(RWMidi.getOutputDevices());
  prevSwitchValues = new int[numberOfSwitches];
  currentSwitchValues = new int[numberOfSwitches];
 
  
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');
  
  
  
}

void draw () {
  
}


void serialEvent (Serial myPort) {
  
  
  String inString = myPort.readStringUntil('\n');
  
  
  if (inString != null) {
    inString = trim(inString);
    int switches[] = int(inString.split(","));
    
    //1(switches);
    //println("switches Length: " + switches.length);
    //println("---");
    
    
    int numberOfSwitchesToRead = min(switches.length, numberOfSwitches);
    for(int i = 0; i< numberOfSwitchesToRead; i++){
      print("[" + i + "] : ");
      
      prevSwitchValues[i] = currentSwitchValues[i];
      currentSwitchValues[i] = switches[i];
      
      
      //print("prev: " + prevSwitchValues[i] + " ");
      print(currentSwitchValues[i]);
      println("");
      
      boolean sendNoteOn = ( currentSwitchValues[i] == 1 && prevSwitchValues[i] == 0);
      MidiOutput output = output1;
      int channel = i;
      if(i>=15){
        output = output2;
        channel = i - 16;
      }
      if(sendNoteOn){
        output.sendNoteOn(channel+1, notes[i] + midiTonic, 126); 
        
        
      }
      else if(currentSwitchValues[i] == 0){        
        output.sendNoteOn(channel+1, notes[i] + midiTonic, 0);
      }
      
    //println(currentSwitchValues);
    //vuelta++;
    //println("---vuelta + " + vuelta + "-----");
    
    }
    
    println("-------------------");    
    
    //System.out.print("Sensor " + i + ": " + sensors[i] + "\t");
    
  
  
  }


}

