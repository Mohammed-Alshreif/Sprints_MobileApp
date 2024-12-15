var mylist=[1,2,-4,5,8,9,-30,20,77,-200];

void main() {
  
  for(var num in mylist){
    switch(num % 2){
      case 0:
        
        if(num<0){
          print("$num is even- negative");
        }
        else{
          print("$num is even- positive");
        }
        break;
      case 1:
        if(num<0){
          print("$num is odd - negative");
        }
        else{
          print("$num is odd - positive");
        }
        break;
        
    }
  }
  
}
