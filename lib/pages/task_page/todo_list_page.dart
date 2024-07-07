import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:notepad/widget/taskpage_appbar_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../models/todo_list_mdoel.dart';
import '../../widget/date_widget.dart';
import '../../widget/text_widget.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key, required this.name}) : super(key: key);
  final name;

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final date = getDate();
  int isTrue = 0;

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String _showselectedDay = getDate().createDate(getDate().now);
  bool checkbox = true;
  List<ToDoListModel> ModelList = [];
  List<ToDoListModel> TempModelList = [];

  bool _expanded = false;
  late FocusNode addTaskNode;
  TextEditingController addTaskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    addTaskNode = FocusNode();

    ModelList = [
      /// ToDoListModel Sample

      // ToDoListModel(
      //   title: "NotePad Project",
      //   isChecked: true,
      //   date: getDate().createDate(DateTime.now()),
      // ),
      // ToDoListModel(
      //   title: "Flutter",
      //   isChecked: false,
      //   date: getDate().createDate(DateTime.now()),
      // ),
      // ToDoListModel(
      //   title: "Dart",
      //   isChecked: true,
      //   date: getDate().createDate(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 2)),
      // ),
    ];

    ChangeModelList(false);
  }

  @override
  Widget build(BuildContext context) {
    var sWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          if (_expanded) {
            FocusScope.of(context).unfocus();
            setState(() {
              _expanded = false;
              addTaskController.clear();
            });
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TaskPageAppbar(sWidth, widget.name, context),
                  TableCalendarWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: AppText(
                      text: _showselectedDay,
                      size: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: TempModelList.length,
                      itemBuilder: (BuildContext context, int index) {
                        ToDoListModel item = TempModelList[index];
                        return FadeInDown(
                          from: 20,
                          duration: const Duration(milliseconds: 300),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 2),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  item.isChecked = !item.isChecked;
                                });
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xff685492),
                                      Color(0xff2A135A),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 40,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Checkbox(
                                          value: item.isChecked,
                                          checkColor: Colors.greenAccent,
                                          fillColor: MaterialStatePropertyAll<Color?>(
                                            const Color(0xff2A135A).withOpacity(.5),
                                          ),
                                          side: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 2,
                                            color: const Color(0xff2A135A).withOpacity(.5),
                                          ),
                                          onChanged: (bool? value) {
                                            setState(
                                              () {
                                                item.isChecked = value!;
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: AppText(
                                        text: item.title,
                                        color: const Color(0xffF1F5FD),
                                        fontWeight: FontWeight.bold,
                                        size: 16,
                                        isChecked: item.isChecked,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        ModelList.remove(item);
                                        TempModelList.remove(item);
                                        setState(() {});
                                      },
                                      child: SizedBox(
                                        width: 50,
                                        height: 30,
                                        child: Icon(
                                          Icons.close,
                                          size: 24,
                                          color: const Color(0xffF1F5FD).withOpacity(.9),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 12,
                right: 12,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: AnimatedContainer(
                    width: _expanded ? (sWidth - 40) : 20,
                    height: 55,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xff2A135A),
                    ),
                    child: _expanded
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14.0),
                            child: TextField(
                              onSubmitted: (textValue) {
                                if (textValue.isNotEmpty) {
                                  ModelList.add(
                                    ToDoListModel(
                                      title: addTaskController.text,
                                      isChecked: false,
                                      date: _showselectedDay,
                                    ),
                                  );
                                  addTaskController.clear();
                                  _expanded = !_expanded;
                                  ChangeModelList(false);
                                }
                              },
                              focusNode: addTaskNode,
                              controller: addTaskController,
                              style: const TextStyle(
                                color: Color(0xffF1F5FD),
                                fontWeight: FontWeight.bold,
                              ),
                              cursorColor: const Color(0xffF1F5FD),
                              cursorWidth: .5,
                              maxLength: 30,
                              decoration: const InputDecoration(
                                counterText: "",
                                border: InputBorder.none,
                                labelText: 'Add Task',
                                labelStyle: TextStyle(
                                  color: Color(0xffF1F5FD),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    if (!_expanded) {
                      setState(() {
                        _expanded = !_expanded;
                      });
                    }
                    if (_expanded) {
                      addTaskNode.requestFocus();
                    }
                    if (addTaskController.text.isNotEmpty) {
                      ModelList.add(
                        ToDoListModel(
                          title: addTaskController.text,
                          isChecked: false,
                          date: _showselectedDay,
                        ),
                      );
                      addTaskController.clear();
                      // setState(() {
                      _expanded = !_expanded;
                      // });
                      ChangeModelList(false);
                    } else {
                      FocusScope.of(context).unfocus();
                    }
                  },
                  child: Container(
                    width: 80,
                    height: 60,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff2A135A),
                        ),
                        child: Center(
                          child: AnimatedCrossFade(
                            firstChild: const Icon(
                              Icons.add,
                              color: Color(0xffF1F5FD),
                              size: 32,
                            ),
                            secondChild: const Icon(
                              Icons.check,
                              color: Color(0xffF1F5FD),
                              size: 32,
                            ),
                            crossFadeState: _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 300),
                            firstCurve: Curves.ease,
                            secondCurve: Curves.ease,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void ChangeModelList(bool isCleared) {
    if (isCleared) {
      TempModelList.clear();
    }
    Future.delayed(const Duration(milliseconds: 15), () {
      for (var element in ModelList) {
        if (element.date == _showselectedDay && !TempModelList.contains(element)) {
          setState(() {
            TempModelList.add(element);
          });
        }
      }
    });
  }

  Widget TableCalendarWidget() {
    return TableCalendar(
      firstDay: DateTime(2023),
      lastDay: DateTime(2025),
      focusedDay: _focusedDay,
      rowHeight: 40,
      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
      ),
      calendarStyle: const CalendarStyle(
        weekendTextStyle: TextStyle(color: Colors.red),
        defaultTextStyle: TextStyle(fontWeight: FontWeight.w500),
      ),
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarFormat: CalendarFormat.week,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _showselectedDay = date.createDate(selectedDay);
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
          ChangeModelList(true);
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
