
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/TodoController.dart';


class EditTodoPage extends StatefulWidget {
  final int id;
  EditTodoPage(this.id);


  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {

  final todoController = Get.put(TodoController());
  String buttonText = "Edit";
  String anythingWrong = "";
  TextEditingController todoItemController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: 30,),
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width-30,
              child: TextField(
                controller: todoItemController,


              ),
            ),
            SizedBox(height: 10,),
            Center(child: Text("$anythingWrong",style: TextStyle(color: Colors.red),),),
            ElevatedButton(onPressed: () async {
              if (todoItemController.text == "") {
                setState(() {
                  anythingWrong = "Type something!";
                });
              } else {
                var posted = await todoController.editTodos(todoItemController.text,widget.id);
                //if(todoController.isItemPosted.value) {
                //todoController.fetchTodos();
                print("posted$posted");
                if (posted == true) {

                  Get.back();

                } else{
                  setState(() {
                    anythingWrong = "Something went wrong!";
                    buttonText = "Retry";
                  });


                }
              }

            }, child: Text("$buttonText"))
          ],
        ),
      ),
    );
  }
}
