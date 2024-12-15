var mylist=[1,2,4,5,8,9,30,20,77,200];

void main() {
  
  for(var num in mylist){
    switch(num % 2){
      case 0:
        print("$num is even");
        break;
      case 1:
        print("$num is odd");
        break;
        
    }
  }
  
}
