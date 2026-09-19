import 'dart:convert';
import 'package:http/http.dart' as http;

class InventoryService {
  final String baseUrl = "https://inventory-management-springboot.onrender.com";

  Future<List<Map<String, dynamic>>> fetchInventory() async {
    final response = await http.get(Uri.parse('$baseUrl/inventory'));

    if(response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load inventory');
    }
  }
}