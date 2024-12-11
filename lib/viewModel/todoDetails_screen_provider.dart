import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/services/firestore_services.dart';
enum TaskDetailssStatus {
  loading,
  loaded,
  error,
}
class TododetailsScreenProvider extends ChangeNotifier {
  TaskDetailssStatus _taskDetailssStatus = TaskDetailssStatus.loading;
  final TextEditingController _addTodoController = TextEditingController();
  List<TaskModel> _task = [];
  List<TaskModel> get task =>_task;
  TextEditingController get addTodoController=> _addTodoController;
  TaskDetailssStatus get taskDetailssStatus=> _taskDetailssStatus;

  

  void addTodo(List<TaskModel> task,int index) {
    print(_addTodoController.text);
    FirestoreServices().updateTask(task[index].copyWith(todo: [...task[index].todo,TodoModel(isFinish: false, todoTitle: _addTodoController.text)]));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getTask() {
    _taskDetailssStatus = TaskDetailssStatus.loading;
    var task = FirestoreServices().getTask();
    _taskDetailssStatus =TaskDetailssStatus.loaded;
    Future.delayed(Duration(seconds: 1));
    return task;
  }

  void isFinishStateChange(TaskModel task,int index) {
    
    FirestoreServices().updateTask(task);
  }

  void assignTask(List<TaskModel> taskModel) {
     _task = taskModel;
  }
  
}