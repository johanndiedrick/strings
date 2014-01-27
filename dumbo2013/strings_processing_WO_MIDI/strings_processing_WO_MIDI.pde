import processing.serial.*;

import controlP5.*;


System system;
Serial myPort;

//interface
int mode; 
final static int DASHBOARD = 0;
final static int CALLIBRATION = 1;

int[] graphXPos;
int stringToDisplay = 0;
ControlP5 cp5;
PApplet parent;

int ySep = 30;
int xSep = 20;

boolean custom;
boolean smooth;
boolean thresholdChanged;

void setup () {
  system = new System();
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 28800);//28800
  myPort.bufferUntil('\n');
  initInterface();
}



void initInterface() {
  mode = DASHBOARD;
  size(1200, 768);      
  background(0);
  graphXPos = new int[system.numberOfStrings];
  for (int i = 0; i < system.numberOfStrings; i++) {
    graphXPos[i] = 1;
  }
  thresholdChanged = false;

  cp5 = new ControlP5(this);  


  int stringNum = 0;
  for (int j = 0; j < 4; j ++) {
    for (int i = 0; i < 4; i++) {
      if (stringNum < system.numberOfStrings) {
        cp5.addSlider("threshold_" + stringNum)
          .setPosition(xSep + xSep*i + 200*i, ySep - 20 + ySep*j + 150*j)
            .setRange(20, 80)
              .setId(stringNum);
        stringNum++;
      }
    }
  }


  fill(100, 100, 100);
  int xRect = xSep + xSep*4 + 200*4;
  rect(xRect, 0, width - xRect, 768);

  cp5.addToggle("custom")
    .setPosition(xRect + xSep, ySep)
      .setSize(50, 20)
        .setValue(true)
          .setMode(ControlP5.SWITCH)
            ;
            
  cp5.addToggle("smooth")
    .setPosition(xRect + xSep, ySep*2 + 5)
      .setSize(50, 20)
        .setValue(true)
          .setMode(ControlP5.SWITCH)
            ;

  cp5.loadProperties(("strings.properties"));
}


void drawDashBoard() {
  int stringNum = 0;
  for (int j = 0; j < 4; j ++) {
    for (int i = 0; i < 4; i++) {
      if (stringNum < system.numberOfStrings) {
        graph(stringNum, system.strings[stringNum].getValue(), xSep + xSep*i + 200*i, ySep + ySep*j + 150*j, 200, 150);
        stringNum++;
      }
    }
  }
  
  thresholdChanged = false;
}

void draw () {
  system.update(millis());  
  if (mode == DASHBOARD) {
    drawDashBoard();
  }
  else if (mode == CALLIBRATION) {
  }
}

void graph(int stringNum, int value, int x, int y, int w, int h) {
  if (graphXPos[stringNum] == 0 || thresholdChanged) {
    fill(255, 255, 255);
    rect(x, y, w, h);    
  }
  int xPos = graphXPos[stringNum] + x;


  int thresGraphValue = (int)map(system.strings[stringNum].getThreshold(), 0, 1023, 0, h);

  stroke(0, 255, 0);
  line(x, y + h - thresGraphValue, x + w, y + h - thresGraphValue);
  int graphValue = (int)map(value, 0, 1023, 0, h);  
  // draw the line:
  stroke(0, 0, 0);  

  line(xPos, y + h, xPos, y + h - graphValue);


  if (value > system.strings[stringNum].thres) {
    stroke(255, 0, 0);
    line(xPos, y + h - thresGraphValue, xPos, y + h - graphValue);
  }

  // at the edge of the screen, go back to the beginning:
  if (graphXPos[stringNum] >= w) {
    graphXPos[stringNum] = 0;
  } 
  else {
    // increment the horizontal position:
    graphXPos[stringNum]++;
  }
}



void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  if (inString != null) {
    inString = trim(inString);
    int inputValues[] = int(inString.split(" "));
    int numberOfStringsToRead = min(inputValues.length, system.numberOfStrings);
    for (int i = 0; i< numberOfStringsToRead; i++) { 
      system.strings[i].setNewValue(inputValues[i], millis());
      //println(inputValues[i]);
    }
    println(inString);
  }
}


void keyPressed() {
  if (key == 'q') {
    Cuerda.thres -= 10; 
    thresholdChanged = true;
    println("Cuerda.thres: " + Cuerda.thres);
  }
  if (key == 'w') {
    Cuerda.thres += 10;
    thresholdChanged = true;
    println("Cuerda.thres: " + Cuerda.thres);
  }
  if (key == 'e') {
    Cuerda.minTimeBetweenAttacks -= 50; 
    println("minTimeBetweenAttacks: " + Cuerda.minTimeBetweenAttacks);
  }
  if (key == 'r') {
    Cuerda.minTimeBetweenAttacks += 50;
    println("minTimeBetweenAttacks: " + Cuerda.minTimeBetweenAttacks);
  }
  if (key == 's') {
    cp5.saveProperties(("strings.properties"));
    println("save");
  }
  if (Cuerda.attackThreshold > 100) {
    Cuerda.attackThreshold = 100 ;
  }
  if (Cuerda.attackThreshold <= 0) {
    Cuerda.attackThreshold = 0;
  }
}

void updateThreshold(int theAmount) {
  Cuerda.thres = theAmount;
  thresholdChanged = true;
}

void controlEvent(ControlEvent theEvent) {
  int id = theEvent.getController().getId(); 
  if (id >= 0) {
    system.strings[id].customThres = (int) theEvent.getController().getValue();    
  }
  Cuerda.useCustomCallibration = custom;
  Cuerda.doSmooth = smooth;
  thresholdChanged = true;
}

void exit() {
  cp5.saveProperties(("strings.properties"));
}

