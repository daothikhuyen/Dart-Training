class HighScores {
  // Put your code here
  final List<int> _scores;

  HighScores(List<int> scores): _scores = List.from(scores);

  List<int> get scores =>  List.unmodifiable(_scores);
  
  int latest () {
    return _scores.isNotEmpty ? _scores.last : 0;
  }
  
  int personalBest(){
    return _scores.isNotEmpty ? _scores.reduce((a, b) => a > b ? a : b) : 0;
  } 
  
  List<int> personalTopThree(){
    List<int> scored = List.from(scores)..sort((b,a) => a.compareTo(b));
    return scored.take(3).toList();
  }
  
}

void main(){
  int? personalBest = null; // null safety

  final scores = HighScores(<int>[30, 50, 20, 70]);

  personalBest = scores.personalBest();

  print('HighScores: high scores tests -' + personalBest.toString());
}