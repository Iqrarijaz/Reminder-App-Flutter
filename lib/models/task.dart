import 'package:flutter/material.dart';

class Task {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startDate;
  String? endDate;
  int? color;
  int? remind;
  String? repeat;

  Task(
      {this.id,
      this.title,
      this.note,
      this.isCompleted,
      this.date,
      this.startDate,
      this.endDate,
      this.color,
      this.remind,
      this.repeat});

//
  Task.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    note = json["note"];
    isCompleted = json["isCompleted"];
    date = json["date"];
    startDate = json["startDate"];
    endDate = json["endDate"];
    color = json["color"];
    remind = json["remind"];
    repeat = json["repeat"];
  }

  //converting data to josn format to save into database
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['note'] = note;
    data['isCompleted'] = isCompleted;
    data['date'] = date;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['color'] = color;
    data['remind'] = remind;
    data['repeat'] = repeat;
    return data;
  }
}
