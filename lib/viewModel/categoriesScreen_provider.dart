import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/services/firestore_services.dart';
enum CatergriesStatus {
  loading,
  loaded,
  error,
}
class CategoriesscreenProvider extends ChangeNotifier {
  final TextEditingController _addTaskController = TextEditingController();
   CatergriesStatus _catergriesStatus = CatergriesStatus.loading;
  
  TextEditingController get addTaskController=> _addTaskController;
  final TextEditingController _addEmogieController = TextEditingController();
  
  TextEditingController get addEmogieController=> _addEmogieController;

 
 
  CatergriesStatus get catergriesStatus => _catergriesStatus;

  void addTask() {
    if(_addTaskController.text.isNotEmpty) {
      FirestoreServices().addTask(TaskModel(task: _addTaskController.text, todo: [],emogie:  _addEmogieController.text));
    }
  }
  
  Stream<QuerySnapshot<Map<String, dynamic>>> getTaskName() {
    _catergriesStatus = CatergriesStatus.loading;
    Future.delayed(Duration(seconds: 4));
    var task = FirestoreServices().getTask();
    _catergriesStatus =CatergriesStatus.loaded;
    
    return task;
  }

}