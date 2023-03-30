data theData;
 ArrayList<data> ref = new ArrayList();
  ArrayList<data> al=new ArrayList();
void setup() {
  size(640,360);
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
  al.add(d);
  }
  
  for(int i=0;i<al.size();i++){
   // print(al.get(i).country+"  ");
    //if(al.get(i).airport.equals("JFK")){ref.add(al.get(i));
  
    if(al.get(i).date.equals("01/01/2022 00:00") || al.get(i).date.equals("01/02/2022 00:00") || al.get(i).date.equals("01/03/2022 00:00")){ref.add(al.get(i));}
    
  }
    
    for(int i=0;i<ref.size();i++){
   print(ref.get(i).date+"  ");
   print(ref.get(i).country+"  ");
    }
}
