import 'dart:io';
import 'package:studentmanager/service/person_manager.dart';
import 'package:studentmanager/models/student.dart';

class StudentService extends PersonManager<Student>{
  final Map<int, Student> _studentMap = {};

  @override
  // ignore: unnecessary_overrides
  Map<String, dynamic> inputPerson() {
    return super.inputPerson();
  }
  
// Enter student information
  Student inputStudent() {
    while (true) {
      try {
        var data = inputPerson();
        print('Enter name class');
        String nameClass = stdin.readLineSync()!;
        print('Enter math score');
        double mathScore = double.parse(stdin.readLineSync()!);

        if(mathScore < 0 || mathScore > 10){
          print('Please enter a valid math score ( 0-10)');
        }else{
          return Student( id: data['id'],name: data['name'],gender: data['gender'],age: data['age'],nameClass: nameClass, mathScore: mathScore);
        }
      } on FormatException{
        print('Please enter in the correct format');
      }
    }
  }

  @override
  void add(Student student) {
    if (_studentMap[student.id] != null) {
      print('Students already exist');
      return;
    }

    _studentMap[student.id!] = student;
    print('successfully added list');
  }

  @override
  void showPerson() {
    if (_studentMap.isEmpty) {
      print('No students yet');
    } else {
      print('-------------------Student List--------------------');
      print('Id     Name      Age     Gender     Math Score');
      _studentMap.forEach((id, student) {
        print(student.toString());
      });
      print('---------------------------------------------------');
    }
  }

  @override
  void update(Student student) {
    if (!_studentMap.containsKey(student.id)) {
      print('Student does not exist');
    } else {
      _studentMap[student.id!] = student;
      print('Updated successfully');
    }
  }

  @override
  void delete(int id, Map<int, Student> personList) {
    super.delete(id, _studentMap);
  }

  @override
  Future<void> saveFile(String path, Map<int, Student> itemsMap) {
    return super.saveFile(path, _studentMap);
  }
  

}