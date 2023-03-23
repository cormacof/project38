  data theData;
void setup() {
  size(640,360);
  String[] flights = loadStrings("flights.csv");
 // Table theData = loadTable("flights.csv", "header");
  for (int i = 0 ; i < flights.length; i++) {
  println(flights[i]);
  
  }
  
}


void draw() {
  
  
  
  
}
