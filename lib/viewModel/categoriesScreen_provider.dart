import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/services/firestore_services.dart';
enum CatergriesStatus {
  loading,
  loaded,
  error,
}
class CategoriesscreenProvider extends ChangeNotifier {

  String? _networkImage;
  String? get networkImage => _networkImage;
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

  //for get the completed lask lenth
  int getCompletedTaskLength(TaskModel task) {
    int length = 0 ;
    for( var todo in task.todo) {
      if(todo.isFinish) {
        length ++;
      }
    }
    return length;
  }

  //for if user changed profile that time we want to update
  void updateProfile()  {
    _networkImage = FirebaseAuth.instance.currentUser!.photoURL;
    notifyListeners();
  }

  //for starting time _network Image is null so we assign the firebase profile link to the netwrok image
  void openCatergories() {
    _networkImage = FirebaseAuth.instance.currentUser!.photoURL;
  }

}