import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/tasks_model.dart';
import 'package:todo_app/screens/widgets/task_item.dart';
import 'package:todo_app/shared/network/firebase/firebase_function.dart';
import 'package:todo_app/shared/styles/app_colors.dart';

class TaskTap extends StatefulWidget {
  @override
  State<TaskTap> createState() => _TaskTapState();
}

class _TaskTapState extends State<TaskTap> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: lightColor,
            inactiveDates: [DateTime.now().add(Duration(days: 2))],
            height: 100,
            selectedTextColor: Colors.white, onDateChange: (newDate) {
          // New date selected
          setState(() {
            date = newDate;
          });
        }),
        StreamBuilder(
          stream: FirebaseFunction.getTaskFromFirestore(date),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Column(
                children: [
                  Text('somethingwent wrong'),
                  ElevatedButton(onPressed: () {}, child: Text('Try again')),
                ],
              );
            }
            List<TaskModel> tasks =
                snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return TaskItem(tasks[index]);
                },
                itemCount: tasks.length,
              ),
            );
          },
        ),
      ],
    );
  }
}
