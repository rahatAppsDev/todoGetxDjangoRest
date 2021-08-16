



import 'package:flutter/material.dart';
import 'package:todo_getx/controllers/TodoController.dart';
import 'package:get/get.dart';


class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final todoController = Get.put(TodoController());
  String buttonText = "Add";
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
              var posted = await todoController.postTodos(todoItemController.text);
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
