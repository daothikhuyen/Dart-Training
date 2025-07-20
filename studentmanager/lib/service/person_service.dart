import 'package:studentmanager/interface/json_serializable.dart';

// ignore: camel_case_types
abstract class PersonSerive<T extends JsonSerializable> {
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
    final keyword = name.toLowerCase();
    final results =
        personMap.values.where((person) {
          final json = person.toJson();
          final personName = json['name']?.toString().toLowerCase() ?? '';
          return personName.contains(keyword);
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
}
