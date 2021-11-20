import 'package:app/controllers/task_controller.dart';
import 'package:app/models/task.dart';
import 'package:app/ui/theme.dart';
import 'package:app/ui/widgets/button.dart';
import 'package:app/ui/widgets/input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String _selectedRepeat = "None";
  List<String> repeatList = ["None", "Daily", "Weekly", "Month"];
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: _appBar(),
        body: Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Task",
                      style: headingStyle,
                    ),
                    MyInputField(
                      title: "Title",
                      hint: "Enter your title",
                      controller: _titleController,
                    ),
                    MyInputField(
                      title: "Note",
                      hint: "Enter your note",
                      controller: _noteController,
                    ),
                    MyInputField(
                      title: "Date",
                      hint: DateFormat.yMd().format(_selectedDate),
                      widget: IconButton(
                        onPressed: () {
                          _getDateFromUser();
                        },
                        icon: const Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: MyInputField(
                              title: 'Start Date',
                              hint: _startTime,
                              widget: IconButton(
                                onPressed: () {
                                  _getTimeFromUser(isStartTime: true);
                                },
                                icon: const Icon(
                                  Icons.access_time_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: MyInputField(
                              title: 'End Date',
                              hint: _endTime,
                              widget: IconButton(
                                onPressed: () {
                                  _getTimeFromUser(isStartTime: false);
                                },
                                icon: const Icon(
                                  Icons.access_time_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            ))
                      ],
                    ),
                    //Remind field
                    MyInputField(
                      title: "Remind",
                      hint: "$_selectedRemind minutes early",
                      widget: DropdownButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedRemind = int.parse(newValue!);
                          });
                        },
                        underline: Container(
                          height: 0,
                        ),
                        elevation: 4,
                        iconSize: 32,
                        style: subTitleStyle,
                        items: remindList
                            .map<DropdownMenuItem<String>>((int value) {
                          return DropdownMenuItem<String>(
                            child: Text(value.toString()),
                            value: value.toString(),
                          );
                        }).toList(),
                      ),
                    ),
                    //Repeat field
                    MyInputField(
                      title: "Repeat",
                      hint: _selectedRepeat,
                      widget: DropdownButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedRepeat = newValue!;
                          });
                        },
                        underline: Container(
                          height: 0,
                        ),
                        elevation: 4,
                        iconSize: 32,
                        style: subTitleStyle,
                        items: repeatList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            child: Text(value.toString()),
                            value: value,
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _colorPallet(),
                          Mybutton(
                              label: "Create Task",
                              onTap: () => _validateData())
                        ],
                      ),
                    )
                  ]),
            )));
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.arrow_back_ios,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage("images/profile.png"),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2023));
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var _pickedTime = await _showTimePicker();
    String _formattedTime = _pickedTime.formate(context);
    if (_pickedTime == null) {
      print("Time cancelled");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formattedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formattedTime;
      });
    }
  }

  _showTimePicker() async {
    return await showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0])));
  }

  _colorPallet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: titleStyle,
        ),
        Wrap(
            children: List<Widget>.generate(3, (int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedColor = index;
                  });
                },
                child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                    child: CircleAvatar(
                      child: _selectedColor == index
                          ? const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 18,
                      )
                          : Container(),
                      radius: 14,
                      backgroundColor: index == 0
                          ? primaryClr
                          : index == 1
                          ? pinkColor
                          : Colors.green,
                    )),
              );
            }))
      ],
    );
  }

  _validateData() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      _addTaskToDatabase();
      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar("Required", "All fields are required !",
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
          icon: const Icon(
            Icons.warning_amber_outlined,
            color: Colors.red,
          ),
          colorText: Colors.red);
    }
  }

  //adding data to controller and then to database
  _addTaskToDatabase() async {
    int value = await _taskController.addTask(
        task: Task(
            note: _noteController.text,
            title: _titleController.text,
            date: DateFormat.yMd().format(_selectedDate),
            startDate: _startTime,
            endDate: _endTime,
            remind: _selectedRemind,
            repeat: _selectedRepeat,
            color: _selectedColor,
            isCompleted: 0
        )
    );
    print("My id is $value");
  }
}
