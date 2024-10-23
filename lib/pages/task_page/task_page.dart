import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notepad/models/task_notif_model.dart';
import 'package:notepad/widget/date_widget.dart';
import 'package:notepad/widget/text_widget.dart';

import '../../models/task_type_model.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key, required this.name});

  final String name;

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final date = GetDate();

  @override
  Widget build(BuildContext context) {
    var sWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F5FD),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              appBar(sWidth, widget.name),
              Container(
                width: sWidth * 0.9,
                height: 130,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _createNotificationBox(),
                ),
              ),
              Container(
                width: sWidth * 0.9,
                height: 250,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _tasksType(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  width: sWidth,
                  height: 2,
                  decoration: BoxDecoration(
                    color: const Color(0xff2A135A),
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
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar(double sWidth, String name) {
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
                    text: sWidth < 240 ? " " : "${date.getDayNum()} ${date.getMonth()} ${date.getYear()}",
                    size: 12,
                    color: const Color(0xff2A135A).withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
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
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      "assets/images/chart.svg",
                      colorFilter: ColorFilter.mode(Color(0xffF1F5FD), BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: sWidth > 239 ? 20 : 0,
        ),
        _middleAppBar(widget.name),
      ],
    );
  }

  List<Widget> _tasksType() {
    return List.generate(
      4,
      (index) {
        TaskTypeModel current = taskTypeModel[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => current.className),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: SizedBox(
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Icon(
                          current.logo,
                          color: const Color(0xffF1F5FD),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: SizedBox(
                        width: 50,
                        child: AppText(text: current.title, size: 16, color: const Color(0xffF1F5FD), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: SizedBox(
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset(
                          "assets/images/arrow-right.svg",
                          colorFilter: ColorFilter.mode(
                            Color(0xffF1F5FD),
                            BlendMode.srcIn,
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
      },
    );
  }

  List<Widget> _createNotificationBox() {
    var sWidth = MediaQuery.of(context).size.width;
    return List.generate(3, (index) {
      TaskNotificationModel current = taskNotificationModel[index];
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
                  child: AppText(text: current.title, size: 16, color: const Color(0xffF1F5FD), fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 2,
                child: AppText(text: current.number, size: 30, color: const Color(0xffF1F5FD), fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _middleAppBar(String name) {
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
              AppText(text: "${date.getDayNum()} ${date.getMonth()} ${date.getYear()}", size: 12, color: const Color(0xff2A135A).withOpacity(0.7), fontWeight: FontWeight.bold),
              const SizedBox(
                height: 20,
              )
            ],
          )
        : Container();
  }
}
