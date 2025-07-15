import 'package:studentmanager/interface/json_serializable.dart';
import 'package:studentmanager/models/person.dart';
import 'dart:io';

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

  @override
  void input() {
    super.input();

    while (true) {
      try {
        print('Enter name class');
        nameClass = stdin.readLineSync()!;
        if (nameClass!.isEmpty) {
          print('Please dont leave bank');
          continue;
        }

        print('Enter attendance score');
        attendanceScore = double.parse(stdin.readLineSync()!);
        if(!checkScore(attendanceScore)) continue;

        print('Enter midterm score');
        midtermScore = double.parse(stdin.readLineSync()!);
        if(!checkScore(midtermScore)) continue;

         print('Enter final score');
        finalScore = double.parse(stdin.readLineSync()!);
        if(!checkScore(finalScore)) continue;

        return;

      } on FormatException {
        print('Please enter in the correct format');
      }
    }
  }

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
      averageScore: json['averageScore']
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
    'finalScore' : finalScore,
    'averageScore': averageScore
  };

  double calculateAverageScore(){
    return (attendanceScore!*0.2 + midtermScore!*0.2 + finalScore!*0.6);
  }

  @override
  String toString() {
    return '$id    $name            $age        $gender     $nameClass       $attendanceScore          $midtermScore           $finalScore           $averageScore';
  }
}

bool checkScore(double? score) {
  if (score! < 0 || score > 10) {
    print('Please enter a valid math score ( 0-10)');
    return false;
  }

  return true;
} 
