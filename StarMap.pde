/*
Name: Emmet Rowe
Student No: C15384676
*/

void setup()
{
  size(800,800);
  
  loadData();
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

void draw()
{
  
}//end draw