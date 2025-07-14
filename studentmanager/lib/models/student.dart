import 'package:studentmanager/models/person.dart';
import 'dart:io';

class Student extends Person{
  double? mathScore;
  String? nameClass;

  Student({this.nameClass,this.mathScore,super.name,super.gender,super.age,super.id});

  @override
  String toString() {
    return '$id    $name      $age     $gender     $mathScore';
  }
  
}
