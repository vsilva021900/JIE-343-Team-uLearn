import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:collection';


UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String token;
  bool deleted;
  String studentId;
  String teacher;
  DateTime createdAt;
  DateTime updatedAt;

  UserModel({
    this.token,
    this.deleted,
    this.studentId,
    this.teacher,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    token: json["token"],
    deleted: json["deleted"],
    studentId: json["student_id"],
    teacher: json["teacher"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "deleted": deleted,
    "student_id": studentId,
    "teacher": teacher,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}
