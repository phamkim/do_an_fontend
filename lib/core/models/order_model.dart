import 'product_model.dart';

class Order {
  Order({
    required this.sId,
    required this.product,
    required this.quantity,
    required this.priceUnit,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String sId;
  late final Product product;
  late final int quantity;
  late final int priceUnit;
  late final String createdAt;
  late final String updatedAt;

  Order.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product = Product.fromJson(json['product']);
    quantity = json['quantity'];
    priceUnit = json['priceUnit'];
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
