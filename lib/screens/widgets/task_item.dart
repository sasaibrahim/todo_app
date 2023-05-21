import 'package:flutter/material.dart';
import 'package:todo_app/shared/styles/app_colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  "Task Title",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: lightColor,
                      ),
                ),
                Text(
                  "Task Description",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
            Spacer(),
            Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 18),
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
