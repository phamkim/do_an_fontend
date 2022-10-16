import 'dart:convert';

import '../models/user_model.dart';
import 'general_service.dart';
import '../../helper/logger.dart';
import '../../helper/api_config.dart';
import 'package:http/http.dart' as http;

abstract class IUserService extends IGeneralService<User> {
  Future<dynamic> login(String userName, String passWord);
  Future<dynamic> refreshToken(String refreshToken);
  Future<bool> logout(String refreshToken);
}

class UserService implements IUserService {
  final _path = "users";

  @override
  Future<List<User>?> getAll({String? token,String? query}) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUri/$_path'), headers: headers);
      if (response.statusCode == 200) {
        final l = json.decode(utf8.decode(response.bodyBytes));
        logger.i(l);
        List<User> users =
            List<User>.from(l['users'].map((model) => User.fromJson(model)));
        return users;
      } else {
        logger.e("Failed to load user");
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<User?> findById(String? id, {String? token}) async {
    try {
      final newHeaders = {...headers, 'Authorization': 'Bearer $token'};
      final response =
          await http.get(Uri.parse('$baseUri/$_path/$id'), headers: newHeaders);
      if (response.statusCode == 200) {
        final userJson = json.decode(utf8.decode(response.bodyBytes));
        return User.fromJson(userJson['user']);
      } else {
        logger.e('Failed to load user/$id');
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<User?> save(User data, {String? token}) async {
    try {
      final response = await http.post(Uri.parse('$baseUri/$_path'),
          body: json.encode(data.toJson()), headers: headers);
      if (response.statusCode == 200) {
        final userJson = json.decode(utf8.decode(response.bodyBytes));
        logger.v(userJson, "Saved");
        return User.fromJson(userJson);
      } else {
        logger.e("save failed!");
        return null;
      }
    } catch (e) {
      throw Exception('Failed to create user');
    }
  }

  @override
  Future<bool> update(User data, String? id, {String? token}) async {
    try {
      final response = await http.put(Uri.parse('$baseUri/$_path/$id'),
          body: json.encode(data.toJson()), headers: headers);
      if (response.statusCode == 200) {
        final userJson = json.decode(utf8.decode(response.bodyBytes));
        logger.v(userJson, "updated");
        return true;
      } else {
        logger.e('Failed to update user: $id');
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
        logger.e('Failed to delete:  user ($id) can be used in order');
        return false;
      } else if (response.statusCode == 404) {
        logger.e('Not found:  order ($id)');
        return false;
      } else {
        logger.e('Failed to delete user: $id');
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<dynamic> login(String userName, String passWord) async {
    try {
      final body = json.encode({"userName": userName, "passWord": passWord});
      final response = await http.post(Uri.parse('$baseUri/$_path/login'),
          headers: headers, body: body);
      logger.i(response.body);
      if (response.statusCode == 200) {
        dynamic responseJson = json.decode(utf8.decode(response.bodyBytes));
        logger.i(responseJson);
        return responseJson;
      } else {
        logger.e('Failed to login');
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> logout(String refreshToken) async {
    try {
      final body = json.encode({"refreshToken": refreshToken});
      final response = await http.post(Uri.parse('$baseUri/$_path/logout'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        dynamic responseJson = json.decode(utf8.decode(response.bodyBytes));
        logger.i(responseJson);
        return true;
      } else {
        logger.e('Failed to login');
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<dynamic> refreshToken(String refreshToken) async {
    try {
      final body = json.encode({"refreshToken": refreshToken});
      final response = await http.post(Uri.parse('$baseUri/$_path/refresh-token'),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        dynamic responseJson = json.decode(utf8.decode(response.bodyBytes));
        return responseJson;
      } else {
        logger.e('Failed to refresh-token');
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }


}
