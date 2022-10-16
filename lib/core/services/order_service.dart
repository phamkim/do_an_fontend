import 'dart:convert';

import '../../helper/api_config.dart';
import '../../helper/logger.dart';
import '../models/order_model.dart';
import 'general_service.dart';
import 'package:http/http.dart' as http;

abstract class IOrderService extends IGeneralService<Order> {}

class OrderService implements IOrderService {
  final _path = "orders";

  @override
  Future<List<Order>?> getAll({String? token,String? query}) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUri/$_path'), headers: headers);
      if (response.statusCode == 200) {
        Iterable l = json.decode(utf8.decode(response.bodyBytes));
        logger.v(l, "list order");
        List<Order> orders =
            List<Order>.from(l.map((model) => Order.fromJson(model)));
        return orders;
      } else {
        logger.e("Failed to load order");
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Order?> findById(String? id, {String? token}) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUri/$_path/$id'), headers: headers);
      if (response.statusCode == 200) {
        final orderJson = json.decode(utf8.decode(response.bodyBytes));
        logger.v(orderJson, "order");
        return Order.fromJson(orderJson);
      } else {
        logger.e('Failed to load order/$id');
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Order?> save(Order data, {String? token}) async {
    try {

      final body = json.encode({
        "product": data.product.sId,
        "quantity": data.quantity,
        "priceUnit": data.priceUnit,
      });
      logger.v(body, "data");
      final newHeaders = {...headers, 'Authorization': 'Bearer $token'};
      final response = await http.post(Uri.parse('$baseUri/$_path'),
          body: body, headers: newHeaders);
      if (response.statusCode == 201) {
        final orderJson = json.decode(utf8.decode(response.bodyBytes));
        logger.v(orderJson, "Saved");
        return Order.fromJson(orderJson['order']);
      } else {
        logger.e("save failed!");
        return null;
      }
    } catch (e) {
      throw Exception('Failed to create order');
    }
  }

  @override
  Future<bool> update(Order data, String? id, {String? token}) async {
    try {
      final response = await http.put(Uri.parse('$baseUri/$_path/$id'),
          body: json.encode(data.toJson()), headers: headers);
      if (response.statusCode == 200) {
        final orderJson = json.decode(utf8.decode(response.bodyBytes));
        logger.v(orderJson, "updated");
        return true;
      } else {
        logger.e('Failed to update order: $id');
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> delete(String id,{String? token}) async {
    try {
      final response =
          await http.delete(Uri.parse('$baseUri/$_path/$id'), headers: headers);
      if (response.statusCode == 200) {
        logger.v(id, "deleted");
        return true;
      } else if (response.statusCode == 500) {
        logger.e('Failed to delete:  order ($id) can be used in order_detail');
        return false;
      } else if (response.statusCode == 404) {
        logger.e('Not found:  order ($id)');
        return false;
      } else {
        logger.e('Failed to delete order: $id');
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
