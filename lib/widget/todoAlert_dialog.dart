import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/viewModel/todoDetails_screen_provider.dart';

Future<void> displayTodoDialog(
  BuildContext context,
  TextEditingController todoController,List<TaskModel> task,int index
) async {
  String? taskError;
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Add Task'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextField(
          controller: todoController,
          decoration: InputDecoration(
            errorText: taskError,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            hintText: 'Enter Task',
            
          ),
        ),
      ),
      actions: [
        MaterialButton(
            child: const Text(
              'Cancel',
              style: TextStyle(
                  fontSize: 20),
            ),
            onPressed: () {

              Navigator.pop(context);
            }),
        MaterialButton(
            child: const Text('Add',
                style: TextStyle(
                    fontSize: 20)),
            onPressed: () {
              Provider.of<TododetailsScreenProvider>(context, listen: false)
                  .addTodo(task,index);
              todoController.clear();

              Navigator.pop(context);
            }),
      ],
    ),
  );
}
