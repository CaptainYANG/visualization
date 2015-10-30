/**
* ControlP5 Range
*
* find a list of public methods available for the Range Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/


import controlP5.*;

ControlP5 cp5;
int nbOfCountries;
int nbOfHeaders;
float[] x;
float[] y;
float[] demoScore;
float[] cpw;
float[] HDI;
float[] life;
float[] poverty;
String[][] data;
float maxX;
float maxY;
int originX= 50;
int originY = 700;
int endX = 700;
int endY =50;
String nameToDisplay = "";
String infoToDisplay1 = "";
String infoToDisplay2 = "";
String infoToDisplay3 = "";
String infoToDisplay4 = "";
String infoToDisplay = "";
float labelX;
float labelY;
float democracyScores = 5.5;
float childrenPerWomen = 2.2;


float demoMin = -10;
float demoMax = 10;
float cpwMin =  0;
float cpwMax = 8;
float hdiMin = 0;
float hdiMax = 1;
float poMin = 0;
float poMax = 84;


Range demoRange;
Range cpwRange;
Range HDIRange;
Range povertyRange;

void setup() {
  size(1000,800);
  cp5 = new ControlP5(this);
 readData();
   demoRange = cp5.addRange("democracyScores")
  .setBroadcast(false)
  .setPosition(700,375)
  .setHandleSize(5)
  .setRange(-10,10)
  .setSize(150,20)
  .setRangeValues(demoMin,demoMax)
  .setBroadcast(true)
  ;
  
  cpwRange = cp5.addRange("Children per woman")
  .setBroadcast(false)
  .setPosition(700,450)
  .setHandleSize(5)
  .setRange(0,8)
  .setSize(150,20)
  .setRangeValues(cpwMin,cpwMax)
  .setBroadcast(true)
  ;
  
  HDIRange = cp5.addRange("HDI 2007")
  .setBroadcast(false)
  .setPosition(700,300)
  .setHandleSize(5)
  .setRange(0,1)
  .setSize(150,20)
  .setRangeValues(hdiMin,hdiMax)
  .setBroadcast(true)
  ;
  
   povertyRange = cp5.addRange("extrem poverty")
  .setBroadcast(false)
  .setPosition(700,525)
  .setHandleSize(5)
  .setRange(0,84)
  .setSize(150,20)
  .setRangeValues(poMin,poMax)
  .setBroadcast(true)
  ;
  
  noStroke();             
}

void draw() {
    background(0);
  strokeWeight(2);
  noStroke();
  int length = 600;
  fill(245,245,245,200);
  ellipse(100,30,15,15);
   fill(255,227,132,200);
  ellipse(200,30,15,15);
  fill(255,69,0);
  ellipse(300,30,15,15);
  fill(64,224,208,200);
  ellipse(400,30,15,15);
  fill(160,32,240);
  ellipse(500,30,15,15);
  fill(255);
  text("life",50,35);
  text("0~50",114,35);
  text("50~60",214,35);
  text("60~70",314,35);
  text("70~80",414,35);
  text("80~90",514,35);
  
      for (int i = 1; i<nbOfCountries;i++){
        if(demoScore[i]>=demoMin && demoScore[i] <= demoMax){
      if(cpw[i]>=cpwMin && cpw[i]<=cpwMax){
        if(HDI[i]>=hdiMin && HDI[i]<=hdiMax){
          if(poverty[i]>=poMin && poverty[i]<=poMax){
          if(life[i]<=50){
            fill(245,245,245,200);
      }else if(life[i]<=60){
        fill(255,227,132,200);
      }else if(life[i]<=70){
        fill(255,69,0);
      }else if(life[i]<=80){
        fill(64,224,208,200);
      }else if(life[i]<=90){
        fill(160,32,240);
      }else{
        noFill();
      }
      if(x[i]-100 !=0 && y[i]-700 != 0){
        
     ellipse(x[i],y[i],float(data[i][1]),float(data[i][1]));
      }
          }
        }
      }
        }
      }
   textAlign(LEFT);
   fill(255);
   textSize(33);
   text("GDP Industry2007", 300, height-10);
   writeVerticalText(30, 500,"GDP Services2007");
      textSize(32);
      text(nameToDisplay,labelX, labelY);
      textSize(18);
      text(infoToDisplay,695, 50,300,200);
      stroke(255);
      noFill();
      rect(690,50,300,180,7);
      textSize(18);
      fill(255);
      text("HDI 2007", 700, height/2-110);
      text("Democracy ranges",700, height/2-35);
      text("Children per women", 700, height/2+40);
      text("Extrem Poverty ratio",700, height/2+110);
  stroke(255,222,222);
  line(originX,originY,originX,endY);
  line(originX,originY,endX,originY);
}
  void writeVerticalText(int x, int y, String text){
     pushMatrix();
    translate(x,y);
    rotate(-HALF_PI);
    text(text,0,0);
    popMatrix();
  }

void controlEvent(ControlEvent theControlEvent) {
  if(theControlEvent.isFrom("democracyScores")) {
    // min and max values are stored in an array.
    // access this array with controller().arrayValue().
    // min is at index 0, max is at index 1.
    demoMin = theControlEvent.getController().getArrayValue(0);
    demoMax = theControlEvent.getController().getArrayValue(1);
  }else if(theControlEvent.isFrom("Children per woman")){
    cpwMin = theControlEvent.getController().getArrayValue(0);
    cpwMax = theControlEvent.getController().getArrayValue(1);
  }else if(theControlEvent.isFrom("HDI 2007")){
    hdiMin = theControlEvent.getController().getArrayValue(0);
    hdiMax = theControlEvent.getController().getArrayValue(1);
  }else if(theControlEvent.isFrom("extrem poverty")){
    poMin = theControlEvent.getController().getArrayValue(0);
    poMax = theControlEvent.getController().getArrayValue(1);
  }
}


void keyPressed() {
  switch(key) {
    case('1'):demoRange.setLowValue(0);break;
    case('2'):demoRange.setLowValue(100);break;
    case('3'):demoRange.setHighValue(120);break;
    case('4'):demoRange.setHighValue(200);break;
    case('5'):demoRange.setRangeValues(40,60);break;
  }
}
  void readData(){
    String[] lines = loadStrings("countries.csv");
    nbOfCountries = lines.length;
    String[] headers = split(lines[0], ";");
    nbOfHeaders = headers.length;
    x = new float[nbOfCountries];
    y = new float[nbOfCountries];
    demoScore = new float[nbOfCountries];
    cpw = new float[nbOfCountries];
    HDI = new float[nbOfCountries];
    life = new float[nbOfCountries];
    poverty = new float[nbOfCountries];
    data = new String[nbOfCountries][nbOfHeaders];
        for(int i=1;i<nbOfCountries; i++){
      data[i] = split(lines[i],";");
      if(!data[i][2].equals("X")){
        x[i] = float(data[i][2]);
        maxX = Math.max(x[i], maxX);
      }else{
        x[i]=0;
      }
      if(!data[i][3].equals("X")){
        y[i] = float(data[i][3]);
        maxY = Math.max(y[i], maxY);
        }else{
          y[i] = 0;
        } 
      if(!data[i][6].equals("X")){
        demoScore[i] = float(data[i][6]);
        }else{
          demoScore[i] = 0;
        }   
       if(!data[i][4].equals("X")){
        cpw[i] = float(data[i][4]);
        }else{
          cpw[i] = 0;
        }  
       if(!data[i][11].equals("X")){
        HDI[i] = float(data[i][11]);
       }else{
        HDI[i] = 0;
       } 
       if(!data[i][12].equals("X")){
         life[i] = float(data[i][12]);
       }else{
         life[i] = 0;
       }
       if(!data[i][8].equals("X")){
         poverty[i] = float(data[i][8]);
       }else{
         poverty[i] = 0;
       }
    }
    for (int i = 1; i<nbOfCountries; i++){
          x[i] = mapX(x[i]);
          y[i] = mapY(y[i]);
    }
  }
float mapX(float x){
  return map(x,0,maxX,originX, endX);
}
float mapY(float y){
  return map(y,0,maxY,originY, endY);
}
void mouseMoved(){
  for(int i = 1; i<nbOfCountries; i++){
    if(dist(x[i],y[i], mouseX, mouseY) < 10){
      nameToDisplay = data[i][0];
      infoToDisplay1 = "%GDP Service 2007 : "+data[i][3];
      infoToDisplay2 = "\n%GDP Industry 2007 is "+ data[i][2];
      infoToDisplay3 = " \n%GDP Agriculture2007 is " + data[i][1] 
      +"\nHDI 2007 : " + HDI[i];
      infoToDisplay4 = "\nChildren per women : "+ data[i][4]
      + "\nlife expectancy : "+life[i];
      infoToDisplay= infoToDisplay1+infoToDisplay2+infoToDisplay3+infoToDisplay4;
      labelX = x[i];
      labelY = y[i];
      break;
    }
  }
  redraw();
}


/*
a list of all methods available for the Range Controller
use ControlP5.printPublicMethodsFor(Range.class);
to print the following list into the console.

You can find further details about class Range in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


controlP5.Range : Range setArrayValue(float[]) 
controlP5.Range : Range setColorCaptionLabel(int) 
controlP5.Range : Range setColorTickMark(int) 
controlP5.Range : Range setColorValueLabel(int) 
controlP5.Range : Range setHandleSize(int) 
controlP5.Range : Range setHeight(int) 
controlP5.Range : Range setHighValue(float) 
controlP5.Range : Range setHighValueLabel(String) 
controlP5.Range : Range setLowValue(float) 
controlP5.Range : Range setLowValueLabel(String) 
controlP5.Range : Range setMax(float) 
controlP5.Range : Range setMin(float) 
controlP5.Range : Range setNumberOfTickMarks(int) 
controlP5.Range : Range setRange(float, float) 
controlP5.Range : Range setRangeValues(float, float) 
controlP5.Range : Range setWidth(int) 
controlP5.Range : Range showTickMarks(boolean) 
controlP5.Range : Range snapToTickMarks(boolean)
controlP5.Range : ArrayList getTickMarks() 
controlP5.Range : float getHighValue() 
controlP5.Range : float getLowValue() 
controlP5.Range : float[] getArrayValue()
controlP5.Controller : CColor getColor() 
controlP5.Controller : ControlBehavior getBehavior() 
controlP5.Controller : ControlWindow getControlWindow() 
controlP5.Controller : ControlWindow getWindow() 
controlP5.Controller : ControllerProperty getProperty(String) 
controlP5.Controller : ControllerProperty getProperty(String, String) 
controlP5.Controller : Label getCaptionLabel() 
controlP5.Controller : Label getValueLabel() 
controlP5.Controller : List getControllerPlugList() 
controlP5.Controller : PImage setImage(PImage) 
controlP5.Controller : PImage setImage(PImage, int) 
controlP5.Controller : PVector getAbsolutePosition() 
controlP5.Controller : PVector getPosition() 
controlP5.Controller : Range addCallback(CallbackListener) 
controlP5.Controller : Range addListener(ControlListener) 
controlP5.Controller : Range bringToFront() 
controlP5.Controller : Range bringToFront(ControllerInterface) 
controlP5.Controller : Range hide() 
controlP5.Controller : Range linebreak() 
controlP5.Controller : Range listen(boolean) 
controlP5.Controller : Range lock() 
controlP5.Controller : Range plugTo(Object) 
controlP5.Controller : Range plugTo(Object, String) 
controlP5.Controller : Range plugTo(Object[]) 
controlP5.Controller : Range plugTo(Object[], String) 
controlP5.Controller : Range registerProperty(String) 
controlP5.Controller : Range registerProperty(String, String) 
controlP5.Controller : Range registerTooltip(String) 
controlP5.Controller : Range removeBehavior() 
controlP5.Controller : Range removeCallback() 
controlP5.Controller : Range removeCallback(CallbackListener) 
controlP5.Controller : Range removeListener(ControlListener) 
controlP5.Controller : Range removeProperty(String) 
controlP5.Controller : Range removeProperty(String, String) 
controlP5.Controller : Range setArrayValue(float[]) 
controlP5.Controller : Range setArrayValue(int, float) 
controlP5.Controller : Range setBehavior(ControlBehavior) 
controlP5.Controller : Range setBroadcast(boolean) 
controlP5.Controller : Range setCaptionLabel(String) 
controlP5.Controller : Range setColor(CColor) 
controlP5.Controller : Range setColorActive(int) 
controlP5.Controller : Range setColorBackground(int) 
controlP5.Controller : Range setColorCaptionLabel(int) 
controlP5.Controller : Range setColorForeground(int) 
controlP5.Controller : Range setColorValueLabel(int) 
controlP5.Controller : Range setDecimalPrecision(int) 
controlP5.Controller : Range setDefaultValue(float) 
controlP5.Controller : Range setHeight(int) 
controlP5.Controller : Range setId(int) 
controlP5.Controller : Range setImages(PImage, PImage, PImage) 
controlP5.Controller : Range setImages(PImage, PImage, PImage, PImage) 
controlP5.Controller : Range setLabelVisible(boolean) 
controlP5.Controller : Range setLock(boolean) 
controlP5.Controller : Range setMax(float) 
controlP5.Controller : Range setMin(float) 
controlP5.Controller : Range setMouseOver(boolean) 
controlP5.Controller : Range setMoveable(boolean) 
controlP5.Controller : Range setPosition(PVector) 
controlP5.Controller : Range setPosition(float, float) 
controlP5.Controller : Range setSize(PImage) 
controlP5.Controller : Range setSize(int, int) 
controlP5.Controller : Range setStringValue(String) 
controlP5.Controller : Range setUpdate(boolean) 
controlP5.Controller : Range setValueLabel(String) 
controlP5.Controller : Range setView(ControllerView) 
controlP5.Controller : Range setVisible(boolean) 
controlP5.Controller : Range setWidth(int) 
controlP5.Controller : Range show() 
controlP5.Controller : Range unlock() 
controlP5.Controller : Range unplugFrom(Object) 
controlP5.Controller : Range unplugFrom(Object[]) 
controlP5.Controller : Range unregisterTooltip() 
controlP5.Controller : Range update() 
controlP5.Controller : Range updateSize() 
controlP5.Controller : String getAddress() 
controlP5.Controller : String getInfo() 
controlP5.Controller : String getName() 
controlP5.Controller : String getStringValue() 
controlP5.Controller : String toString() 
controlP5.Controller : Tab getTab() 
controlP5.Controller : boolean isActive() 
controlP5.Controller : boolean isBroadcast() 
controlP5.Controller : boolean isInside() 
controlP5.Controller : boolean isLabelVisible() 
controlP5.Controller : boolean isListening() 
controlP5.Controller : boolean isLock() 
controlP5.Controller : boolean isMouseOver() 
controlP5.Controller : boolean isMousePressed() 
controlP5.Controller : boolean isMoveable() 
controlP5.Controller : boolean isUpdate() 
controlP5.Controller : boolean isVisible() 
controlP5.Controller : float getArrayValue(int) 
controlP5.Controller : float getDefaultValue() 
controlP5.Controller : float getMax() 
controlP5.Controller : float getMin() 
controlP5.Controller : float getValue() 
controlP5.Controller : float[] getArrayValue() 
controlP5.Controller : int getDecimalPrecision() 
controlP5.Controller : int getHeight() 
controlP5.Controller : int getId() 
controlP5.Controller : int getWidth() 
controlP5.Controller : int listenerSize() 
controlP5.Controller : void remove() 
controlP5.Controller : void setView(ControllerView, int) 
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 


*/



