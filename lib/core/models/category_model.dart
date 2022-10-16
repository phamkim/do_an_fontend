class Category {
  Category({
     this.sId,
     this.name,
     this.photo,
     this.description,
     this.createdAt,
     this.updatedAt,
  });
   String? sId;
   String? name;
   String? photo;
   String? description;
   String? createdAt;
   String? updatedAt;

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