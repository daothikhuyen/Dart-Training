import 'package:studentmanager/models/models.dart';

Future<void> main(List<String> arguments) async {
  final studentService = StudentService();
  final teacherService = TeacherService();

  await studentService.readFile('/assets/data/student_list.json');
  await teacherService.readFile('/assets/data/teacher_list.json');

  while (true) {
    print('========MENU=========');
    print('1. Add person');
    print('2. Person list');
    print('3. Delete person');
    print('4. Update person');
    print('5. Save person list to file');
    print('6. Sort student by average score');
    print('7. Search person by name');
    print('8. Show good student');
    print('0. Logout');
    print('Enter your selection: ');

    final choice = stdin.readLineSync();
    switch (choice) {
      case "1":
        final choice2 = selectPersonType('Add');
        if (choice2 == "1") {
          studentService.add();
        } else {
          teacherService.add();
        }
        break;
      case "2":
        print(
          '--------------------------\n'
          '1. Student List\n'
          '2. Teacher List\n',
        );
        final choice2 = stdin.readLineSync();
        if (choice2 == "1") {
          studentService.showPerson();
        } else {
          teacherService.showPerson();
        }

        break;
      case "3":
        print('Enter student ID to delete');
        int id = int.parse(stdin.readLineSync()!);

        final choice2 = selectPersonType('Delete');
        if (choice2 == "1") {
          studentService.delete(id, studentService.itemsMap);
        } else {
          teacherService.delete(id, teacherService.itemsMap);
        }
        break;
      case "4":
        final choice2 = selectPersonType('Update');
        if (choice2 == "1") {
          studentService.update();
        } else {
          teacherService.update();
        }

        break;
      case "5":
        print('Save information to .json file');
        final choice2 = selectPersonType('Save the list:');
        if (choice2 == "1") {
          await studentService.saveFile('student_list.json');
        } else {
          await teacherService.saveFile("teacher_list.json");
        }
        break;
      case "6":
        print('Sort student by math score');
        studentService.sortByScore();
        studentService.showPerson();
        break;
      case "7":
        print("Enter student name to search:");
        String name = stdin.readLineSync()!;
        final choice2 = selectPersonType('Search');
        if (choice2 == "1") {
          studentService.searchByName(name, studentService.itemsMap);
        } else {
          teacherService.searchByName(name, teacherService.itemsMap);
        }
        break;
      case "8":
        studentService.goodStudent();
      case "0":
        print('Exit the program');
        return;
      default:
        print('Invalid choice, please try again.');
    }
  }
}

String? selectPersonType(String action) {
  print(
    '-----------Menu---------------\n'
    '1. $action Student\n'
    '2. $action Teacher',
  );
  return stdin.readLineSync();
}
