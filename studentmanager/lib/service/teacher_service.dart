import 'package:studentmanager/helpers/file_helper.dart';
import 'package:studentmanager/helpers/input_helper.dart';
import 'package:studentmanager/service/person_service.dart';
import 'package:studentmanager/models/teacher.dart';

class TeacherService extends PersonSerive<Teacher> {
  final Map<int, Teacher> _teacherMap = {};
   final fileHelper = FileHelper();
   final inputHelper = InputHelper();

  // Add teacher to list
  @override
  void add() {
    Teacher teacher =  inputHelper.inputTeacher();
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
    Teacher teacher = inputHelper.inputTeacher();
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
  void searchByName(String name, Map<int, Teacher> personMap) {
    super.searchByName(name, _teacherMap);
  }

  Future<void> saveFile(String path) async {
    await fileHelper.saveFile<Teacher>(path, _teacherMap);
  }

  Future<void> readFile(String path) async {
    await fileHelper.readFile<Teacher>(path, _teacherMap, (json) => Teacher.fromJson(json));
  }

}
