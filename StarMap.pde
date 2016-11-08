/*
Name: Emmet Rowe
Student No: C15384676
*/

void setup()
{
  size(500,500);
  /////////////////////////////////////////////size(800,800);
  loadData();
  printStars();
}//end setup

ArrayList<Star> stars = new ArrayList<Star>();

float border = 50;
int split = 11;

void loadData()
{
  Table t = loadTable("rawdata.csv");
  
  for(int i = 0 ; i < t.getRowCount(); i ++)
  {
    TableRow row = t.getRow(i);
    Star local = new Star(row);
    stars.add(local);
  }//end for
}//end loaDdata

void printStars()
{
  for(int i = 0;i < stars.size();i++)
  {
    Star s = stars.get(i);
    String str = s.tostring();
    println(str);
  }//end for
}//end printStars

void grid()
{
  float gx,gy;
  
  stroke(255,0,255);
  //for(int i = 0,p = -5;p < 6;i++,p++)
  for(int p = -5;p < 6;p++)
  {
    gx = map(p,  -5,5,  border,(width-border));
    gy = map(p,  -5,5,  border,(height-border));
    
    line(gx,border,  gx,(height-border));
    line(border,gy,  (width-border),gy);
    
    text(p,  gx, border*0.5);
    text(p,  border*0.5, gy);
    
  }//end for
}//end grid

void draw()
{
  background(0);
  grid();
}//end draw