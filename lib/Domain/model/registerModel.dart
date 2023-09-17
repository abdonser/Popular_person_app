// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  int status;
  String message;
  Data data;
  dynamic errors;
  dynamic pagination;
  dynamic overview;

  RegisterModel({
    required this.status,
    required this.message,
    required this.data,
    required this.errors,
    required this.pagination,
    required this.overview,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    errors: json["errors"],
    pagination: json["pagination"],
    overview: json["overview"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
    "errors": errors,
    "pagination": pagination,
    "overview": overview,
  };
}

class Data {
  int id;
  String fullName;
  String email;
  String phone;
  String token;
  String rememberToken;

  Data({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.token,
    required this.rememberToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    fullName: json["full_name"],
    email: json["email"],
    phone: json["phone"],
    token: json["token"],
    rememberToken: json["remember_token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "email": email,
    "phone": phone,
    "token": token,
    "remember_token": rememberToken,
  };
}
