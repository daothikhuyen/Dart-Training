class Leap{
  bool leapYear(int year){
    return (year % 4 == 0) && ((year % 100) != 0 ||(year % 400==0));
  }
}

void main(){
  int year = 2000;
  
  final leap = Leap();
  if(!leap.leapYear(year)){
    print("$year was not a leap year");
  }else{
    print("$year was a leap year");
  };
}