import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_project/firebase_database/firebase_task.dart';

class FBDbHelper {
  FBDbHelper._();
  static final FBDbHelper fbDbHelper = FBDbHelper._();
  DatabaseReference databaseReference;
  DatabaseReference initFBDB() {
    if (databaseReference == null) {
      databaseReference = FirebaseDatabase.instance.reference();
      return databaseReference;
    } else {
      return databaseReference;
    }
  }

  insertNewFirebaseTask(FirebaseTask task) {
    databaseReference = initFBDB();
    databaseReference.push().set(task.toJson());
  }

  insertNewFirebaseNamedTask(FirebaseTask task) {
    databaseReference = initFBDB();
    databaseReference.push().child('WacChild2').set(task.toJson());
  }

  getAllData() async {
    try {
      databaseReference = initFBDB();
      DataSnapshot dataSnapshot = await databaseReference.once();
      // Map<String, dynamic> map = (dataSnapshot.value) as Map;
      print(dataSnapshot.value.runtimeType);
      Map<String, dynamic> myMap =
          Map<String, dynamic>.from(dataSnapshot.value);
      print(myMap['WacChild2']);
    } catch (error) {
      print(error);
    }
  }

  getSpecificData() async {
    try {
      databaseReference = initFBDB();
      DataSnapshot dataSnapshot = await databaseReference.once();
    } catch (error) {
      print(error);
    }
  }

  Stream<Stream<Event>> childIsChanged() async* {
    Stream<Event> events = databaseReference.onChildChanged;
    yield events;
  }

  deleteTask() async {
    try {
      databaseReference = initFBDB();

      // await databaseReference.child('WacChild').update();
      // Map<String, dynamic> map = (dataSnapshot.value) as Map;

    } catch (error) {
      print(error);
    }
  }

  deleteAllTasks() {}
  updateTask() {}
}
