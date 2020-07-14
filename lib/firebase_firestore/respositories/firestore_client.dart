import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/firebase_firestore/models/firestore_task.dart';

class FireStoreClient {
  FireStoreClient._();
  static final FireStoreClient fireStoreClient = FireStoreClient._();
  Firestore firestore;
  Firestore initFirestore() {
    if (firestore == null) {
      return Firestore.instance;
    } else {
      return firestore;
    }
  }

  insertNewInstance() async {
    firestore = initFirestore();
    DocumentReference documentReference =
        await firestore.collection('Tasks').add({
      'name': 'omar',
      'age': 8,
      'hoppies': ['gaming', 'football', 'reading']
    });
    documentReference.collection('completedTasks').add({
      'tasks': ['homework', 'reading', 'gaming']
    });
  }

  insertNewInstanceWithCustomDocumentId() async {
    firestore = initFirestore();
    firestore.collection('Tasks').document('wacDocument').updateData({
      'myName': 'shady',
    });
  }

  getAllDocuments() async {
    firestore = initFirestore();
    DocumentSnapshot documentSnapshot = await firestore
        .collection('Tasks')
        .document('1oBETNUqq5QrRQTbQ4SM')
        .get();
    print(documentSnapshot.data);
    // List<DocumentSnapshot> documentsSnapShot = querySnapshot.documents;
    // documentsSnapShot.forEach((element) {
    //   print(element.data);
    // });
  }

  insertNewTask(FirestoreTask task) async {
    try {
      firestore = initFirestore();
      await firestore.collection('Tasks').add(task.toJson());
    } catch (error) {
      print(error);
    }
  }

  getAllTasks() async {
    try {
      firestore = initFirestore();
      QuerySnapshot querySnapshot =
          await firestore.collection('Tasks').getDocuments();
      List<DocumentSnapshot> documentSnapshot = querySnapshot.documents;
      List<FirestoreTask> tasks = documentSnapshot.map((e) {
        return FirestoreTask.fromJson(e.data);
      }).toList();
      print(tasks.first.title);
      print(tasks.length);
    } catch (error) {
      print(error);
    }
  }

  getCompleteTasks() async {
    try {
      firestore = initFirestore();
      QuerySnapshot querySnapshot = await firestore
          .collection('Tasks')
          .document('5dSfiSD6308bTOT99ZKA')
          .collection('periority')
          .getDocuments();

      List<DocumentSnapshot> documentSnapshot = querySnapshot.documents;
      List<FirestoreTask> tasks = documentSnapshot.map((e) {
        return FirestoreTask.fromJson(e.data);
      }).toList();
      print(tasks.first.title);
      print(tasks.length);
    } catch (error) {
      print(error);
    }
  }

  insertNewPeriority(Periority periority) async {
    firestore = initFirestore();
    firestore.collection('Periority').add(periority.toJson());
  }

  insertNewTaskWithPeriority(String periorityName) async {
    firestore = initFirestore();
    QuerySnapshot querySnapshot = await firestore
        .collection('Periority')
        .where('name', isEqualTo: periorityName)
        .getDocuments();
    Periority periority =
        Periority.fromJson(querySnapshot.documents.first.data);
    // if (periority == null) {
    //   firestore
    //       .collection('Periority')
    //       .add(Periority(name: periorityName, color: 'unKnown').toJson())
    //       .then((value) async{
    //     DocumentSnapshot document = await value.get();
    //   });
    // }
    firestore.collection('Tasks').add(FirestoreTask(
            date: '22',
            description: '22',
            isComplete: true,
            title: 'gg',
            periority: periority)
        .toJson());
  }

  complextQuery() async {
    try {
      firestore = initFirestore();
      QuerySnapshot querySnapshot = await firestore
          .collection('Tasks')
          .where('isComplete', isEqualTo: true)
          .where('periority.name', isEqualTo: 'important')
          .getDocuments();
      List<DocumentSnapshot> documents = querySnapshot.documents ?? [];
      print(documents.isNotEmpty ? documents.first.data : 'not found');
    } catch (error) {
      print(error);
    }
  }
}
