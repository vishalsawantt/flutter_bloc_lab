import 'dart:convert';
import 'package:http/http.dart' as http;

class InventoryService {
  final String baseUrl = 'https://inventory-management-springboot.onrender.com';

  List<Map<String, dynamic>>? _cache;
  DateTime? _cachedAt;

  Future<List<Map<String, dynamic>>> fetchInventory() async {
    if (_cache != null &&
        _cachedAt != null &&
        DateTime.now().difference(_cachedAt!) < const Duration(minutes: 5)) {
      print('CACHE HIT: data came from memory');   // NEW
      return _cache!;
    }

    print('NETWORK CALL: data came from API');     // NEW
    final response = await http.get(Uri.parse('$baseUrl/inventory'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      _cache = data.cast<Map<String, dynamic>>();
      _cachedAt = DateTime.now();
      return _cache!;
    } else {
      throw Exception('Failed to load inventory');
    }
  }
}