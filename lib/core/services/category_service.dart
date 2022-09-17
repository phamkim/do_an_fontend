import 'dart:convert';
import '../../helper/api_config.dart';
import '../../models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<List<Category>> getAll() async {
    final response = await http.get(Uri.parse('$baseUri/category'), headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Iterable l = json.decode(utf8.decode(response.bodyBytes));
      List<Category> category =
          List<Category>.from(l.map((model) => Category.fromJson(model)));
      for (var element in category) {
        print(element.toJson());
      }
      return category;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load category');
    }
  }
}
