import 'package:flutter/material.dart';
import 'package:notepad/widget/taskpage_appbar_widget.dart';
import 'package:table_calendar/table_calendar.dart';

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
  bool checkbox = false;

  @override
  Widget build(BuildContext context) {
    var sWidth = MediaQuery.of(context).size.width;
    var sHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TaskPageAppbar(sWidth, widget.name, context),
            TableCalendarWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: AppText(
                text: _showselectedDay,
                size: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 50,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 2),
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
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Checkbox(
                                  value: checkbox,
                                  checkColor: Colors.greenAccent,
                                  activeColor: Colors.red,
                                  onChanged: (bool? value) {
                                    checkbox == value;
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.blue,
                              ),
                            ),
                            Container(
                              width: 30,
                              color: Colors.pink,
                            ),
                            Container(
                              width: 30,
                              color: Colors.brown,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              height: 60,
              width: sWidth,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
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
      calendarStyle:
          const CalendarStyle(weekendTextStyle: TextStyle(color: Colors.red)),
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarFormat: CalendarFormat.week,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(
            () {
              _showselectedDay = date.createDate(selectedDay);
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            },
          );
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
