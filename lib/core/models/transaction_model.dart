import 'order_model.dart';

class Transaction {
  Transaction({
    this.sId,
    this.order,
    this.state,
    this.priceTotal,
    this.user,
    this.createdAt,
    this.updatedAt,
  });
  String? sId;
  List<Order>? order;
  String? state;
  double? priceTotal;
  String? user;
  String? createdAt;
  String? updatedAt;

  Transaction.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    order = List.from(json['order']).map((e) => Order.fromJson(e)).toList();
    state = json['state'];
    priceTotal = double.parse(json['priceTotal'].toString());
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['order'] = order?.map((e) => e.toJson()).toList();
    data['state'] = state;
    data['priceTotal'] = priceTotal;
    data['user'] = user;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
