
class WordCount {
  
  Map<String,int> countWords(String input){

    List<String> workList = input.toLowerCase()
        .split(RegExp(r"[^\w']")) 
        .map((w) =>  w.replaceAll(RegExp(r"^'|'$"), ""))
        .where((text) => text.isNotEmpty) //filter out non-empty elements
        .toList();
    
    Map<String,int> count ={};

    for(var work in workList){

      count[work] = (count[work] ?? 0) + 1;
    }

    return count;
  }
}

void main(){
  final wordCount = WordCount();

  print(wordCount.countWords("That's the password: 'PASSWORD 123'!, cried the Special Agent.\nSo I fled."));
}

Future<void> processData(String input) async {
  try {
    // Throws FormatException if input is not a number
    int value = int.parse(input);

    // Throws RangeError if the number is negative
    if (value < 0) {
      throw RangeError("Value must be >= 0");
    }

    await Future.delayed(Duration(seconds: 1));
    print("Valid value: $value");
  }
  on FormatException catch (e) {
    print("Format error: $e");
  }
  on RangeError catch (e) {
    print("Range error: $e");
  }
  // Catch all other errors
  catch (e, stackTrace) {
    print("Unknown error: $e");
    print("Stack trace: $stackTrace");
  }
  finally {
    print("Finished processing input: $input\n");
  }
}

