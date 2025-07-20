class EggCounter {

  int count(int number) {

    // Convert integer to binary string
    String binary = number.toRadixString(2);

    // Count the number of 1's in a string
    int eggCount = binary.split('').where((char) => char == '1').length;

    return eggCount;
  }

}

void main(){
  final eggCounter = EggCounter();
  
  print(eggCounter.count(2000000000));  // 13 eggs
}
