import 'category_model.dart';

class Product {
  String? id;
  String? name;
  String? image;
  String? description;
  double? price;
  int? quantity;
  double? discount;
  Category? category;

  Product(
      {this.id,
        this.name,
        this.image,
        this.description,
        this.price,
        this.quantity,
        this.discount,
        this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
    discount = json['discount'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['price'] = price;
    data['quantity'] = quantity;
    data['discount'] = discount;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}