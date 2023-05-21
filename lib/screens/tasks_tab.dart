import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/widgets/task_item.dart';
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
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return TaskItem();
          },
          itemCount: 10,
        )),
      ],
    );
  }
}
