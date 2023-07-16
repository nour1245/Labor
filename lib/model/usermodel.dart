class UserModel {
  String? uid;
  String? phone;
  String? name;
  String? photo;
  String? password;

  UserModel({this.uid, this.phone, this.name, this.password, this.photo});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json["uid"];
    phone = json["phone"];
    name = json["name"];
    photo = json["photo"];
    password = json["password"];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'uId': uid,
      'photo': photo,
      'password': password,
    };
  }
}
