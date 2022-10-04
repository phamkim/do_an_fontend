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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['displayName'] = this.displayName;
    data['photo'] = this.photo;
    data['userName'] = this.userName;
    data['passWord'] = this.passWord;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}