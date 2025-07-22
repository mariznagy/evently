import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/event.dart';

class FirebaseUtils{
  static CollectionReference<Event> getEventsCollection(){
    return FirebaseFirestore.instance.collection(Event.collectionName)
        .withConverter<Event>(
        fromFirestore: (snapshot, options) => Event.fromFireStore(snapshot.data()!),
        toFirestore: (event, options) => event.toFireStore()
    );
  }
  static  Future<void> addEventToFireStore(Event event) {
    CollectionReference<Event>collectionRef= getEventsCollection();

    DocumentReference<Event> docRef = collectionRef.doc();
    //assign
    event.id=docRef.id;
    return docRef.set(event);
  }
}