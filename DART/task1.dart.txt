var groceryitems={
    "Milk":10,
    "Meat":20,
    "vegetable":5,
    "fruit":5
  };
const double taxes=.1;
void main() {
  double totalpric=0;
  
  for(var item in groceryitems.entries){
    totalpric+=item.value;
  }
  print("total price $totalpric \$");
  print("total price ${totalpric+totalpric*taxes} \$");
  
  
}
