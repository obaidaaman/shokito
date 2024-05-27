// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String email;
  String password;
  String name;
  String? avatar;
  String role;
  int? id;

  UserModel({
    required this.email,
    required this.password,
    required this.name,
     this.avatar,
    required this.role,
     this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json["email"],
    password: json["password"],
    name: json["name"],
    avatar: json["avatar"],
    role: json["role"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "name": name,
    "avatar": avatar,
    "role": role,
    "id": id,
  };
}
