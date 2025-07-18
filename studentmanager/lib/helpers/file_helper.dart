import 'dart:convert';
import 'dart:io';

class FileHelper{

  // Save map of objects to a JSON file
  Future saveFile<T>(String path, Map<int, T> itemsMap) async {
    try {
      final file = File(path);

      if (!await file.exists()) {
        await file.create(recursive: true);
      }

      // Convert each object to JSON
      final jsonList =itemsMap.values.map((item) => (item as dynamic).toJson()).toList();

      final jsonString = JsonEncoder.withIndent("  ").convert(jsonList);
      await file.writeAsString(jsonString);

      print('File saved successfully to "$path".');
    } catch (e) {
      print('Error while saving file: $e');
    }
  }

  // Read list of objects from a JSON file and fill into the provided map
  Future<void> readFile<T>(String path,Map<int, T> targetMap,T Function(Map<String, dynamic>) fromJson) async {
    try {
      final file = File(path);

      if (!await file.exists()) {
        print(' File "$path" does not exist.');
        return;
      }

      final contents = await file.readAsString();

      if (contents.trim().isNotEmpty) {
        
        final List<dynamic> jsonList = jsonDecode(contents);

        for (var item in jsonList) {
          if (item is Map<String, dynamic>) {
            final obj = fromJson(item);
            final id = item['id'];
            if (id != null) {
              targetMap[id] = obj;
            }
          }
        }
      }
    } catch (e) {
      print('Error while reading file: $e');
    }
  }
  
}
