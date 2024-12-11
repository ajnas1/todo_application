import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/viewModel/categoriesScreen_provider.dart';

Future<void> displayTaskDialog(BuildContext context,TextEditingController taskController,TextEditingController emogieController) async {
  String? taskError;
  String? emogieError;
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextField(
            controller: taskController,
            decoration: InputDecoration(
              errorText: taskError,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              hintText: 'Enter Task',
              
            ),
          ),
        ),
        const SizedBox(height: 5,),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextField(
            controller: emogieController,
            decoration: InputDecoration(
              errorText: emogieError,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              hintText: 'Enter Emogie',
              
            ),
          ),
        ),
          ],
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
                    Provider.of<CategoriesscreenProvider>(context,listen: false).addTask();
                    taskController.clear();

                Navigator.pop(context);
              }),
        ],
      ),
    );
  }