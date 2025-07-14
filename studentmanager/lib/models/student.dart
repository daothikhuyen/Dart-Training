import 'package:studentmanager/interface/json_serializable.dart';
import 'package:studentmanager/models/person.dart';
import 'dart:io';

class Student extends Person implements JsonSerializable {
  double? mathScore;
  String? nameClass;

  Student({this.nameClass,this.mathScore,super.name,super.gender,super.age,super.id});

  @override
  void input() {
    super.input();

    while (true) {
      try {
        print('Enter name class');
        nameClass = stdin.readLineSync()!;
        print('Enter math score');
        mathScore = double.parse(stdin.readLineSync()!);

        if(mathScore! < 0 || mathScore! > 10){
          print('Please enter a valid math score ( 0-10)');
        } return;
      } on FormatException{
        print('Please enter in the correct format');
      }
    }
  }

  factory Student.fromJson(Map<String, dynamic> json){
    return Student(
      id : json['id'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      nameClass: json['nameClass'],
      mathScore: json['mathScore']
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'age': age,
    'gender': gender,
    'nameClass': nameClass,
    'mathScore': mathScore,
  };

    @override
  String toString() {
    return '$id    $name      $age     $gender     $mathScore';
  }
  
}
