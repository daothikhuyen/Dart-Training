class ArmstrongNumbers {
  bool isArmstrongNumber(String num) {
    final BigInt armNum = BigInt.parse(num);
    if (armNum < BigInt.zero) return false;
    if (armNum == BigInt.zero) return true;

    final int numberOfDigits = num.length;
    BigInt sumOfPowers = BigInt.zero;

    for (int i = 0; i < num.length; i++) {
      final int digit = int.parse(num[i]);
      sumOfPowers += powBigInt(digit, numberOfDigits);
    }

    return sumOfPowers == armNum;
  }

  BigInt powBigInt(int base, int exponent) {
    BigInt result = BigInt.one;
    BigInt b = BigInt.from(base);
    for (int i = 0; i < exponent; i++) {
      result *= b;
    }
    return result;
  }
}

void main(){
  final armstrongNumbers = ArmstrongNumbers();

  print('Zero is an Armstrong number ${armstrongNumbers.isArmstrongNumber('0')}');
  print('Single-digit numbers are Armstrong numbers ${armstrongNumbers.isArmstrongNumber('5')}');
  print('There are no two-digit Armstrong numbers ${armstrongNumbers.isArmstrongNumber('10')}');
}
