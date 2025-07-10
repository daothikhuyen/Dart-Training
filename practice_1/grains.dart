BigInt square(final int n) {

  if(n < 1 || n > 64)
    throw 'square must be between 1 and 64';
  return BigInt.two.pow(n - 1);
}

BigInt total() {

  BigInt total = BigInt.zero;
  for(int i = 1 ; i <= 64; i++){
    total += BigInt.two.pow(i-1);
  }
  return total;
}

void main(){

  final squareTests = square(0);
  print('Grains: square - ' + squareTests.toString());


  final totalTests = total();
  print('Grains: total - ' + totalTests.toString());

}