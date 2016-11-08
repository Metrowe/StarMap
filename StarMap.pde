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
  fill(255,0,255);
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

void drawStars()
{
  
  //////country.get(i).amount
  float sx,sy,ss;
  
  stroke(255,0,255);
  fill(255,0,255);
  
  textAlign(LEFT,CENTER);
  
  for(int i = 0;i < stars.size();i++)
  {
    
    //stars.get(i).Xg;
    //stars.get(i).Yg;
    
    sx = map(stars.get(i).Xg,  -5,5,  border,(width-border));
    sy = map(stars.get(i).Yg,  -5,5,  border,(height-border));
    //ss = map(stars.get(i).size,  -5,5,  border,(width-border));
    ss = stars.get(i).size;
    
    stroke(255,255,0);
    line(sx+width*0.003,sy,  sx-width*0.003,sy);
    line(sx,sy+width*0.003,  sx,sy-width*0.003);
    
    stroke(255,0,0);
    noFill();
    ellipse(sx,sy,  ss,ss);
    
    fill(255);
    
    text(stars.get(i).name,sx+width*0.01,sy);
    
    
    /*
    line(gx,border,  gx,(height-border));
    line(border,gy,  (width-border),gy);
    
    text(p,  gx, border*0.5);
    text(p,  border*0.5, gy);
    */
  }//end for
}//end drawStars

void draw()
{
  background(0);
  grid();
  drawStars();
}//end draw