import 'package:app/services/notification_service.dart';
import 'package:app/services/theme_services.dart';
import 'package:app/ui/add_task_bar.dart';
import 'package:app/ui/widgets/button.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:app/ui/theme.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;
  DateTime _selectedDate=DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.requestIOSPermissions();
    notifyHelper.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      body: Column(
        children: [
          // function for add task bar
          _addTaskBar(),
          //function to add date and month bar
          _addDateBar()
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
            title: "Theme Changed",
            body: Get.isDarkMode
                ? "Activated Light Theme"
                : "Activated Dark Theme",
          );
          notifyHelper.scheduledNotification();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 25,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage("images/profile.png",),
          backgroundColor:Get.isDarkMode ? Colors.white : Colors.white ,
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subHeadtingStyle,
              ),
              Text(
                "Today",
                style: headingStyle,
              )
            ],
          ),
          Mybutton(
            label: '+ Add Task',
            onTap: ()=>Get.to(AddTaskPage()),
          )
        ],
      ),
    );
  }
  _addDateBar()
  {
    return Container(
      margin: EdgeInsets.only(top: 20,left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle:
        TextStyle(fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.lato().fontFamily),
        dayTextStyle:
        TextStyle(fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.lato().fontFamily),
        monthTextStyle:
        TextStyle(fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.lato().fontFamily),
        onDateChange: (date)
        {
          _selectedDate=date;
        },
      ),
    );
  }
}
