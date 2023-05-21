import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/tasks_model.dart';

class FirebaseFunction {
  void addTask() {
    FirebaseFirestore.instance.collection('Tasks').withConverter<TaskModel>(
          fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
          toFirestore: (task, options) => task.toJson(),
        );
  }
}
