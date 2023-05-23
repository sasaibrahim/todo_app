import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/models/tasks_model.dart';
import 'package:todo_app/shared/network/firebase/firebase_function.dart';
import 'package:todo_app/shared/styles/app_colors.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent)),
      child: Slidable(
        startActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                FirebaseFunction.deleteTask(task.id);
              },
              label: 'delete',
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            SlidableAction(
              onPressed: (context) {},
              label: 'edit',
              icon: Icons.edit,
              backgroundColor: Colors.blue,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 12,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.transparent)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: lightColor,
                  ),
                  margin: EdgeInsets.only(
                    top: 6,
                    bottom: 6,
                    left: 22,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: task.status ? Colors.lightGreen : lightColor,
                          ),
                    ),
                    Text(
                      task.description,
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
                Spacer(),
                task.status
                    ? Text(
                        'Done!',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.lightGreen),
                      )
                    : InkWell(
                        onTap: () {
                          task.status = true;
                          FirebaseFunction.updateTask(task.id, task);
                        },
                        child: Container(
                            margin: EdgeInsets.only(right: 16),
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 18),
                            decoration: BoxDecoration(
                              color: lightColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 30,
                            )),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
