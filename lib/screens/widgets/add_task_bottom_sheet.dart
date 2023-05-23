import 'package:flutter/material.dart';
import 'package:todo_app/models/tasks_model.dart';
import 'package:todo_app/shared/network/firebase/firebase_function.dart';
import 'package:todo_app/shared/styles/app_colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formkey = GlobalKey<FormState>();
  var selected = DateUtils.dateOnly(DateTime.now());

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add New Task",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter Task title";
                } else if (value.length < 10) {
                  return "please enter at least 10 char";
                }
                return null;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text("Task Title"),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: lightColor,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: lightColor,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: descriptionController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter Task Description";
                }
                return null;
              },
              maxLines: 3,
              decoration: InputDecoration(
                label: Text("Task Description"),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: lightColor,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: lightColor,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                "SelectData",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                chosseDate();
              },
              child: Text(
                selected.toString().substring(0, 10),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: lightColor,
                    ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  TaskModel task = TaskModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      date: selected.millisecondsSinceEpoch,
                      status: false);
                  FirebaseFunction.addTaskFirestore(task).then((value) {
                    Navigator.pop(context);
                  });
                }
              },
              child: Text("add task"),
            ),
          ],
        ),
      ),
    );
  }

  void chosseDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (selectedDate != null) {
      selected = DateUtils.dateOnly(selectedDate);
      setState(() {});
    }
  }
}
