
class DifferenceOfSquares {

  int squareOfSum(int n){
    int sum = 0;

    for(int i = 1; i <= n; i++){
      sum+=i;
    };

    return sum*sum;
  }

  int sumOfSquares(int n){
    int sum = 0;

    for(int i = 1; i <= n; i++){
      sum+= i*i;
    }
    return sum;
  }

  int differenceOfSquares(int n){
    return squareOfSum(n) - sumOfSquares(n);
  }
}

void main(){
  final differenceOfSquares = DifferenceOfSquares();

  int squareOfSum = differenceOfSquares.squareOfSum(10);
  int sumOfSquares = differenceOfSquares.sumOfSquares(10);
  int result = differenceOfSquares.differenceOfSquares(10);

  print('DifferenceOfSquares: Square the sum of the numbers up to the given number - ${squareOfSum}');
  print('DifferenceOfSquares: Sum the squares of the numbers up to the given number - ${sumOfSquares}');
  print('DifferenceOfSquares: Subtract sum of squares from square of sums - ${result}');
}