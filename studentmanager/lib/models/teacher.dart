import 'package:studentmanager/interface/json_serializable.dart';
import 'package:studentmanager/models/person.dart';
import 'dart:io';
class Teacher extends Person implements JsonSerializable {
  String? numberPhone;
  int? experience;
  String? studentTaught;

  Teacher({this.numberPhone, this.experience,this.studentTaught, super.name,super.gender,super.age,super.id});

  @override
  void input() {
    super.input();

    while (true) {
      try {
        print('Enter number phone');
        numberPhone = stdin.readLineSync()!;
        print('Teaching experience(years)');
        experience =int.parse(stdin.readLineSync()!);
        print('Enter student taught');
        studentTaught = stdin.readLineSync()!;

        final RegExp phoneRegExp = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
        if(!phoneRegExp.hasMatch(numberPhone!)){
          print('Please enter a valid phone number (10 digits)');
          continue;
        }

        if (studentTaught!.isEmpty) {
          print('Please do not leave blank');
        } else {
          return;
        }
      } on FormatException{
        print('Please enter in the correct format');
      }
    }
  }

   factory Teacher.fromJson(Map<String, dynamic> json){
    return Teacher(
      id : json['id'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      numberPhone: json['numberPhone'],
      experience: json['experience'],
      studentTaught: json['studentTaught']
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    'id :': id,
    'name :': name,
    'age :': age,
    'gender': gender,
    'number phone :': numberPhone,
    'experence:': experience,
    'Student taught' : studentTaught
  };

    @override
  String toString() {
    return '$id    $name      $age     $gender     $numberPhone     $experience     $studentTaught';
  }

}