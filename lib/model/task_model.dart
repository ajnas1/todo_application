import 'package:flutter/material.dart';
import 'package:todo/model/todo_model.dart';

class TaskModel {
  // String iconUrl;
  String task;
  String emogie;
   IconData? icon=Icons.add;
  List<TodoModel> todo;

  TaskModel({required this.task, required this.todo,required this.emogie,this.icon});

  Map<String, dynamic> toJson() {
    return {
      'emogie': emogie,
      'task': task,
      'todo': todo.map((todo) => todo.toJson()).toList(),
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      emogie: json['emogie'],
      task: json['task'],
      todo: json['todo'] != null
          ? (json['todo'] as List)
              .map((todo) => TodoModel.fromJson(todo))
              .toList()
          : [],
    );
  }

  TaskModel copyWith({String? task,String? emogie,List<TodoModel>? todo}){
    return TaskModel(
      task: task ?? this.task,
      todo: todo ?? this.todo,
      emogie: emogie ?? this.emogie
    );
   }

}
