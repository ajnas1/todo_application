import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/model/task_model.dart';


const String TASK_COLLECTION_REF = 'task';

const String TODOS_COLLECTION_REF = 'todos';

class FirestoreServices {
 
  final CollectionReference _collectionRef = FirebaseFirestore.instance.collection(TASK_COLLECTION_REF);

  final user = FirebaseAuth.instance.currentUser;

  //to add new task
  void addTask (TaskModel task) async{
    await _collectionRef.doc(user?.uid).collection(TODOS_COLLECTION_REF).add(task.toJson());
  }

  //to retrieve all  task 
  Stream<QuerySnapshot<Map<String, dynamic>>> getTask() {
   
    return _collectionRef.doc(user?.uid).collection(TODOS_COLLECTION_REF).snapshots();

  }
  
  // to update the data existing task
  void updateTask(TaskModel task) async {

   await _collectionRef.doc(user?.uid).collection(TODOS_COLLECTION_REF).where("task",isEqualTo: task.task).limit(1).get().then((res){
    res.docs.forEach((result){
      _collectionRef.doc(user?.uid).collection(TODOS_COLLECTION_REF).doc(result.id).update(task.toJson());
    });

   });
  }

}
