import 'package:flutter/material.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/utlities/constants.dart';
import 'package:todo/view/todo_details_screen.dart';
import 'package:todo/widget/taskAlert_dialog_widget.dart';

Widget categoriesWidget(
    BuildContext context,
    TaskModel? task,
    int? completedTaskLength,
    TextEditingController titleController,
    TextEditingController emogieController,
    int? index,
    {bool isNotFirst = true}) {
  return GestureDetector(
    onTap: () {
      if (isNotFirst && index !=null) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TodoDetailsScreen(
            taskIndex: index!,
          ),
        ));
      } else {
        displayTaskDialog(context, titleController, emogieController);
      }
    },
    child: Material(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.445,
          child: isNotFirst && task!=null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.emogie),
                    Text(
                      task.task,
                      style: const TextStyle(
                          fontSize: categoriesScreenMediumTitleSize,
                          fontWeight: FontWeight.w700),
                    ),
                    Text('${task.todo.length} tasks'),
                    Text('completed task $completedTaskLength'),
                  ],
                )
              : const Center(
                  child: Text(
                    "+",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
        )),
  );
}
