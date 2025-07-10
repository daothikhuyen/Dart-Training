import 'package:studentmanager/studen_service.dart' as studentmanager;
import 'package:studentmanager/studen_service.dart';
import 'dart:io';

import 'package:studentmanager/student_model.dart';

Future<void> main(List<String> arguments) async {
  final service = StudenService();

  await service.readfile();

  while(true){
    print('========MENU=========');
    print('1. Add student');
    print('2. Student list');
    print('3. Delete student');
    print('4. Update student');
    print('5. Save student list to file');
    print('0. Logout');
    print('Enter your selection: ');

    final choice = stdin.readLineSync();
    switch(choice){
      case "1":
        service.addStudent(service.inputStudent());
        break;
      case "2":
        print('\n-------Student list---------\n');
        service.showStudents();
        print("\n---------------------------\n");
        break;
      case "3":
        print('Enter student ID to delete');
        int id = int.parse(stdin.readLineSync()!);
        service.deleteStudent(id);
      case "4":
        service.updateStudent(service.inputStudent());
      case "5":
        print('Save student information to .txt file');
        await service.saveFile();
      case "0":
        print('Exit the program');
        return;
      default:
        print('Invalid choice, please try again.');
    }
  }

  
}
