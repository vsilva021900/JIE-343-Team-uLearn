import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:collection';


StudentModel StudentModelFromJson(String str) => StudentModel.fromJson(json.decode(str));
String StudentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
  String token;
  bool deleted;
  String studentId;
  String teacher;
  DateTime createdAt;
  DateTime updatedAt;

  StudentModel({
    this.token,
    this.deleted,
    this.studentId,
    this.teacher,
    this.createdAt,
    this.updatedAt,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
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

TeacherModel TeacherModelFromJson(String str) => TeacherModel.fromJson(json.decode(str));
String TeacherModelToJson(TeacherModel data) => json.encode(data.toJson());


class TeacherModel {
  String id;
  String name;
  String email;
  String teacher_id;
  String createdAt;
  String updatedAt;

  TeacherModel({
    this.id,
    this.name,
    this.email,
    this.teacher_id,
    this.createdAt,
    this.updatedAt,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) => TeacherModel(
    id: json["_id"],
    name: json["name"],
    email: json["teacher_id"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "teacher_id": teacher_id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}
