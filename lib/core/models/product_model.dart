class Product {
  Product({
    this.sId,
    this.name,
    this.photo,
    this.description,
    this.quantity,
    this.price,
    this.discount,
    this.category,
    this.createdAt,
    this.updatedAt,
  });
  String? sId;
  String? name;
  List<String>? photo;
  String? description;
  int? quantity;
  double? price;
  double? discount;
  String? category;
  String? createdAt;
  String? updatedAt;

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photo = json['photo'].cast<String>();
    description = json['description'];
    quantity = json['quantity'];
    price = double.parse(json['price'].toString());
    discount = double.parse(json['discount'].toString());
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['photo'] = photo;
    data['description'] = description;
    data['quantity'] = quantity;
    data['price'] = price;
    data['discount'] = discount;
    data['category'] = category;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
