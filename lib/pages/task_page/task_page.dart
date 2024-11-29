import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

import 'package:notepad/database/category_db/categoriesDB.dart';
import 'package:notepad/models/task_notif_model.dart';
import 'package:notepad/widget/date_widget.dart';
import 'package:notepad/widget/text_widget.dart';

import '../../models/task_type_model.dart';
import '../../widget/appBar_widget.dart';
import '../../widget/color_widget.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key, required this.name});

  final String name;

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final date = GetDate();

  late Box<CategoryDB> categoryDB;
  bool createdDB = false;
  int dbIndex = 2;

  @override
  void initState() {
    super.initState();

    categoryDB = Hive.box<CategoryDB>("categoryDB");
    if (categoryDB.length == 0) {
      categoryDB.add(
        CategoryDB(categoryTitle: {widget.name: {}}),
      );
      dbIndex = 0;

    }
    for (var e in categoryDB.keys) {
      if (categoryDB.getAt(e)!.categoryTitle.keys.contains(widget.name)) {
        createdDB = true;
        dbIndex = e;
        break;
      }
    }
    if (createdDB == false) {
      categoryDB.add(
        CategoryDB(categoryTitle: {widget.name: {}}),
      );
      // print("DB INDEX ${categoryDB.length - 1} Added");

      dbIndex = categoryDB.length - 1;
    }
  }

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
              appBar(widget.name, context),
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
                    color: purpleTheme,
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

  List<Widget> _tasksType() {
    return List.generate(
      4,
      (index) {
        TaskTypeModel current = taskTypeModel[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => current.className,
                settings: RouteSettings(arguments: categoryDB.getAt(dbIndex)!.categoryTitle[widget.name][current.title] ?? []),
              ),
            ).then((value) {
              categoryDB.putAt(
                dbIndex,
                CategoryDB(categoryTitle: {
                  widget.name: {value[0]: value[1]}
                }),
              );
            });
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
                    purpleTheme,
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
                purpleTheme,
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
}
