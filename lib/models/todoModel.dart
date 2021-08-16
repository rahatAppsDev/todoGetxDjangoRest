


import 'dart:convert';

List<TodoModel> TodoModelFromJson(dynamic str) => List<TodoModel>.from(str.map((x) => TodoModel.fromJson(x)));

String TodoModelToJson(List<TodoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoModel {
  TodoModel({
    required this.id,
    required this.itemdetails,
  });

  int id;
  String itemdetails;

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
    id: json["id"],
    itemdetails: json["itemdetails"],
  );

  Map<String, dynamic> toJson() => {
    //"id": id,
    "itemdetails": itemdetails,
  };
}
