import 'product_model.dart';

class Order {
  Order({
    this.sId,
    required this.product,
    required this.quantity,
    required this.priceUnit,
    this.createdAt,
    this.updatedAt,
  });

  String? sId;
  late final Product product;
  int quantity = 0;
  double priceUnit = 0.0;
  String? createdAt;
  String? updatedAt;

  Order.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product = Product.fromJson(json['product']);
    quantity = json['quantity'];
    priceUnit = double.parse(json['priceUnit'].toString());
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['product'] = product.toJson();
    data['quantity'] = quantity;
    data['priceUnit'] = priceUnit;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
