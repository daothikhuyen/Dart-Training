
class Etl {
  Map<String, int> transform(Map<String, List<String>> legacy) {
    Map<String, int> expected = {};

    for (var scoreString in legacy.keys) {
      final score = int.parse(scoreString);
      final letters = legacy[scoreString];

      if (letters != null) {
        for (var letter in letters) {
          expected[letter.toLowerCase()] = score;
        }
      }
    }

    return expected;
  }
}

void main(){
  final etl = Etl();

  Map<String,List<String>> legacy = { '1': ["A", "E", "I", "O", "U"]};

  print("Test - Single score with multiple letters:\n" + etl.transform(legacy).toString());

  legacy = {
    "1": ["A", "E"],
    "2": ["D", "G"]
  };

  print("Test - Multiple scores with multiple letters:\n" + etl.transform(legacy).toString());
}