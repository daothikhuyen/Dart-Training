import 'dart:io';
import 'package:studentmanager/service/person_service.dart';
import 'package:studentmanager/models/student.dart';

class StudentService extends PersonManager<Student>{
  Map<int, Student> _studentMap = {};
  Map<String, dynamic> _json = {};

  @override
  void add() {
    Student student = Student();
    student.input();
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
  void update() {
    Student student = Student();
    student.input();
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
  
  void sortByScore() {
    var sortedEntries = _studentMap.entries.toList()..sort(((a,b) => b.value.mathScore!.compareTo(a.value.mathScore!)));

    Map<int,Student> sortedMap = {};
    for(var i in sortedEntries){
      sortedMap[i.key] = i.value;
    }

    _studentMap = sortedMap;
    showPerson();
  }

  @override
  void searchByName(String name, Map<int, Student> personMap) {
    super.searchByName(name, _studentMap);
  }
  
  @override
  Student fromJson(Map<String, dynamic> json) {
    return Student.fromJson(json);
  }

  @override
  Future readFile(String path, Map<int, Student> personMap) {
    return super.readFile(path, _studentMap);
  }
  

}