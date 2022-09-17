import 'user_model.dart';

class Order {
  String? id;
  String? orderDate;
  String? paymentDate;
  String? state;
  User? user;

  Order({this.id, this.orderDate, this.paymentDate, this.state, this.user});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderDate = json['orderDate'];
    paymentDate = json['paymentDate'];
    state = json['state'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['orderDate'] = orderDate;
    data['paymentDate'] = paymentDate;
    data['state'] = state;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
