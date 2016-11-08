/*
Name: Emmet Rowe
Student No: C15384676
*/

void setup()
{
  size(800,800);
  
  loadData();
  printStars();
}//end setup

ArrayList<Star> stars = new ArrayList<Star>();

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

void draw()
{
  
}//end draw