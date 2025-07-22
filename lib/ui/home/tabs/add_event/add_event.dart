import 'package:evently/model/event.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/ui/home/tabs/add_event/widget/date_or_time.dart';
import 'package:evently/ui/home/tabs/add_event/widget/show_dialog.dart';
import 'package:evently/ui/home/tabs/home_tab/widget/custom_text.dart';
import 'package:evently/ui/home/tabs/home_tab/widget/event_item.dart';
import 'package:evently/utils/app_images.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:evently/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../provider/event_list.dart';
import '../../../../utils/app_color.dart';
import '../home_tab/widget/custom_elevated_button.dart';
import '../home_tab/widget/event_tab_list.dart';

class AddEvent extends StatefulWidget {
  static const String addEventRouteName= 'add_event';

   AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
int selectedIndex=0;
TextEditingController titleController = TextEditingController() ;
TextEditingController descriptionController = TextEditingController() ;
var formKey = GlobalKey<FormState>();
DateTime? selectedDate;
String formatedDate = '';
TimeOfDay? selectedTime;
String formatedTime = '';
String selectedEventName='';
String selectedEventImage='';
late EventListProvider eventListProvider;
@override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    eventListProvider = Provider.of<EventListProvider>(context);

    //todo: min 25
    List<String> eventNameList= [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
    List<String> eventImageList =[
      AppAssets.sport,
      AppAssets.bgEvent,
      AppAssets.meeting,
      AppAssets.gaming,
      AppAssets.workShop,
      AppAssets.book_club,
      AppAssets.exhibition,
      AppAssets.holiday,
      AppAssets.eating,

    ];
    return Scaffold(
      appBar: AppBar(

        backgroundColor: AppColors.lightBgColor,
        title: Text(AppLocalizations.of(context)!.create_event,
          style: AppFonts.bold20Primary,
          ),
        centerTitle: true,
      ) ,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: height*0.02,),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                  child: Image.asset(eventImageList[selectedIndex])
              ),
              SizedBox(height: height*0.02,),
              SizedBox(height: height*0.04,
              child:
              ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    selectedIndex= index;
                    setState(() {

                    });
                  },
                  child: EventTabList(
                    borderColor: AppColors.primaryLightColor,
                    selectedBgColor: AppColors.primaryLightColor,
                    selectedTextStyle: Theme.of(context).textTheme.headlineSmall! ,
                    unselectedTextStyle: Theme.of(context).textTheme.headlineMedium!,
                    eventName: eventNameList[index],
                    isSelected: selectedIndex==index,),
                );
              },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: width*0.02,);
                  },
                  itemCount: eventNameList.length),),
              Form(
                  key: formKey,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height*0.02,),
                  Text(AppLocalizations.of(context)!.tittle,
                    style: Theme.of(context).textTheme.titleLarge,),
                  SizedBox(height: height*0.01,),
                  CustomTextFiled(controller: titleController,
                    validator: (text){
                      if(text == null || text.trim().isEmpty){
                        return 'Please enter Event Title';
                      }
                      return null;
                    },
                    prefixIcon: Icon(Icons.add_to_home_screen),
                    hintText: AppLocalizations.of(context)!.event_tittle,
                  hintStyle: Theme.of(context).textTheme.titleMedium,
                    colorBorderSide: themeProvider.isDark()? AppColors.primaryLightColor: AppColors.greyColor,
                  ),
                  SizedBox(height: height*0.02,),
                  Text(AppLocalizations.of(context)!.description,
                    style: Theme.of(context).textTheme.titleLarge,),
                  SizedBox(height: height*0.01,),
                  CustomTextFiled(controller: descriptionController,
                    validator: (text){
                      if(text == null || text.trim().isEmpty){
                        return 'Please enter Event description';
                      }
                      return null;
                    },
                    hintText: AppLocalizations.of(context)!.description,
                    hintStyle: Theme.of(context).textTheme.titleMedium,
                    colorBorderSide: themeProvider.isDark()? AppColors.primaryLightColor: AppColors.greyColor,
                    maxLines: 3,),
                  SizedBox(height: height*0.02,),
                  DateOrTime(chooseDateOrTime:selectedDate== null ?
                  AppLocalizations.of(context)!.choose_date: formatedDate,
                      iconDateOrTime: AppAssets.date,
                      eventDateOrTime:AppLocalizations.of(context)!.event_date
                     ,
                      onChooseDateOrTimeClick: chooseDate),
                  //SizedBox(height: height*0.01,),
                  DateOrTime(chooseDateOrTime: selectedTime== null ?
                  AppLocalizations.of(context)!.choose_time  : formatedTime,
                      iconDateOrTime: AppAssets.time,
                      eventDateOrTime: AppLocalizations.of(context)!.event_time,
                      onChooseDateOrTimeClick: chooseTime),
                  SizedBox(height: height*0.01,),
                  Text(AppLocalizations.of(context)!.location,
                    style:Theme.of(context)!.textTheme.titleLarge ,),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: height*0.01),
                    padding: EdgeInsets.symmetric(horizontal: width*0.02,
                        vertical: height*0.01),
                    // height: height*0.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: AppColors.primaryLightColor,
                            width: 1
                        )
                    ),
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: width*0.03,
                                vertical: height*0.01),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.primaryLightColor
                            ),
                            child: Icon(Icons.location_searching_rounded ,
                                color: AppColors.lightBgColor)
                        ),
                        SizedBox(width: width*0.02,),
                        Text(AppLocalizations.of(context)!.choose_event_location ,
                          style: AppFonts.med16primary,),
                        Spacer(),
                        Icon(Icons.arrow_forward ,color: AppColors.primaryLightColor,)
                      ],
                    ) ,
                  ),
                  SizedBox(height: height*0.01,),
                  CustomElevatedButton(onPressed: (){
                    ShowMyDialog(context) ;
                    addEvent();
                  }, text: AppLocalizations.of(context)!.add_event,
                      backgroundColor: AppColors.primaryLightColor),
                  SizedBox(height: height*0.02,),

                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
  void chooseDate() async{
var chooseDate = await showDatePicker(context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(Duration(days: 365))
);
selectedDate = chooseDate;
if(selectedDate != null){
  formatedDate = DateFormat('dd/MM/yyyy').format(selectedDate!);
  setState(() {

  });
}
setState(() {

});
  }

   void chooseTime() async{
     var chooseTime = await showTimePicker(context: context,
     initialTime: TimeOfDay.now());
     selectedTime = chooseTime;

     if(selectedTime != null){
       formatedTime = selectedTime!.format(context);
       setState(() {

       });
     }
 }
  void addEvent(){
    if(formKey.currentState?.validate()==true){
      Event event= Event(
          title: titleController.text,
          description: descriptionController.text,
          eventName: selectedEventName,
          eventDate: selectedDate!,
          eventTime: formatedTime,
          eventImage: selectedEventImage);
      FirebaseUtils.addEventToFireStore(event).timeout(Duration(milliseconds: 500),
      onTimeout: () {
        print('event added');
      },);
      eventListProvider.getAllEvents();

    }

}
// Future<void> showMyDialog() async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title:  Text('AlertDialog Title'),
//         content:  SingleChildScrollView(
//           child: ListBody(
//             children: <Widget>[
//               Text('This is a demo alert dialog.'),
//               Text('Would you like to approve of this message?'),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child:  Text('Approve'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }


}
/*CustomElevatedButton(onPressed:(){
                chooseLocation();
              },
                hasIcon: true,
                iconName: Icon(Icons.location_searching_rounded),
                  text: AppLocalizations.of(context)!.choose_event_location ,
                textStyle: AppFonts.med16primary,
                  backgroundColor: AppColors.lightBgColor,),*/