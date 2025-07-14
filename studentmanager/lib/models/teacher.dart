import 'package:studentmanager/models/person.dart';

class Teacher extends Person {
  String? numberPhone;
  int? experience;
  String? studentTaught;

  Teacher({this.numberPhone, this.experience,this.studentTaught, super.name,super.gender,super.age,super.id});

  @override
  String toString() {
    return '$id    $name      $age     $gender     $numberPhone     $experience     $studentTaught';
  }
}