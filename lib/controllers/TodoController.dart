import 'package:get/get.dart';
import 'package:todo_getx/services/remote_services.dart';

class TodoController extends GetxController {
  var remoteServicesInstance = RemoteServices();

  var todos = <dynamic>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchTodos();
    super.onInit();
  }

  void fetchTodos() async {
    isLoading(true);
    try {
      var todoItems = await remoteServicesInstance.getTodosFromServer();
      if (todoItems != null) {
        todos.value = todoItems;
      }
      print("recieved");
    } finally {
      isLoading(false);
    }
  }

  Future<bool> postTodos(String item) async {

    try {

      remoteServicesInstance
          .postTodosToServer(item)
          .then((value) {

        fetchTodos();
      });

      print("recieved");
      return true;
    } finally {
      //return false;
    }
  }
}
