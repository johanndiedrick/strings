class Scale {
  int midiTonic = 36;
  int[] notes= { 
      19, 21, 24, 26, 28, 31, 33, 36, 
      19, 21, 24, 26, 28, 31, 33, 36, 
      0, 2, 4, 7, 9, 12, 14, 16, 
      0, 2, 4, 7, 9, 12, 14, 16, 
      0, 2, 4, 7, 9, 12, 14, 16, 
      0, 2, 4, 7, 9, 12, 14, 16
    };;

  Scale(int midiTonic, int numberOfNotes) {    
    
    //TO DO : generate notes automatically 
    //for(int i = 0; i < numberOfNotes; i++){
    //notes[i] = midiTonic + 
    //}
    //
     
     //pentatonic scale intervals {0, 2, 2, 3, 2, idem + 7}
  //pentatonic scale distances {0,2,4,7,9}
  //pentatonic scale distances for 12 notes {0,2,4,7,9, 7, 9, 11, 14, 16, 14, 16}
  //int notes[] = {0,2,4,5,7,9,11, 12, 14, 16, 17, 19}; //major scale: distance to the tonic in semitones
  //int notes[] =  {0,2,4,7,9, 12, 14, 16, 19, 21, 24, 26};
  //int notes[] =  {0,2,4,7,9, 12, 14, 16, 19, 21, 24, 26,
  //0,2,4,7,9, 12, 14, 16, 19, 21, 24, 26,
  //0,2,4,7,9, 12, 14, 16, 19, 21, 24, 26};
  }
  int getNote(int pos){
    return notes[pos] + midiTonic;
  }
}


