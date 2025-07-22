import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../model/event.dart';
import '../utils/firebase.dart';

class EventListProvider extends ChangeNotifier{
  List<Event> eventList = [];
  List<Event> filterEventList = [];
  List<String> eventNameList= [];
  int selectedIndex = 0;

  List<String> getEventNameList(BuildContext context){
  return eventNameList= [
    AppLocalizations.of(context)!.all,
    AppLocalizations.of(context)!.sport,
    AppLocalizations.of(context)!.birthday
    ,AppLocalizations.of(context)!.meeting,
    AppLocalizations.of(context)!.gaming
    ,AppLocalizations.of(context)!.workshop,
    AppLocalizations.of(context)!.book_club
    ,AppLocalizations.of(context)!.exhibition,
    AppLocalizations.of(context)!.holiday
    ,AppLocalizations.of(context)!.eating,
  ];
}
  void getAllEvents()async{
    QuerySnapshot<Event> querySnapshot =
    await FirebaseUtils.getEventsCollection().get();
    eventList = querySnapshot.docs.map((doc) {
      return doc.data();
    },).toList();
    filterEventList = eventList;
   notifyListeners();
  }
void getFilterEvents()async{
   var querySnapshot = await FirebaseUtils.getEventsCollection().get();
   eventList = querySnapshot.docs.map((doc) {
        return doc.data();
   },).toList();
   filterEventList = eventList.where((event){
     return event.eventName == eventNameList[selectedIndex];
   },).toList();
}
void changeSelectedIndex( int newSelectedIndex){
  selectedIndex= newSelectedIndex;
  selectedIndex == 0 ? getAllEvents() : getFilterEvents();
  notifyListeners();

}
}