
class Proverb {
  String recite(List<String> pieces){
    if(pieces.isEmpty){
      return '';
    }

    final List<String> result = [];
    for(int i = 0 ; i < pieces.length - 1; i++){
      result.add('For want of a ${pieces[i]} the ${pieces[i+1]} was lost.');
    }

    result.add('And all for the want of a ${pieces.first}.');

    return result.join('\n');
  }
}

void main(){
  final proverb = Proverb();
  
  final pieces = ["nail", "shoe"];
  print(proverb.recite(pieces));
}