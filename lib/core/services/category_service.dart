import 'dart:convert';
import '../models/category_model.dart';
import 'general_service.dart';
import '../../helper/logger.dart';
import '../../helper/api_config.dart';
import 'package:http/http.dart' as http;

abstract class ICategoryService extends IGeneralService<Category> {}

class CategoryService implements ICategoryService {
  final _path = "categories";

  @override
  Future<List<Category>?> getAll({String? token,String? query}) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUri/$_path'), headers: headers);
      if (response.statusCode == 200) {
        final l = json.decode(utf8.decode(response.bodyBytes));
        List<Category> category =
            List<Category>.from(l['categories'].map((model) => Category.fromJson(model)));
        return category;
      } else {
        logger.e("Failed to load category");
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Category?> findById(String? id, {String? token}) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUri/$_path/$id'), headers: headers);
      if (response.statusCode == 200) {
        final categoryJson = json.decode(utf8.decode(response.bodyBytes));
        logger.v(categoryJson, "category");
        return Category.fromJson(categoryJson);
      } else {
        logger.e('Failed to load category/$id');
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Category?> save(Category data, {String? token}) async {
    try {
      final response = await http.post(Uri.parse('$baseUri/$_path'),
          body: json.encode(data.toJson()), headers: headers);
      if (response.statusCode == 200) {
        final categoryJson = json.decode(utf8.decode(response.bodyBytes));
        logger.v(categoryJson, "Saved");
        return Category.fromJson(categoryJson);
      } else {
        logger.e("save failed!");
        return null;
      }
    } catch (e) {
      throw Exception('Failed to create category');
    }
  }

  @override
  Future<bool> update(Category data, String? id, {String? token}) async {
    try {
      final response = await http.put(Uri.parse('$baseUri/$_path/$id'),
          body: json.encode(data.toJson()), headers: headers);
      if (response.statusCode == 200) {
        final categoryJson = json.decode(utf8.decode(response.bodyBytes));
        logger.v(categoryJson, "updated");
        return true;
      } else {
        logger.e('Failed to update category: $id');
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> delete(String id,  {String? token}) async {
    try {
      final response =
          await http.delete(Uri.parse('$baseUri/$_path/$id'), headers: headers);
      if (response.statusCode == 200) {
        logger.v(id, "Deleted");
        return true;
      } else if (response.statusCode == 500) {
        logger.e('Failed to delete:  category ($id) can be used in product');
        return false;
      } else if (response.statusCode == 404) {
        logger.e('Not found:  order ($id)');
        return false;
      } else {
        logger.e('Failed to delete category: $id');
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
