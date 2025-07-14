import 'dart:io';
import 'package:studentmanager/service/person_manager.dart';
import 'package:studentmanager/models/teacher.dart';

class TeacherService extends PersonManager<Teacher>{
  final Map<int, Teacher> _teacherMap = {};
  
  @override
  // ignore: unnecessary_overrides
  Map<String, dynamic> inputPerson() {
    return super.inputPerson();
  }

// Enter teacher information
  Teacher inputTeacher() {
    while (true) {
      try {
        var data = inputPerson();
        print('Enter number phone');
        String numberPhone = stdin.readLineSync()!;
        print('Teaching experience(years)');
        int teacherTaught =int.parse(stdin.readLineSync()!);
        print('Enter student taught');
        String subject = stdin.readLineSync()!;

        final RegExp phoneRegExp = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
        if(!phoneRegExp.hasMatch(numberPhone)){
          print('Please enter a valid phone number (10 digits)');
          continue;
        }

        if (subject.isEmpty) {
          print('Please do not leave blank');
        } else {
          return Teacher( id: data['id'],name: data['name'],gender: data['gender'],age: data['age'],numberPhone: numberPhone,experience: teacherTaught,studentTaught: subject);
        }
      } on FormatException{
        print('Please enter in the correct format');
      }
    }
  }

// Add teacher to list
  @override
  void add(Teacher teacher) {
    if (_teacherMap[teacher.id] != null) {
      print('Students already exist');
      return;
    }

    _teacherMap[teacher.id!] = teacher;
    print('successfully added list');
  }

    @override
  void showPerson() {
    if (_teacherMap.isEmpty) {
      print('No teacher yet');
    } else {
      print('-------------------Teacher List--------------------');
      print('Id     Name      Age     Gender     NumberPhone     Experience     StudentTaught');
      _teacherMap.forEach((id, student) {
        print(student.toString());
      });
      print('---------------------------------------------------');
    }
  }

  @override
  void update(Teacher teacher) {
    if (!_teacherMap.containsKey(teacher.id)) {
      print('Student does not exist');
    } else {
      _teacherMap[teacher.id!] = teacher;
      print('Updated successfully');
    }
  }

  @override
  void delete(int id, Map<int, Teacher> personList) {
    super.delete(id, _teacherMap);
  }

  @override
  Future<void> saveFile(String path, Map<int, Teacher> itemsMap) {
    return super.saveFile(path, _teacherMap);
  }
  
}