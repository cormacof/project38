class data {
  String date;
  String airport;
  String country;
  String scheddeptime;
  String actdeptime;
  String cancelledFlights;
  data() {
    
    
  }
  
  public void loadData(String date1, String airport1, String country1, String scheddeptime1, String actdeptime1, String cancelledFlights1){
    
    date = date1;
    airport = airport1;
    country = country1;
    scheddeptime = scheddeptime1;
    actdeptime = actdeptime1;
    cancelledFlights = cancelledFlights1;
  }
  
  
  
  
}
