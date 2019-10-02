float r() {
  return random(1);
}
float r(float x) {
  return random(x);
}
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) 
    return file.list();
  else
    return null;
}
PFont[] a;
int time;

void setup() {
  size(1440, 1080, P3D);
  frameRate(10);
  String name[]=listFileNames(sketchPath()+"/data");
  a=new PFont[name.length];
  time=millis();
  println("  loaded "+name.length+" fonts:");
  for (int i=0; i<name.length; i++) {
    a[i]=loadFont(name[i]);
    println(name[i]);
  }
  println("  in "+(millis()-time)+"ms.");
}
void draw() {     
  if (r()<0.10)fill(0, 2, 242, 255);
  if (r()<0.10)fill(255, 84, 0, 255);
  if (r()<0.70)background(0);
  if (r()<0.40)textFont(a[round(r(5))]);
  textSize(160);
  textAlign(CENTER, BOTTOM);
  text("Посвят ФПМИ", width/2, height*0.45);
  textSize(120);
  textAlign(CENTER, TOP);
  text("07.10.19", width/2, height*0.65);
  if (r()<0.8)
    for (int i=0; i<int(r(50)+20); i++) {
      int x0=(int)r(0.9*width);
      int x1=(int)r(0.2*width);
      int y0=(int)(height*0.3+r(0.4*height));
      int y1=(int)(r(30)+10);
      pushMatrix();
      translate(r(6)-3, r(6)-3, r(6)-3);
      rotateX(r(0.2)-0.1);
      rotateY(r(0.2)-0.1);
      fill(0);
      if (r()<0.70) rect(x0+round(r(5)-2.5)*(int)r(40)-20, y0+(int)r(40)-20, x1, y1);
      copy(x0, y0, x1, y1, x0+round(r(5)-2.5)*(int)r(40)-20, y0+(int)r(40)-20, x1, y1);
      popMatrix();
    }
  fill(128);
  translate(0, 0, 100);
  int step=round(r(3)+2);
  for (int i=0; i<height/step; i++)
    line(0, frameCount%step+i*step, width, frameCount%step+i*step);
  fill(255, 255, 255);
}
