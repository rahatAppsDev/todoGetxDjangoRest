import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/TodoController.dart';
import 'package:todo_getx/models/todoModel.dart';
import 'package:todo_getx/views/addnewtodo.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    //Get.offNamed('/addTodo');
                   Get.toNamed('/addTodo');
                    //Navigator.push(context,
                       // MaterialPageRoute(builder: (context) => AddTodo()));
                  },
                  icon: Icon(Icons.add)),
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(child: Obx(() {
                if (todoController.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return StaggeredGridView.countBuilder(
                      crossAxisCount: 1,
                      itemCount: todoController.todos.length,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          color: Colors.grey,
                          child: Text(
                              "${todoController.todos[index].itemdetails}"),
                        );
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1));
                }
              })),
            ],
          )),
    );
  }
}
