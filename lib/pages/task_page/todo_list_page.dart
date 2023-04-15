import 'package:flutter/material.dart';
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


  @override
  Widget build(BuildContext context) {
    var sWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TypesAppBar(sWidth, widget.name),
              TableCalendar(
                firstDay: DateTime(2023),
                lastDay: DateTime(2025),
                focusedDay: _focusedDay,
                rowHeight: 40,
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                ),
                calendarStyle: const CalendarStyle(
                    weekendTextStyle: TextStyle(color: Colors.red)),
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarFormat: CalendarFormat.week,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(
                      () {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                        print(selectedDay);
                      },
                    );
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget TypesAppBar(double sWidth, String name) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xff2A135A),
                        blurRadius: 16.0,
                        offset: Offset(
                          0,
                          0,
                        ),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xff2A135A),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Color(0xffF1F5FD),
                      size: 20,
                      shadows: [
                        Shadow(
                          color: Color(0xffF1F5FD),
                          blurRadius: 6.0,
                          offset: Offset(
                            -1,
                            0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  AppText(
                    text: sWidth < 240 ? " " : widget.name,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff2A135A),
                    size: 20,
                  ),
                  AppText(
                      text: sWidth < 240
                          ? " "
                          : "${date.getDayNum()} ${date.getMonth()} ${date.getYear()}",
                      size: 12,
                      color: const Color(0xff2A135A).withOpacity(0.7),
                      fontWeight: FontWeight.bold),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                  ),
                ),
              ),
            ),
          ],
        ),

        _MiddleAppBar(widget.name),
      ],
    );
  }

  Widget _MiddleAppBar(String name) {
    var sWidth = MediaQuery.of(context).size.width;
    return sWidth < 239
        ? Column(
            children: [
              AppText(
                text: name,
                fontWeight: FontWeight.bold,
                color: const Color(0xff2A135A),
                size: 20,
              ),
              AppText(
                  text:
                      "${date.getDayNum()} ${date.getMonth()} ${date.getYear()}",
                  size: 12,
                  color: const Color(0xff2A135A).withOpacity(0.7),
                  fontWeight: FontWeight.bold),
              const SizedBox(
                height: 20,
              )
            ],
          )
        : Container();
  }
}
