import 'package:studentmanager/models/models.dart';
import 'package:studentmanager/service/student_service.dart';
import 'package:studentmanager/service/teacher_service.dart';

Future<void> main(List<String> arguments) async {
  final studentService = StudentService();
  final teacherService = TeacherService();

  // await service.readfile();

  while (true) {
    print('========MENU=========');
    print('1. Add person');
    print('2. Person list');
    print('3. Delete student');
    print('4. Update student');
    print('5. Save student list to file');
    print('6. Sort student by match score');
    print('7. Search student by name');
    print('0. Logout');
    print('Enter your selection: ');

    final choice = stdin.readLineSync();
    switch (choice) {
      case "1":
        final choice2 = selectPersonType('Add');
        if (choice2 == "1") {
          studentService.add(studentService.inputStudent());
        } else {
          teacherService.add(teacherService.inputTeacher());
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
          studentService.update(studentService.inputStudent());
        } else {
          teacherService.update(teacherService.inputTeacher());
        }

        break;
      case "5":
        print('Save information to .txt file');
        final choice2 = selectPersonType('Save the list:');
        if (choice2 == "1") {
          await studentService.saveFile(
            "student_list.txt",
            studentService.itemsMap,
          );
        } else {
          await teacherService.saveFile(
            "teacher_list.txt",
            teacherService.itemsMap,
          );
        }
        break;
      case "6":
        print('Sort student by math score');
        // service.sortByScore();
        break;
      case "7":
        print("Enter student name to search:");
        // String name = stdin.readLineSync()!;
        // print('Search results:');
        // print(service.searchByName(name));
        break;
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
    '--------------------------\n'
    '1. $action Student\n'
    '2. $action Teacher',
  );
  return stdin.readLineSync();
}
