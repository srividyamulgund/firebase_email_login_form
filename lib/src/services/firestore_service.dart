import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseemailloginform/src/models/entry.dart';


class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

//Get Entries
Stream<List<Entry>> getEntries() {
  return _db
      .collection('entries')
      //if you need to get anything older than 30 days
      //.where('date', isGreaterThan: DateTime.now().add(Duration(days: -30)).toIso8601String())
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Entry.fromJson(doc.data())).toList());
}

//Create & Update = Upsert
Future<void> setEntry(Entry entry) {
  var options = SetOptions(merge: true)
  return _db.collection('entries')
  .doc(entry.entryId)
  .set(entry.toMap(), options);
}
//Delete
Future<void> removeEntry(String entryId){
  return _db
  .collection('entries')
  .doc(entryId)
  .delete();
}
}
