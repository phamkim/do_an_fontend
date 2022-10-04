class Category {
  Category({
    required this.sId,
    required this.name,
    required this.photo,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String sId;
  late final String name;
  late final String photo;
  late final String description;
  late final String createdAt;
  late final String updatedAt;

  Category.fromJson(Map<String, dynamic> json){
    sId = json['_id'];
    name = json['name'];
    photo = json['photo'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['photo'] = photo;
    data['description'] = description;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}