import 'package:studentmanager/interface/json_serializable.dart';
import 'package:studentmanager/models/person.dart';

class Student extends Person implements JsonSerializable {
  double? attendanceScore;
  double? midtermScore;
  double? finalScore;
  double? averageScore;
  String? nameClass;

  Student({
    this.nameClass,
    this.attendanceScore,
    this.midtermScore,
    this.finalScore,
    this.averageScore,
    super.name,
    super.gender,
    super.age,
    super.id,
  });

  //Factory constructor to create a student fron JSON
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      nameClass: json['nameClass'],
      attendanceScore: json['attendanceScore'],
      midtermScore: json['midtermScore'],
      finalScore: json['finalScore'],
      averageScore: json['averageScore'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'age': age,
    'gender': gender,
    'nameClass': nameClass,
    'attendanceScore': attendanceScore,
    'midtermScore': midtermScore,
    'finalScore': finalScore,
    'averageScore': averageScore,
  };

  double calculateAverageScore() {
    return (attendanceScore! * 0.2 + midtermScore! * 0.2 + finalScore! * 0.3);
  }

  @override
  String toString() {
    return '$id    $name            $age        $gender       $nameClass                  $attendanceScore                $midtermScore             $finalScore              $averageScore';
  }
}
