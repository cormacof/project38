class Screen {
  void setup() {
    
    size(940,940);
    
  }
ArrayList screenWidgets;
color screenColor;
Screen(color screenColor){
screenWidgets=new ArrayList();
this.screenColor=screenColor;
}
void add(Widget w){
screenWidgets.add(w);
}
void draw(){
background(screenColor);
for(int i = 0; i<screenWidgets.size(); i++){
Widget aWidget = (Widget)screenWidgets.get(i);
aWidget.draw();
}
}
int getEvent(int mx, int my){
for(int i = 0; i<screenWidgets.size(); i++){
Widget aWidget = (Widget) screenWidgets.get(i);
int event = aWidget.getEvent(mouseX,mouseY);
if(event != EVENT_NULL){
return event;
}
}
return EVENT_NULL;
}
}
