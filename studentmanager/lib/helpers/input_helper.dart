import 'package:studentmanager/models/models.dart';
import 'package:studentmanager/models/teacher.dart';

class InputHelper {
  Map<String, dynamic> inputPerson() {
    while (true) {
      try {
        print('Enter id: ');
        int id = int.parse(stdin.readLineSync()!);
        print('Enter name: ');
        String name = stdin.readLineSync()!;
        print('Enter gender (female, male, other)');
        String gender = stdin.readLineSync()!;
        print('Enter age');
        int age = int.parse(stdin.readLineSync()!);

        List<String> validGenders = ['female', 'male', 'other'];
        if (!validGenders.contains(gender.toLowerCase())) {
          print('Please enter gender valid');
          continue;
        }

        if (name.isEmpty || gender.isEmpty) {
          print('Please do not leave blank');
        } else {
          return {'id': id, 'name': name, 'gender': gender, 'age': age};
        }
      } on FormatException {
        print('Please enter in the correct format');
      }
    }
  }

  Student inputStudent() {
    Map<String, dynamic> data = inputPerson();
    while (true) {
      try {
        print('Enter name class');
        String nameClass = stdin.readLineSync()!;
        if (nameClass.isEmpty) {
          print('Please dont leave bank');
          continue;
        }

        print('Enter attendance score');
        double attendanceScore = double.parse(stdin.readLineSync()!);
        if (!checkScore(attendanceScore)) continue;

        print('Enter midterm score');
        double midtermScore = double.parse(stdin.readLineSync()!);
        if (!checkScore(midtermScore)) continue;

        print('Enter final score');
        double finalScore = double.parse(stdin.readLineSync()!);
        if (!checkScore(finalScore)) continue;

        return Student(
          id: data['id'],
          name: data['name'],
          gender: data['gender'],
          age: data['age'],
          nameClass: nameClass,
          attendanceScore: attendanceScore,
          midtermScore: midtermScore,
          finalScore: finalScore,
        );
      } on FormatException {
        print('Please enter in the correct format');
      }
    }
  }

  Teacher inputTeacher() {
    Map<String, dynamic> data = inputPerson();

    while (true) {
      try {
        print('Enter number phone');
        String numberPhone = stdin.readLineSync()!;

        final RegExp phoneRegExp = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
        if (!phoneRegExp.hasMatch(numberPhone)) {
          print('Please enter a valid phone number (10 digits)');
          continue;
        }

        print('Teaching experience(years)');
        int experience = int.parse(stdin.readLineSync()!);

        print('Enter student taught');
        String studentTaught = stdin.readLineSync()!;
        if (studentTaught.isEmpty) {
          print('Please do not leave blank');
        } else {
          return Teacher(
            id: data['id'],
            name: data['name'],
            gender: data['gender'],
            age: data['age'],
            numberPhone: numberPhone,
            experience: experience,
            studentTaught: studentTaught,
          );
        }
      } on FormatException {
        print('Please enter in the correct format');
      }
    }
  }

  bool checkScore(double? score) {
    if (score! < 0 || score > 10) {
      print('Please enter a valid math score ( 0-10)');
      return false;
    }

    return true;
  }
}
