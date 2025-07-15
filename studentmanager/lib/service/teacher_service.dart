import 'package:studentmanager/service/person_service.dart';
import 'package:studentmanager/models/teacher.dart';

class TeacherService extends PersonManager<Teacher> {
  final Map<int, Teacher> _teacherMap = {};

  // Add teacher to list
  @override
  void add() {
    Teacher teacher = Teacher();
    teacher.input();
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
      print(
        'Id     Name          Age     Gender     NumberPhone     Experience     StudentTaught',
      );
      _teacherMap.forEach((id, student) {
        print(student.toString());
      });
      print('---------------------------------------------------');
    }
  }

  @override
  void update() {
    Teacher teacher = Teacher();
    teacher.input();
    if (!_teacherMap.containsKey(teacher.id)) {
      print('Student does not exist');
    } else {
      _teacherMap[teacher.id!] = teacher;
      print('Updated successfully');
    }
  }

  @override
  void delete(int id, Map<int, Teacher> personMap) {
    super.delete(id, _teacherMap);
  }

  @override
  Future<void> saveFile(String path, Map<int, Teacher> itemsMap) {
    return super.saveFile(path, _teacherMap);
  }

  @override
  void searchByName(String name, Map<int, Teacher> personMap) {
    super.searchByName(name, _teacherMap);
  }

  @override
  Teacher fromJson(Map<String, dynamic> json) {
    return Teacher.fromJson(json);
  }

  @override
  Future readFile(String path, Map<int, Teacher> personMap) {
    return super.readFile(path, _teacherMap);
  }
}
