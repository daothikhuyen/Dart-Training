import 'dart:io';

class Student {
  int studentId;
  String name;
  String gender;
  double mathScore;
  // double englishScore;

  Student({required this.studentId, required this.name, required this.gender, required this.mathScore});

  @override
  String toString() {
    return  'Student Code : $studentId , Name: $name , Gender: $gender , Math Score: $mathScore';
  }

}