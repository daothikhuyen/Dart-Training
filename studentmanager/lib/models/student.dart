import 'dart:io';
import 'package:studentmanager/models/person.dart';

class Student extends Person {
  int studentId;
  double mathScore;

  Student({
    required this.studentId,
    required this.mathScore,
    required super.name,
    required super.gender,
    required super.age,
  });

  @override
  String toString() {
    return 'Student Code : $studentId , '+
          'Name: $name , Gender: $gender , ' +
          'Age : $age , Math Score: $mathScore';
  }
}
