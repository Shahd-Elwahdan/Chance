

class UserModel {
  String? name;
  String? age;
  String? phone;
  UserModel({this.age, this.name, this.phone});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
    name : json["username"],
    age : json["age"],
    phone : json["phone"]
    );
  }
}
