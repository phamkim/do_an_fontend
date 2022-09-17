class User {
  String? id;
  String? name;
  String? email;
  String? password;
  String? birthday;
  String? gender;
  String? avatar;
  String? address;
  String? phone;
  String? permission;

  User(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.birthday,
      this.gender,
      this.avatar,
      this.address,
      this.phone,
      this.permission});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    birthday = json['birthday'];
    gender = json['gender'];
    avatar = json['avatar'];
    address = json['address'];
    phone = json['phone'];
    permission = json['permission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['birthday'] = birthday;
    data['gender'] = gender;
    data['avatar'] = avatar;
    data['address'] = address;
    data['phone'] = phone;
    data['permission'] = permission;
    return data;
  }
}
