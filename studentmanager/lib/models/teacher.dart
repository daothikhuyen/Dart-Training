import 'package:studentmanager/interface/json_serializable.dart';
import 'package:studentmanager/models/person.dart';

class Teacher extends Person implements JsonSerializable {
  String? numberPhone;
  int? experience;
  String? studentTaught;

  Teacher({
    this.numberPhone,
    this.experience,
    this.studentTaught,
    super.name,
    super.gender,
    super.age,
    super.id,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      numberPhone: json['numberPhone'],
      experience: json['experience'],
      studentTaught: json['studentTaught'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'age': age,
    'gender': gender,
    'numberPhone': numberPhone ?? "(+84)",
    'experience': experience ?? 0,
    'studentTaught': studentTaught,
  };

  @override
  String toString() {
    return '$id    $name            $age       $gender      $numberPhone       $experience              $studentTaught';
  }
}
