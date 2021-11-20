import 'package:app/models/task.dart';
import 'package:get/get.dart';
import 'package:app/database/db_helper.dart';

class TaskController extends GetxController {
  void onReady() {
    super.onReady();
  }

  Future<int> addTask({Task? task}) async{
    return await DatabaseHelper.insert(task);
  }
}
