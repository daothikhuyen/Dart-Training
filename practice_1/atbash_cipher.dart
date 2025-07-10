
class AtbashCipher {
  Map<String,String> alphabet = {
    "a" : "z",
    "b" : "y",
    "c" : "x",
    "d" : "w",
    "e" : "v",
    "f" : "u",
    "g" : "t",
    "h" : "s",
    "i" : "r",
    "j" : "q",
    "k" : "p",
    "l" : "o",
    "m" : "n",
    "n" : "m",
    "o" : "l",
    "p" : "k",
    "q" : "j",
    "r" : "i",
    "s" : "h",
    "t" : "g",
    "u" : "f",
    "v" : "e",
    "w" : "d",
    "x" : "c",
    "y" : "b",
    "z" : "a",
    '1' : '1',
    '2' : '2',
    '3' : '3',
    '4' : '4',
    '5' : '5',
    '6' : '6',
    '7' : '7',
    '8' : '8',
    '9' : '9',
    '0' : '0',
    ' ' : ' ',
  };
  
  String encode(String text) {
    String raw = _convert(text.toLowerCase());

    // Divide into groups of 5 characters
    List<String> grouped = [];
    for (int i = 0; i < raw.length; i += 5) {
      int end = (i + 5 < raw.length) ? i + 5 : raw.length;
      grouped.add(raw.substring(i, end));
    }

    //Concatenate the elements in the group list into a string
    return grouped.join(' ');
  }

  String decode(String text) {
    return _convert(text.toLowerCase());
  }

  
  String _convert(String text) {
  
    List<String> textList = text.toLowerCase().split('');
    String encrypted = "";

    for(var char in textList){
      if(this.alphabet.containsKey(char) && char != ' '){
        encrypted += this.alphabet[char]!;
      }
    }

    return encrypted;

  }
}

void main(){
  final atbashCipher = AtbashCipher();
  
  print(atbashCipher.encode("The quick brown fox jumps over the lazy dog."));  
  print(atbashCipher.decode("bvh"));         // => yes

  
}

