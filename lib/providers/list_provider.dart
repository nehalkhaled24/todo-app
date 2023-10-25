import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../firebase_utils.dart';
import '../model/task.dart';

class ListProvider extends ChangeNotifier {
  List<Task> taskList = [];
  DateTime selectDate=DateTime.now();

  void getAllTasksFromFireStore() async {
    QuerySnapshot<Task> querySnapshot =
        await FirebaseUtils.getTasksCollection().get();
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    taskList=taskList.where((task) {
      if(task.dateTime?.day==selectDate.day&&
          task.dateTime?.month==selectDate.month&&
          task.dateTime?.year==selectDate.year){
               return true;
      }
      return false;
    }).toList();

        taskList.sort((Task task1,Task task2){
          return task1.dateTime!.compareTo(task2.dateTime!);
        });
    notifyListeners();
  }
  void changeSelectedDate (DateTime newDate){
    selectDate = newDate;
    getAllTasksFromFireStore();
    notifyListeners();
  }
}
