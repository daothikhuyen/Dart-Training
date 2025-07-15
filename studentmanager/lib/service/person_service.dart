import 'dart:convert';
import 'dart:io';

import 'package:studentmanager/interface/json_serializable.dart';

abstract class PersonManager<T extends JsonSerializable> {
  Map<int, T> itemsMap = {};

  void add();

  void showPerson();

  void update();

  void delete(int id, Map<int, T> personMap) {
    if (personMap.containsKey(id)) {
      personMap.remove(id);
      print('Student deleted successfully');
    } else {
      print('Student does not exist');
    }
  }

  void searchByName(String name, Map<int, T> personMap) {
    final normalizedKeyword = name.toLowerCase();
    final results =
        personMap.values.where((person) {
          final json = person.toJson();
          final personName = json['name']?.toString().toLowerCase() ?? '';
          return personName.contains(normalizedKeyword);
        }).toList();

    if (results.isEmpty) {
      print('No person found with name containing "$name".');
    } else {
      print('Found ${results.length} result(s):');
      for (var person in results) {
        print(person);
      }
    }
  }

  // Save student list to file .json
  Future<void> saveFile(String path, Map<int, T> itemsMap) async {
    try {
      var file = File(path);

      if (!await file.exists()) {
        await file.create(recursive: true);
      }

      final jsonList = itemsMap.values.map((item) => item.toJson()).toList();
      final jsonString = JsonEncoder.withIndent(" ").convert(jsonList);
      await file.writeAsString(jsonString);

      print('Information saved successfully');
    } catch (e) {
      print('Error save file: $e');
    }
  }

  //Convert JSON to Person object
  T fromJson(Map<String, dynamic> person);

  // Read student/teacher list from file .json
  Future readFile(String path, Map<int, T> personMap) async {
    try {
      var file = File(path);

      if (!await file.exists()) {
        print('File does not exist');
        return;
      }

      var contents = await file.readAsString();

      if (contents.isNotEmpty) {
        List<dynamic> jsonList = jsonDecode(contents);

        for (var item in jsonList) {
          if (item is Map<String, dynamic>) {
            T person = fromJson(item);
            int id = item['id'];
            personMap[id] = person;
          }
        }
      }
    } catch (e) {
      print('Error read file: $e');
    }
  }
}
