class System{

  int numberOfStrings = 15; //48
  Cuerda[] strings;
  Scale scale;
  

  System() {
    scale = new Scale(36, numberOfStrings);

    println(RWMidi.getOutputDevices());  
    MidiOutput output1 = RWMidi.getOutputDevices()[0].createOutput();
    MidiOutput output2 = RWMidi.getOutputDevices()[1].createOutput();
    MidiOutput output3 = RWMidi.getOutputDevices()[2].createOutput();  

    strings = new Cuerda[numberOfStrings];
    for (int i = 0; i < numberOfStrings; i++) {
      strings[i] = new Cuerda();
      strings[i].note = scale.getNote(i);
      println(scale.getNote(i));

      if (i < 16) {
        strings[i].output = output1;
        strings[i].channel = i;
      }
      else if (16 <= i && i < 32) {
        strings[i].output = output2;
        strings[i].channel = i - 16;
      }
      else if (32 <= i) {
        strings[i].output = output2;
        strings[i].channel = i - 32;
      }
    }
    
  }

  void update(int curTime) {
    for (int i=0; i < numberOfStrings; i++) {
      strings[i].update(curTime);
    }
  }
  
}

