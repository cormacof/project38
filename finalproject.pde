PImage img;
PFont stdFont;
final int EVENT_BUTTON1=1; final int EVENT_FORWARD=2;
final int EVENT_BUTTON2=3; final int EVENT_BACKWARD=4;
final int EVENT_JAN=5; final int EVENT_APRIL=6;
final int EVENT_DELAYS=7; final int EVENT_EARLY=8;
final int EVENT_NULL=0;
Screen currentScreen, screen1, screen2, screen3, screen4, screen5, screen6;
Widget widget1, widget2, widget3, widget4, widget5, widget6, widget7, widget8;
data theData;
 ArrayList<data> ref = new ArrayList();
  ArrayList<data> al=new ArrayList();
  ArrayList<data> JFK = new ArrayList();
  ArrayList<data> LAX= new ArrayList();
  ArrayList<data> FLL = new ArrayList();
  ArrayList<data> DCA = new ArrayList();
  ArrayList<data> SEA = new ArrayList();
  int jfkCount = 0;
  int laxCount =0;
  int fllCount =0;
  int dcaCount =0;
  int seaCount =0;
  
  int [] flights3 = new int[5];
  String [] airports = new String[] {"JFK", "LAX", "FLL", "DCA", "SEA"};
  
  int margin, graphHeight;
  int xSpacer;
  PVector[] positions = new PVector [5];
   
  int overallMin;
  int overallMax;
    
  
  int [] delay = new int[2000];
   int [] totalSchedMins = new int[2000];
   int[] totalActMins = new int[2000];
  
  int cancelledCount1, cancelledCount2;
   
  
  
void setup(){
  img = loadImage("plane3.jpg");
  String[] flights = loadStrings("flights.csv");
  
 // Table theData = loadTable("flights.csv", "header");
 //print(flights);
  for (int i = 0 ; i < flights.length; i++) {
  String [] thisRow = split(flights[i], ',');
  String [] thisvalue = split(thisRow[4],'"');
  data d = new data();
  if(thisvalue.length>1){d.country= thisvalue[1];}
  else{d.country= thisvalue[0];}
  d.date=thisRow[0];
  d.airport=thisRow[3];
  d.scheddeptime = thisRow[13];
  d.actdeptime = thisRow[14];
   d.cancelledFlights = thisRow[17];
  al.add(d);
  }
  
  
  
   for(int i=0;i<al.size();i++){
   // print(al.get(i).country+"  ");
    //if(al.get(i).airport.equals("JFK")){ref.add(al.get(i));
  
    if(al.get(i).date.equals("01/01/2022 00:00") || al.get(i).date.equals("01/02/2022 00:00") || al.get(i).date.equals("01/03/2022 00:00")){ref.add(al.get(i));}
    
   // else if(al.get(i).date.equals("01/04/2022 00:00") || al.get(i).date.equals("01/05/2022 00:00") || al.get(i).date.equals("01/06/2022 00:00")){ref.add(al.get(i));}
   
  }
    
    for(int i=0;i<ref.size();i++){
      
  // print(ref.get(i).date + " ");
  // println(ref.get(i).cancelledFlights);
   //text(ref.get(i).country+"  ", 30, 30);
   if(ref.get(i).cancelledFlights.equals("1")) 
   {
     cancelledCount1++;
     //println(cancelledCount1);
     }
 
    }
    
    
    
    
    
    for(int i=0;i<al.size();i++){
   // print(al.get(i).country+"  ");
    //if(al.get(i).airport.equals("JFK")){ref.add(al.get(i));
  
    if(al.get(i).date.equals("01/04/2022 00:00") || al.get(i).date.equals("01/05/2022 00:00") || al.get(i).date.equals("01/06/2022 00:00")){ref.add(al.get(i));}
    
   // else if(al.get(i).date.equals("01/04/2022 00:00") || al.get(i).date.equals("01/05/2022 00:00") || al.get(i).date.equals("01/06/2022 00:00")){ref.add(al.get(i));}
   
  }
    for(int i=0;i<ref.size();i++){
      
  // print(ref.get(i).date + " ");
 //  println(ref.get(i).cancelledFlights);
   //text(ref.get(i).country+"  ", 30, 30);
   if(ref.get(i).cancelledFlights.equals("1")) 
   {
     cancelledCount2++;
     //println(cancelledCount2);
     }
 
    }
    
  cancelledCount2 = cancelledCount2 - cancelledCount1;
 // println(cancelledCount1);
 // println(cancelledCount2);
  
  
  
  
  
    for(int i =1; i<2000; i++)
  {
    
 if(al.get(i).scheddeptime.length()>3) {
  int schedHours = Integer.parseInt(al.get(i).scheddeptime.substring(0, 2));
  if(schedHours%10 ==0)
  {
    schedHours/=10;
    
  }

int  schedMinutes = Integer.parseInt(al.get(i).scheddeptime.substring(2));
totalSchedMins[i] = (schedHours*60) + schedMinutes;
//print(schedHours);
 //println(schedMinutes);
 }
 else if(al.get(i).scheddeptime.length()<3)
 {
   int schedHours=0;
   int schedMinutes = int(al.get(i).scheddeptime);
    totalActMins[i] = (schedHours*60) + schedMinutes;
 }
 else 
{
   int schedHours = Integer.parseInt(al.get(i).scheddeptime.substring(0, 1));
  int schedMinutes = Integer.parseInt(al.get(i).scheddeptime.substring(1));
  totalSchedMins[i] = (schedHours*60) + schedMinutes;
 //print(schedHours);
 //println(schedMinutes);
  //println(totalSchedMins);
}

  }
  
  
  
  
  for(int i =1; i<2000; i++)

  {
    try {
    
   // if(al.get(i).actdeptime.length()==0) 
   // {
    //  int actHours =Integer.parseInt(al.get(i).actdeptime.substring(0));
     //  int actMinutes = Integer.parseInt(al.get(i).actdeptime.substring(0));
     // delay=-1.33;
    //}
 if(al.get(i).actdeptime.length()>3) {
  int actHours =Integer.parseInt(al.get(i).actdeptime.substring(0, 2));
  if(actHours%10 ==0)
  {
    actHours/=10;
    
  
 }
 
  int actMinutes = Integer.parseInt(al.get(i).actdeptime.substring(2));
  totalActMins[i] = (actHours*60) + actMinutes;
     // print(actHours);
  //println(actMinutes);
  
    
 }
 
 else if(al.get(i).actdeptime.length()<3)
 {
   int actHours=0;
   int actMinutes = int(al.get(i).actdeptime);
    totalActMins[i] = (actHours*60) + actMinutes;
 }
 
 else 
{
   int actHours = Integer.parseInt(al.get(i).actdeptime.substring(0, 1));
 int  actMinutes = Integer.parseInt(al.get(i).actdeptime.substring(1));
  totalActMins[i] = (actHours*60) + actMinutes;
   
 //println(totalActMins);
   //print(actHours);
  //println(actMinutes);
}

  
  }
  
  catch(StringIndexOutOfBoundsException exception)
  {
    totalActMins[i] = 0;
    totalSchedMins[i] = 0;
    
  }
 
  //print(schedHours);
 //println(schedMinutes);
  delay[i] = totalActMins[i] -  totalSchedMins[i];
  
  //println(delay);
  
}
 

delay = sort(delay);
for(int i=1995; i<2000; i++)
{
//print(delay[i] + " ");
//println(al.get(i).airport);
}
 //println(delay);
  
  
  
  
  
  
  for(int i=0;i<al.size();i++){
   // print(al.get(i).country+"  ");
   // if(al.get(i).airport.equals("JFK")){ref.add(al.get(i));
  
    //if(al.get(i).airport.equals("JFK") || al.get(i).airport.equals("LAX") || al.get(i).airport.equals("FLL")){ref.add(al.get(i));}
    if(al.get(i).airport.equals("JFK")){jfkCount++;  ref.add(al.get(i));}
    if(al.get(i).airport.equals("LAX")){laxCount++; ref.add(al.get(i));}
    if(al.get(i).airport.equals("FLL")){fllCount++; ref.add(al.get(i));}
    if(al.get(i).airport.equals("DCA")){dcaCount++; ref.add(al.get(i));}
    if(al.get(i).airport.equals("SEA")){seaCount++; ref.add(al.get(i));}
    
    
}

   
   for(int i =0; i<flights3.length; i++)
   {
    // println(ref.get(i).airport);
   //  print(flights3[i]+" ");
   }

    margin = 50;
    graphHeight = (height - margin) - margin;
    xSpacer = (width - margin -margin)/4;
   flights3[0] = jfkCount;
   flights3[1] = laxCount;
   flights3[2] = fllCount;
   flights3[3] = dcaCount;
   flights3[4] = seaCount;
   for(int i =0; i<flights3.length; i++)
   {
   // println(flights3[i]);
   }
     overallMin = min(flights3);
     overallMax = max(flights3);
  //println(overallMax);
  
   for(int i =0; i<flights3.length; i++)
   {
    float adjScore = map(flights3[i], overallMin, overallMax, 0, graphHeight);
    float yPos = height - margin - adjScore;
    float xPos = margin + (xSpacer*i);
    positions[i] = new PVector(xPos, yPos);
  
    }
    
 
//Widget widget1, widget2, widget3, widget4, widget5, widget6;
stdFont=loadFont("stdFont.vlw");
textFont(stdFont);
widget1=new Widget(100, 100, 180, 40,"sort by airport", color(200, 200, 0), stdFont, EVENT_BUTTON1);
widget2=new Widget(100, 200, 180, 40,
"sort by delays", color(0, 200, 0), stdFont, EVENT_FORWARD);
widget7=new Widget(100, 250, 180, 40,
"biggest delays", color(0, 200, 0), stdFont, EVENT_DELAYS);
widget8=new Widget(100, 300, 180, 40,
"earliest takeoffs ", color(0, 200, 0), stdFont, EVENT_EARLY);

widget3=new Widget(100, 350, 180, 40,
"sort by date", color(0,200,200), stdFont, EVENT_BUTTON2);
widget4=new Widget(100, 10, 180, 40,
"backward", color(2000,200,200), stdFont, EVENT_BACKWARD);
widget5=new Widget(100, 400, 180, 40,
"JAN-MARCH", color(0,200,200), stdFont, EVENT_JAN);
widget6=new Widget(100, 450, 180, 40,
"APRIL-JUNE", color(0,200,200), stdFont, EVENT_APRIL);

size(400, 400);
screen1 = new Screen(color(255));
screen2 = new Screen(color(100));
screen3 = new Screen(color(100));
screen4 = new Screen(color(100));
screen5 = new Screen(color(100));
screen6 = new Screen(color(100));
screen1.add(widget1);
screen1.add(widget2);
screen1.add(widget3);

screen2.add(widget4);
screen3.add(widget4);
screen4.add(widget4);
screen5.add(widget4);
screen6.add(widget4);


//screen2.add(widget4);
currentScreen = screen1;
 

}

void draw(){
currentScreen.draw();
if(currentScreen==screen1)
{
  
  
  text("Flight information", 500, 200);
  
}

if(currentScreen==screen5)
{
  //textSize(30);
  text("There were " + cancelledCount2 + " cancelled flights between the first of April and 30th of June", 80, 250);
  
  
}



if(currentScreen==screen4)
{
  // textSize(30);
  text("There were " + cancelledCount1 + " cancelled flights between the first of January and 31st of March", 80, 250);
  
}


if(currentScreen==screen1)
{
image(img, 200, 500);
}
if(currentScreen ==screen3)
{

    stroke(255);
    for(int i=0; i<flights3.length; i++)
    {
      
      ellipse(positions[i].x , positions[i].y, 15, 15);
      line(positions[i].x, margin, positions[i].x, height-margin);
      text(airports[i], positions[i].x -15, height - margin + 20);
    }
    
    text(overallMax, 5, margin);
    text(overallMin, 5, height-margin);
}


if(currentScreen ==screen2)
{
  
   //background(0);
    stroke(0);
    fill(255);
   // textSize(40);
    int j = 0;
    for(int i=1995; i<2000; i++)
    {
      
      float multiplier = 1;
      float rectWidth = width/5;
      float ypos = height - (delay[i]/2);
      rect((rectWidth*j), ypos, rectWidth, delay[i]*multiplier ); //(delay[i]*multiplier) );
     // println(delay[i]);
      text(delay[i], rectWidth*j, ypos);
      text(al.get(i).airport, rectWidth*j, ypos -100);
       text("Minutes Late:", rectWidth*j, ypos-50);
      text("Airport:", rectWidth*j, ypos -150);
      //println(delay[i]);
      j++;
    }
}


    if(currentScreen ==screen6)
{
  delay = sort(delay);
  //int [] delay1 = reverse(delay);
  //println(delay);
   //background(0);
    stroke(0);
    fill(255);
    //textSize(40);
    int j = 0;
    for(int i=1; i<6; i++)
    {
      //println(delay[i]);
      float multiplier = 1;
      float rectWidth = width/5;
      float ypos = height - (delay[i]/2*-1);
      rect((rectWidth*j), ypos, rectWidth, delay[i]*multiplier*-1 ); //(delay[i]*multiplier) );
      //println(delay[i]);
      text((delay[i]*-1), rectWidth*j, ypos-30);
      text(al.get(i).airport, rectWidth*j, ypos -120);
      //fill(255,200,200);
      text("Minutes Early:", rectWidth*j, ypos-80);
      text("Airport:", rectWidth*j, ypos -170);
      //println(delay[i]);
      j++;
    }
    
    
    
    

  
  
  
  
  
  
  
  
}




}
void mousePressed(){
switch(currentScreen.getEvent(mouseX, mouseY)) {
case EVENT_BUTTON1:
println("button 1!"); 
currentScreen = screen3;
for(int i=0;i<al.size();i++){
    //print(al.get(i).country+"  ");
  // if(al.get(i).airport.equals("JFK")){ref.add(al.get(i));}
  ref.add(al.get(i));
}
    for(int i=0;i<ref.size();i++){
      fill(100);
      text("hello", 90, 90);
    text(ref.get(i).airport, 90, 90);
  // printArray(ref.get(i).airport);
  // printArray(ref.get(i).country);
    }
    
  

break;
case EVENT_BUTTON2:
println("button 2!");
screen1.add(widget5);
screen1.add(widget6);
//currentScreen = screen4;
break;
case EVENT_FORWARD:
//println("sort by date"); 
screen1.add(widget7);
screen1.add(widget8);
//currentScreen = screen2;
for(int i=0;i<al.size();i++){
   // print(al.get(i).country+"  ");
    //if(al.get(i).airport.equals("JFK")){ref.add(al.get(i));
  
    if(al.get(i).date.equals("01/01/2022 00:00") || al.get(i).date.equals("01/02/2022 00:00") || al.get(i).date.equals("01/03/2022 00:00")){ref.add(al.get(i));}
    
    else if(al.get(i).date.equals("01/04/2022 00:00") || al.get(i).date.equals("01/05/2022 00:00") || al.get(i).date.equals("01/06/2022 00:00")){ref.add(al.get(i));}
  }
    
    for(int i=0;i<ref.size();i++){
      
   //printArray(ref.get(i).date);
   //text(ref.get(i).country+"  ", 30, 30);
 
    }


break;
case EVENT_BACKWARD:
println("backward"); currentScreen = screen1;
break;
case EVENT_JAN:
currentScreen = screen4;
break;
case EVENT_APRIL:
currentScreen = screen5;
break;
case EVENT_DELAYS:
currentScreen = screen2;
break;
case EVENT_EARLY:
currentScreen = screen6;
break;
}


    
  

}
