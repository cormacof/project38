void mousePressed(){
  int event;
  for (int i = 0; i < myWidgets.size(); i++) {
    Widget myWi = (Widget)myWidgets.get(i);
    event = myWi.getEvent(mouseX, mouseY);
   switch(event){
    case button1:
      current_query = query1;
      results=query1();
      break;
    case button2:
      current_query = query2;
      results=query2();
      break;
    }
  }
}
