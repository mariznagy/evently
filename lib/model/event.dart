class Event{
  static const  String collectionName = 'Events';
  String id;
  String eventImage;
  String eventName;
  String title;
  String description;
  String eventTime;
  DateTime eventDate;
  bool isFav;
Event({
    this.id='',
  required this.title,
  required this.description ,
  required this.eventName,
  required this.eventDate,
  required this.eventTime,
  required this.eventImage ,
  this.isFav= false
});
//todo: json=> obj
  Event.fromFireStore(Map<String,dynamic> data):this(
    id : data['id'],
   title : data['title'],
    eventTime: data['eventTime'],
    eventDate: DateTime.fromMillisecondsSinceEpoch(data['eventDate']),
    eventName: data['eventName'],
    eventImage: data['eventImage'],
   description: data['description'],
   isFav: data['isFav'],
  );
// todo: obj=>json
Map<String,dynamic> toFireStore(){
  return {
    'id':id,
    'title':title,
    'eventTime':eventTime,
    'eventDate':eventDate.millisecondsSinceEpoch,
    'eventName':eventName,
    'eventImage':eventImage,
    'description':description,
    'isFav':isFav,
  };
}
}