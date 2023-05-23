import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/tasks_model.dart';

class FirebaseFunction {
  static CollectionReference<TaskModel> getCollectionTasks() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (task, options) {
        return task.toJson();
      },
    );
  }

  static Future<void> addTaskFirestore(TaskModel task) {
    var collection = getCollectionTasks();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTaskFromFirestore(DateTime date) {
    var collection = getCollectionTasks();
    return collection
        .where('date',
            isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteTask(String id) {
    return getCollectionTasks().doc(id).delete();
  }

  static Future<void> updateTask(String id, TaskModel task) {
    return getCollectionTasks().doc(id).update(task.toJson());
  }
}
