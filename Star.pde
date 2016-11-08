class Star
{
  int hab;
  String name;
  float distance;
  float Xg, Yg, Zg;
  float size;
  
  
  Star(TableRow row)
  {
    hab = row.getInt(2);
    name = row.getString(3);
    distance = row.getFloat(12);
    Xg = row.getFloat(13);
    Yg = row.getFloat(14);
    Zg = row.getFloat(15);
    size = row.getFloat(16);
  }//end GDP
  
  String tostring()
  {
    return hab + " " + name + " " + distance + " " + Xg + " " + Yg + " " + Zg + " " + size;
  }//end toString
}//end class cash