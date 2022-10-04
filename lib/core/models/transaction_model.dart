import 'order_model.dart';

class Transaction {
  Transaction({
    required this.sId,
    required this.order,
    required this.state,
    required this.priceTotal,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String sId;
  late final List<Order> order;
  late final String state;
  late final int priceTotal;
  late final String user;
  late final String createdAt;
  late final String updatedAt;

  Transaction.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    order = List.from(json['order']).map((e) => Order.fromJson(e)).toList();
    state = json['state'];
    priceTotal = json['priceTotal'];
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['order'] = order.map((e) => e.toJson()).toList();
    data['state'] = state;
    data['priceTotal'] = priceTotal;
    data['user'] = user;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
