void stackStart() {

  print("Started Main");
  functionOne();
  print("Finished Main");
}

void functionOne() {
  print("Started F01");
  
  try {
    functionTwo();
  }catch(exception, stackTrace) {
    print(stackTrace.toString());
    //print(exception.runtimeType);
  }
  
  print("Finished F01");
}

void functionTwo() {
  print("Started F02");
  for(int i=1; i<=5; i++) {
    print(i);
    
    double amount = double.parse("Not a number");
    
  }
  print("Finished F02");
}