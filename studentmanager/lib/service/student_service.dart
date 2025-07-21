import 'package:studentmanager/helpers/file_helper.dart';
import 'package:studentmanager/helpers/input_helper.dart';
import 'package:studentmanager/service/person_service.dart';
import 'package:studentmanager/models/student.dart';

class StudentService extends PersonSerive<Student> {
  Map<int, Student> _studentMap = {};
  final fileHelper = FileHelper();
  final inputHelper = InputHelper();

  @override
  void add() {
    Student student = inputHelper.inputStudent();
    student.averageScore = student.calculateAverageScore();

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
      print(
        'Id     Name            Age     Gender      Class           Attendance Score      Midterm Score       Final Score      Average Score',
      );
      _studentMap.forEach((id, student) {
        print(student.toString());
      });
      print('---------------------------------------------------');
    }
  }

  @override
  void update() {
    Student student = inputHelper.inputStudent();
    if (!_studentMap.containsKey(student.id)) {
      print('Student does not exist');
    } else {
      _studentMap[student.id!] = student;
      print('Updated successfully');
    }
  }

  @override
  void delete(int id, Map<int, Student> personMap) {
    super.delete(id, _studentMap);
  }

  void sortByScore() {
    var sortedEntries =
        _studentMap.entries.toList()..sort(
          ((a, b) => b.value.averageScore!.compareTo(a.value.averageScore!)),
        );

    Map<int, Student> sortedMap = {};
    for (var i in sortedEntries) {
      sortedMap[i.key] = i.value;
    }

    _studentMap = sortedMap;
  }

  void goodStudent() {
    sortByScore();

    print('------------Good Student----------------');
    for (var student in _studentMap.values) {
      if (student.averageScore! >= 8.5) {
        print("${student.name} - ${student.averageScore}");
      }
    }
  }

  @override
  void searchByName(String name, Map<int, Student> personMap) {
    super.searchByName(name, _studentMap);
  }

  Future saveFile(String path) async {
    await fileHelper.saveFile<Student>(path, _studentMap);
  }

  Future<void> readFile(String path) async {
    await fileHelper.readFile<Student>(
      path,
      _studentMap,
      (json) => Student.fromJson(json),
    );
  }
}
