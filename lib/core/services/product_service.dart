import 'dart:convert';

import '../models/product_model.dart';
import 'general_service.dart';
import '../../helper/logger.dart';
import '../../helper/api_config.dart';
import 'package:http/http.dart' as http;

abstract class IProductService extends IGeneralService<Product> {}

class ProductService implements IProductService {
  final _path = "products";

  @override
  Future<List<Product>?> getAll({String? token, String? query}) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUri/$_path?$query'), headers: headers);
      if (response.statusCode == 200) {
        final l = json.decode(utf8.decode(response.bodyBytes));
        List<Product> products = List<Product>.from(
            l["products"].map((model) => Product.fromJson(model)));
        return products;
      } else {
        logger.e("Failed to load product");
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Product?> findById(String? id, {String? token}) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUri/$_path/$id'), headers: headers);
      if (response.statusCode == 200) {
        final productJson = json.decode(utf8.decode(response.bodyBytes));
        logger.v(productJson, "product");
        return Product.fromJson(productJson);
      } else {
        logger.e('Failed to load product/$id');
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Product?> save(Product data, {String? token}) async {
    try {
      final response = await http.post(Uri.parse('$baseUri/$_path'),
          body: json.encode(data.toJson()), headers: headers);
      if (response.statusCode == 200) {
        final productJson = json.decode(utf8.decode(response.bodyBytes));
        logger.v(productJson, "Saved");
        return Product.fromJson(productJson);
      } else {
        logger.e("save failed!");
        return null;
      }
    } catch (e) {
      throw Exception('Failed to create product');
    }
  }

  @override
  Future<bool> update(Product data, String? id, {String? token}) async {
    try {
      final response = await http.put(Uri.parse('$baseUri/$_path/$id'),
          body: json.encode(data.toJson()), headers: headers);
      if (response.statusCode == 200) {
        final productJson = json.decode(utf8.decode(response.bodyBytes));
        logger.v(productJson, "updated");
        return true;
      } else {
        logger.e('Failed to update product: $id');
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> delete(String? id, {String? token}) async {
    try {
      final response =
          await http.delete(Uri.parse('$baseUri/$_path/$id'), headers: headers);
      if (response.statusCode == 200) {
        logger.v(id, "deleted");
        return true;
      } else if (response.statusCode == 500) {
        logger
            .e('Failed to delete:  product ($id) can be used in order_detail');
        return false;
      } else if (response.statusCode == 404) {
        logger.e('Not found:  order ($id)');
        return false;
      } else {
        logger.e('Failed to delete product: $id');
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
