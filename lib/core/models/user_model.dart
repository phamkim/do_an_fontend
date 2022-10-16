class User {
  String? sId;
  String? displayName;
  String? photo;
  String? userName;
  String? passWord;
  List<String>? role;
  String? createdAt;
  String? updatedAt;
  String? refreshToken;

  User(
      {this.sId,
        this.displayName,
        this.photo,
        this.userName,
        this.passWord,
        this.role,
        this.createdAt,
        this.updatedAt,
        this.refreshToken});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    displayName = json['displayName'];
    photo = json['photo'];
    userName = json['userName'];
    passWord = json['passWord'];
    role = json['role'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['displayName'] = displayName;
    data['photo'] = photo;
    data['userName'] = userName;
    data['passWord'] = passWord;
    data['role'] = role;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['refreshToken'] = refreshToken;
    return data;
  }
}