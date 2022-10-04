abstract class IGeneralService<T> {
  Future<List<T>?> getAll({String? token, String? query});

  Future<T?> findById(String id, {String? token});

  Future<T?> save(T data, {String? token});

  Future<bool> update(T data, String id, {String? token});

  Future<bool> delete(String id, {String? token});
}
