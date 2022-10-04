class Product {
  Product({
    required this.sId,
    required this.name,
    required this.photo,
    required this.description,
    required this.quantity,
    required this.price,
    required this.discount,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String sId;
  late final String name;
  late final List<String> photo;
  late final String description;
  late final int quantity;
  late final int price;
  late final double discount;
  late final String category;
  late final String createdAt;
  late final String updatedAt;

  Product.fromJson(Map<String, dynamic> json){
    sId = json['_id'];
    name = json['name'];
    photo = json['photo'].cast<String>();
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    discount = json['discount'];
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