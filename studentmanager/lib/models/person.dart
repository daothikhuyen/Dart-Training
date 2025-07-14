import 'dart:io';
class Person {
  int? id;
  String? name;
  String? gender;
  int? age;
  String ? address;

  Person({
    this.id,
    this.name, 
    this.gender, 
    this.age,
  });

  void input(){
    while(true){
        try{
          print('Enter id: ');
          id = int.parse(stdin.readLineSync()!);
          print('Enter name: ');
          name = stdin.readLineSync()!;
          print('Enter gender (female, male, other)');
          gender = stdin.readLineSync()!;
          print('Enter age');
          age = int.parse(stdin.readLineSync()!);

          List<String> validGenders = ['female', 'male', 'other'];
          if(!validGenders.contains(gender!.toLowerCase())){
            print('Please enter gender valid');
            continue;
          }

          if (name!.isEmpty || gender!.isEmpty) {
            print('Please do not leave blank');
          }else{
            return;
          }
        }on FormatException{
          print('Please enter in the correct format');
        }
      }
  }
}
