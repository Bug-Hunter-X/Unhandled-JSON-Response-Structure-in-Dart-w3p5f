```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      // Check if jsonData is a list before iterating
      if (jsonData is List) {
        for (final item in jsonData) {
          // Check if the 'name' key exists before accessing it
          final name = item['name'];
          if (name != null) {
            print('Name: $name');
          } else {
            print('Name key not found in item: $item');
          }
        }
      } else {
        print('Unexpected JSON structure. Expected a list, but received: $jsonData');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```