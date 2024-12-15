var mylist=[1,2,-4,5,8,9,-30,20,77,-200,400];

void main() {
  
  print(minvalue(mylist));
  
}
int minvalue(var list){
  
   int minValue = list[0];

   for (int number in list) {
    if (number < minValue) {
      minValue = number;
    }
   }
     return minValue;
}
