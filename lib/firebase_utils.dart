import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/task.dart';

class FirebaseUtils{

  static CollectionReference<Task>  getTasksCollection (){
    return FirebaseFirestore.instance.collection(Task.collectionName).
    withConverter<Task>(
      fromFirestore: (snapshot,options) => Task.fromFireStore(snapshot.data()!),
      toFirestore: (task,options) => task.toFireStore(),
    );
  }
  static Future<void>addTaskToFireStore(Task task){
    var taskCollection=getTasksCollection ();
    var docRef=taskCollection.doc();
    task.id=docRef.id;
    return docRef.set(task);

  }
}