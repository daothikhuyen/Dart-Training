int score(String name){
  final nameSplit = name.toUpperCase().split('');
  int point = 0;

  for(var i in nameSplit){
    switch(i){
      case 'A' || 'E'|| 'I'|| 'O'|| 'U'||'L'|| 'N'||'R'||'S'||'T':
        point = point + 1;
      case 'D'||'G':
        point = point + 2;
      case 'B'||'C'||'M'||'P':
        point = point + 3;
      case 'F'|| 'H'||'V'|| 'W'||'Y':
        point = point + 4;
      case 'K':
        point = point + 5;
      case 'J'||'X':
        point = point + 8;
      case 'Q'|| 'Z':
        point = point + 10;
      default:
        continue;
    };
  };
  return point;
}
void main() {
  print(score('Khuyen'));
}