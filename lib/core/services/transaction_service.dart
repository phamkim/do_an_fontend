import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../helper/api_config.dart';
import '../../helper/logger.dart';
import '../models/transaction_model.dart';
import 'general_service.dart';

abstract class ITransactionService extends IGeneralService<Transaction> {}

class TransactionService extends ITransactionService {
  final _path = "transactions";

  @override
  Future<bool> delete(String? id, {String? token}) async {
    try {
      final response =
          await http.delete(Uri.parse('$baseUri/$_path/$id'), headers: headers);
      if (response.statusCode == 200) {
        logger.v(id, "deleted");
        return true;
      } else if (response.statusCode == 404) {
        logger.e('Not found:  order ($id)');
        return false;
      } else {
        logger.e('Failed to delete order_detail: $id');
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Transaction?> findById(String? id, {String? token}) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUri/$_path/$id'), headers: headers);
      if (response.statusCode == 200) {
        final responseJson = json.decode(utf8.decode(response.bodyBytes));
        logger.v(responseJson, "Transaction");
        return Transaction.fromJson(responseJson);
      } else {
        logger.e('Failed to load Transaction/$id');
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Transaction>?> getAll({String? token, String? query}) async {
    try {
      const accessToken =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MzM3YzBjZTlkYjUzZjBlNGViOTJkZDkiLCJpYXQiOjE2NjQ4OTE4MTcsImV4cCI6MTY2NDg5OTAxN30.cwMg6lKXP6C1ebIGTm0z0m1NtCJrhC5VbRir0qQAcUY';
      final newHeaders = {...headers, 'Authorization': 'Bearer $accessToken'};
      final response = await http.get(Uri.parse('$baseUri/$_path?$query'),
          headers: newHeaders);
      if (response.statusCode == 200) {
        final l = json.decode(utf8.decode(response.bodyBytes));
        List<Transaction> transactions = List<Transaction>.from(
            l['transactions'].map((model) => Transaction.fromJson(model)));
        return transactions;
      } else {
        logger.e("Failed to load transactions");
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Transaction?> save(Transaction data, {String? token}) async {
    try {
      final response = await http.post(Uri.parse('$baseUri/$_path'),
          body: json.encode(data.toJson()), headers: headers);
      if (response.statusCode == 200) {
        final responseJson = json.decode(utf8.decode(response.bodyBytes));
        logger.v(responseJson, "saved");
        return Transaction.fromJson(responseJson);
      } else {
        logger.e("save failed!");
        return null;
      }
    } catch (e) {
      throw Exception('Failed to create orderDetail');
    }
  }

  @override
  Future<bool> update(Transaction data, String? id, {String? token}) async {
    try {
      final response = await http.put(Uri.parse('$baseUri/$_path/$id'),
          body: json.encode(data.toJson()), headers: headers);
      if (response.statusCode == 200) {
        final responseJson = json.decode(utf8.decode(response.bodyBytes));
        logger.v(responseJson, "updated");
        return true;
      } else {
        logger.e('Failed to update Transaction: $id');
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
