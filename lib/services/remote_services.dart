



import 'dart:convert';

import 'package:get/get.dart';
import 'package:todo_getx/models/todoModel.dart';

class RemoteServices extends GetConnect {

  Future getTodosFromServer() async {
    print("calling");


    var response = await get("http://192.168.0.166:8000/items/");
    print("body ${response.body}");
    if (response.statusCode == 200) {
      var jsonString = response.body;

      return TodoModelFromJson(jsonString);
    } else {
      return null;
    }

  }

  Future postTodosToServer(String item) async {
    var todoToJson = json.encode({"itemdetails":item});

    print("tojson $todoToJson");
    var response = await post("http://192.168.0.166:8000/post_items/",todoToJson);
    print("body ${response.statusCode}");

  }
}