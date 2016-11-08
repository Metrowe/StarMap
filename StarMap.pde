/*
Name: Emmet Rowe
Student No: C15384676
Note: I took too long and did not start on last part for displaying distance between two points.
I would have used my calcDist method and had a text method display the data and star names at the bottom.
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
int select = 0;
float x1,y1,x2,y2;
//float x3,y3,x4,y4;


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
  
  textSize(13);
  textAlign(CENTER,CENTER);
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
  float sx,sy,ss;
  
  stroke(255,0,255);
  fill(255,0,255);
  
  textAlign(LEFT,CENTER);
  textSize(10);
  
  for(int i = 0;i < stars.size();i++)
  {
    sx = map(stars.get(i).Xg,  -5,5,  border,(width-border));
    sy = map(stars.get(i).Yg,  -5,5,  border,(height-border));
    ss = stars.get(i).size;
    
    stroke(255,255,0);
    line(sx+width*0.003,sy,  sx-width*0.003,sy);
    line(sx,sy+width*0.003,  sx,sy-width*0.003);
    
    stroke(255,0,0);
    noFill();
    ellipse(sx,sy,  ss,ss);
    
    fill(255);
    text(stars.get(i).name,sx+width*0.01,sy);
  }//end for
}//end drawStars

float calcDist(float a1,float b1,float a2,float b2)
{
  float o,a;

  o = a1 - a2;
  a = b1 - b2;
  
  if(o < 0)
  {
    o = -o;
  }//end if
  if(a < 0)
  {
    a = -a;
  }//end if
  
  return sqrt(  (o*o) + (a*a)  );
}//end calcDist

void showData()
{
  /*
  fill(255,255,0);
  if(select == 1)
  {
    line
  }//end if
  else if(select == 2)
  {
    
  }//end else if
  */
}//end drawLink

void drawLink()
{
  stroke(255,255,0);
  if(select == 1)
  {
    line(x1,y1,  mouseX,mouseY);
  }//end if
  else if(select == 2)
  {
    line(x1,y1,  x2,y2);
  }//end else if
}//end drawLink

void mouseClicked()
{
  float sx,sy,ss;
  if(select == 0)
  {
      for(int i = 0;i < stars.size();i++)
      {
        sx = map(stars.get(i).Xg,  -5,5,  border,(width-border));
        sy = map(stars.get(i).Yg,  -5,5,  border,(height-border));
        ss = stars.get(i).size;
        
        if(ss > calcDist(sx,sy,mouseX,mouseY))
        {
          x1 = sx;
          y1 = sy;
          select = 1;
          break;
        }//end if
      }//end for
  }//end if
  else if(select == 1)
  {
    for(int i = 0;i < stars.size();i++)
      {
        sx = map(stars.get(i).Xg,  -5,5,  border,(width-border));
        sy = map(stars.get(i).Yg,  -5,5,  border,(height-border));
        ss = stars.get(i).size;
        
        if(ss > calcDist(sx,sy,mouseX,mouseY))
        {
          x2 = sx;
          y2 = sy;
          select = 2;
          break;
        }//end if
      }//end for
        
  }//end else if
  else if(select == 2)
  {
    select = 0;
  }//end else if
}//end mouseClicked

void draw()
{
  background(0);
  grid();
  drawStars();
  drawLink();
  showData();
}//end draw