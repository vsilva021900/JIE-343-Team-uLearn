library hearatale_literacy_app.globals;
import 'package:http/http.dart' as http;
import 'package:hearatale_literacy_app/globals.dart' as globals;
import 'dart:convert';
import 'package:intl/intl.dart';


String teacherID;
String studentID;
String studentJWT;


pushUserDataForFocusItem(int correcton, String focusItem) async {
  print("Attempting to push quiz 1 data to DAP");
  final response = await http.post(
    Uri.https("teacherportal.hearatale.com", "/api/analytics/application"),
    headers: {
      "Authorization": globals.studentJWT,
    },
    body: {
      "student": globals.teacherID + globals.studentID,
      "program": "Third Grade Literacy App",
      "focus_item": focusItem,
      "correct_on": correcton.toString(), // The number of times it took get the question correct
      "time_spent": DateTime.now().toString() // The time spent looking at the question
    },);
}