import 'package:studentmanager/student_model.dart';
import 'dart:io';

class StudenService {
  Map<int, Student> _studentList = {};

  void addStudent(Student student) {
    if (_studentList[student.studentId] != null) {
      print('Students already exist');
    } else {
      _studentList[student.studentId] = student;
      print('successfully added list');
    }
  }

  void showStudents() {
    if (_studentList.isEmpty) {
      print('No students yet');
    } else {
      _studentList.forEach((id, student) {
        print(student.toString());
      });
    }
  }

  void deleteStudent(int id) {
    if (!_studentList.containsKey(id)) {
      print('Student does not exist');
    } else {
      _studentList.remove(id);
      print('Student deleted successfully');
    }
  }

  void updateStudent(Student student) {
    if (!_studentList.containsKey(student.studentId)) {
      print('Student does not exist');
    } else {
      _studentList[student.studentId] = student;
      print('Updated successfully');
    }
  }

  Student inputStudent() {
    while (true) {
      try {
        print('Enter student code: ');
        int id = int.parse(stdin.readLineSync()!);
        print('Enter name: ');
        String name = stdin.readLineSync()!;
        print('Enter gender');
        String gender = stdin.readLineSync()!;
        print('Enter math score');
        double mathScore = double.parse(stdin.readLineSync()!);

        if (name.isEmpty || gender.isEmpty) {
          print('Please do not leave blank');
        } else {
          return Student(
            studentId: id,
            name: name,
            gender: gender,
            mathScore: mathScore,
          );
        }
      } catch (e) {
        print('Please enter in the correct format');
      }
    }
  }

  // Save student list to file .txt
  Future<void> saveFile() async {
    try {
      String path = "student_list.txt";

      var file = File(path);

      if (!await file.exists()) {
        await file.create(recursive: true);
      }

      var sink = file.openWrite(mode: FileMode.write);
      _studentList.forEach((id, student) {
        sink.writeln(student.toString());
      });

      print('Information saved successfully');

      await sink.flush();
      await sink.close();
    } catch (e) {
      print('Error save file: $e');
    }
  }

  // Read student list from file .txt to map
  Future readfile() async {
    try {
      String path = "student_list.txt";
      var file = File(path);
      if (!await file.exists()) {
        print('File does not exist');
        return;
      }
      var contents = await file.readAsLines();

      if(contents.isEmpty) return;

      for (var line in contents) {
        int id = int.parse(line.split(',')[0].split(':')[1].trim());
        String name = line.split(',')[1].split(":")[1].trim();
        String gender = line.split(',')[2].split(':')[1].trim();
        double mathScore = double.parse(
          line.split(',')[3].split(':')[1].trim(),
        );

        Student student = Student(studentId: id,name: name,gender: gender,mathScore: mathScore);
        _studentList[id] = student;
      }

    } catch (e) {
      print('Error read file: $e');
    }
  }
}
