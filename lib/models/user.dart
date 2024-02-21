import 'dart:convert';
import 'dart:typed_data';

class User {
  int? id;
  String username, name;
  double totalIncome;
  Uint8List? avatar;
  User({
    required this.id,
    required this.username,
    required this.name,
    required this.totalIncome,
    this.avatar,
  });
  factory User.fromJson(Map data) {
    return User(
      id: data["id"],
      username: data["username"] ?? "",
      name: data["name"] ?? "",
      avatar: data['avatar'],
      totalIncome: data["totalIncome"] ?? 10000,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "name": name,
      "totalIncome": totalIncome,
      "avatar": avatar,
    };
  }
}
