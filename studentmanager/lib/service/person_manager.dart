import 'dart:io';

abstract class PersonManager<T> {
  Map<int, T> itemsMap = {};

// Input person information
// this method can be overridden in subclasses to provide specific input logic
  Map<String, dynamic> inputPerson(){
      while(true){
        try{
          print('Enter id: ');
          int id = int.parse(stdin.readLineSync()!);
          print('Enter name: ');
          String name = stdin.readLineSync()!;
          print('Enter gender (female, male, other)');
          String gender = stdin.readLineSync()!;
          print('Enter age');
          int age = int.parse(stdin.readLineSync()!);

          List<String> validGenders = ['female', 'male', 'other'];
          if(!validGenders.contains(gender.toLowerCase())){
            print('Please enter gender valid');
            continue;
          }

          if (name.isEmpty || gender.isEmpty) {
            print('Please do not leave blank');
          }else{
            return {
              'id': id,
              'name' : name,
              'gender': gender,
              'age' : age
            };
          }
        }on FormatException{
          print('Please enter in the correct format');
        }
      }
    }
    

  void add(T person);
  void showPerson();

  void delete(int id, Map<int,T> personList){
    if (personList.containsKey(id)) {
      personList.remove(id);
      print('Student deleted successfully');
    } else {
      print('Student does not exist');
      
    }
  }

  void update(T person);

  // Save student list to file .txt
  Future<void> saveFile(String path, Map<int,T> itemsMap) async {
    try {

      var file = File(path);

      if (!await file.exists()) {
        await file.create(recursive: true);
      }

      var sink = file.openWrite(mode: FileMode.write);
      itemsMap.forEach((id, person) {
        sink.writeln(person.toString());
      });

      print('Information saved successfully');

      await sink.flush();
      await sink.close();
    } catch (e) {
      print('Error save file: $e');
    }
  }
}

