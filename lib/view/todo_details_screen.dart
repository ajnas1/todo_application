import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/viewModel/todoDetails_screen_provider.dart';
import 'package:todo/widget/todoAlert_dialog.dart';

class TodoDetailsScreen extends StatelessWidget {
  const TodoDetailsScreen(
      {super.key,  required this.taskIndex});
  
  final int taskIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sport'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          displayTodoDialog(
              context,
              Provider.of<TododetailsScreenProvider>(context, listen: false)
                  .addTodoController,
              context.read<TododetailsScreenProvider>().task,taskIndex);
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(70, 70),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0),
          backgroundColor: const Color(0xFF373F4A),
          foregroundColor: Colors.white,
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Consumer<TododetailsScreenProvider>(
        builder: (context, value, child) => StreamBuilder(
            stream:
                Provider.of<TododetailsScreenProvider>(context, listen: false)
                    .getTask(),
            builder: (context, snapshot) {
              value.assignTask(snapshot.data?.docs
                      .map((doc) => TaskModel.fromJson(
                          doc.data() as Map<String, dynamic>))
                      .toList() ??
                  []);
              print(snapshot.hasData);
              if (value.taskDetailssStatus == TaskDetailssStatus.loaded &&
                  value.task.isNotEmpty) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SizedBox(width: 30,),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Center(
                              child: ElevatedButton(
                                      onPressed: () {
                                        
                                        value.task[taskIndex].todo[index].isFinish = !value.task[taskIndex].todo[index].isFinish;
                                        value.isFinishStateChange(value.task[taskIndex],index);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(0),
                                          backgroundColor: value.task[taskIndex].todo[index].isFinish? Colors.green:Colors.white,
                                          shape: const CircleBorder(),
                                          side:  BorderSide(
                                              color: value.task[taskIndex].todo[index].isFinish?Colors.white: Colors.green,
                                              width: 1),
                                          fixedSize: Size(MediaQuery.of(context).size.width * 0.065,
                                              MediaQuery.of(context).size.height * 0.065)),
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      )),
                            ),
                          ),
                                  SizedBox(width: 30,),
                          Text(value.task[taskIndex].todo[index].todoTitle),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: value.task[taskIndex].todo.length);
              } else if (value.taskDetailssStatus ==
                  TaskDetailssStatus.loaded) {
                return const Center(
                  child: const CircularProgressIndicator(),
                );
              }
              return const SizedBox();
            }),
      ),
    );
  }
}
