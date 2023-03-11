import 'package:flutter/material.dart';
import 'package:notepad/models/task_notif_model.dart';
import 'package:notepad/widget/date_widget.dart';
import 'package:notepad/widget/text_widget.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final date = getDate();
  int isTrue = 0;

  @override
  Widget build(BuildContext context) {
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
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
              Expanded(
                child: Column(
                  children: [
                    AppText(
                      text: sWidth < 240 ? " " : 'Study',
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
              Padding(
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
                      Icons.calendar_month_sharp,
                      color: Color(0xffF1F5FD),
                      size: 20,
                      shadows: [
                        Shadow(
                          color: Color(0xffF1F5FD),
                          blurRadius: 5.0,
                          offset: Offset(
                            -1,
                            0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: sWidth > 239 ? 20 : 0,
          ),
          _MiddleAppBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: sWidth,
              height: 60,
              child: sWidth > 450
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _CreateList(),
                    )
                  : _CreateListView(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: sWidth * 0.9,
            height: 130,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _CreateNotifBox(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _CreateNotifBox() {
    var sWidth = MediaQuery.of(context).size.width;
    return List.generate(3, (index) {
      TaskNofifModel current = tasknotifModel[index];
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: sWidth * 0.25,
          height: 120,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff685492),
                Color(0xff2A135A),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff422D70).withOpacity(0.7),
                blurRadius: 6.0,
                offset: const Offset(
                  2,
                  3,
                ),
              ),
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: sWidth,
                height: 30,
                child: Icon(
                  current.logo,
                  size: 20,
                  color: const Color(0xffF1F5FD),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: AppText(
                      text: current.title,
                      size: 16,
                      color: const Color(0xffF1F5FD),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 2,
                child: AppText(
                    text: current.number,
                    size: 30,
                    color: const Color(0xffF1F5FD),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _MiddleAppBar() {
    var sWidth = MediaQuery.of(context).size.width;
    return sWidth < 239
        ? Column(
            children: [
              const AppText(
                text: 'Study',
                fontWeight: FontWeight.bold,
                color: Color(0xff2A135A),
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

  List<Widget> _CreateList() {
    return List.generate(
      7,
      (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0, bottom: 8),
          child: GestureDetector(
            onTap: () {
              print(index);
              setState(() {
                isTrue = index;
              });
            },
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: const Color(0xff2A135A).withOpacity(0.7), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff2A135A).withOpacity(0.3),
                    blurRadius: 3.0,
                    offset: const Offset(
                      2,
                      3,
                    ),
                  ),
                ],
                color: isTrue == index
                    ? const Color(0xff2A135A)
                    : const Color(0xffF1F5FD),
              ),
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Center(
                      child: AppText(
                          text: date.getDayShort(index),
                          size: 5,
                          color: isTrue == index
                              ? const Color(0xffF1F5FD)
                              : const Color(0xff2A135A),
                          fontWeight: FontWeight.bold)),
                  Center(
                    child: AppText(
                        text: date.getDayNumWeek(index),
                        size: 18,
                        color: isTrue == index
                            ? const Color(0xffF1F5FD)
                            : const Color(0xff2A135A),
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _CreateListView() {
    return ListView.builder(
      itemCount: 7,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0, bottom: 8),
          child: GestureDetector(
            onTap: () {
              print(index);
              setState(() {
                isTrue = index;
              });
            },
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: const Color(0xff2A135A).withOpacity(0.7), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff2A135A).withOpacity(0.3),
                    blurRadius: 3.0,
                    offset: const Offset(
                      2,
                      3,
                    ),
                  ),
                ],
                color: isTrue == index
                    ? const Color(0xff2A135A)
                    : const Color(0xffF1F5FD),
              ),
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Center(
                      child: AppText(
                          text: date.getDayShort(index),
                          size: 5,
                          color: isTrue == index
                              ? const Color(0xffF1F5FD)
                              : const Color(0xff2A135A),
                          fontWeight: FontWeight.bold)),
                  Center(
                    child: AppText(
                        text: date.getDayNumWeek(index),
                        size: 18,
                        color: isTrue == index
                            ? const Color(0xffF1F5FD)
                            : const Color(0xff2A135A),
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
