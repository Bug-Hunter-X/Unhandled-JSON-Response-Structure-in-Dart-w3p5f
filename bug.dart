```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Incorrect handling of JSON response
      final jsonData = jsonDecode(response.body);
      // Assuming jsonData is a list, but it could be a map or other structure
      for (var item in jsonData) {
        print(item['name']); // Error if 'name' key doesn't exist
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e'); // Generic error handling
  }
}
```