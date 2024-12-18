import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notepad/models/category_model.dart';
import 'package:notepad/models/recent_model.dart';
import 'package:notepad/pages/task_page/task_page.dart';
import 'package:notepad/widget/text_widget.dart';

import '../widget/color_widget.dart';
import '../widget/date_widget.dart';
import 'drawer_page.dart';

class FirstPageRoute extends CupertinoPageRoute {
  FirstPageRoute() : super(builder: (BuildContext context) => const FirstPage());

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return FadeTransition(opacity: animation, child: const FirstPage());
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isDrawerOpen = false;
  final date = GetDate();

  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sWidth = size.width;
    var sHeight = size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F5FD),
        body: Stack(
          children: [
            const DrawerScreen(),
            SizedBox(
              width: sWidth,
              height: sHeight,
              child: AnimatedContainer(
                alignment: Alignment.center,
                transform: Matrix4.translationValues(isDrawerOpen ? sWidth / -1.2 : 0, 0, 0)..scale(1.00),
                duration: const Duration(milliseconds: 200),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  physics: isDrawerOpen ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // App Bar ----
                      FadeInUp(
                        delay: const Duration(milliseconds: 100),
                        child: Padding(
                          key: _key,
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppText(text: date.getDayNum(), size: 36, color: purpleTheme, fontWeight: FontWeight.bold),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(text: date.getMonth(), size: 16, color: purpleTheme, fontWeight: FontWeight.bold),
                                    AppText(
                                      text: date.getDay(),
                                      size: 12,
                                      color: purpleTheme,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(child: Container()),
                              GestureDetector(
                                onTap: () {
                                  isDrawerOpen
                                      ? setState(() {
                                          isDrawerOpen = false;
                                        })
                                      : setState(() {
                                          isDrawerOpen = true;
                                          Scrollable.ensureVisible(_key.currentContext!);
                                        });
                                },
                                child: SizedBox(
                                    width: sWidth * 0.1,
                                    height: 30,
                                    child: SvgPicture.asset(
                                      "assets/images/settings.svg",
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      // Title of Category
                      Row(
                        children: [
                          FadeInLeft(
                            delay: const Duration(milliseconds: 600),
                            child: Container(
                              height: 9,
                              width: 25,
                              decoration: const BoxDecoration(
                                color: purpleTheme,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
                                boxShadow: [
                                  BoxShadow(
                                    color: purpleTheme,
                                    blurRadius: 6.0,
                                    offset: Offset(
                                      0,
                                      3,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FadeInLeft(
                            delay: const Duration(milliseconds: 600),
                            child: const AppText(text: "Categories", size: 20, color: purpleTheme, fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: Container()),
                          FadeInRight(
                            delay: const Duration(milliseconds: 600),
                            child: const Padding(
                              padding: EdgeInsets.only(right: 15.0),
                              child: Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: purpleTheme,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Category Boxes
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                        child: AnimationLimiter(
                          child: GridView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: categoryComponents.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: sWidth > 270 ? 2 : 1,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              mainAxisExtent: 135,
                            ),
                            itemBuilder: (_, int index) {
                              CategoryModel categoryModel = categoryComponents[index];
                              return AnimationConfiguration.staggeredGrid(
                                columnCount: 4,
                                position: index,
                                duration: const Duration(milliseconds: 1000),
                                child: SlideAnimation(
                                  verticalOffset: 200.0,
                                  child: FadeInAnimation(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => TaskPage(name: categoryModel.title.toString()),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Color(categoryModel.color),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(categoryModel.color),
                                              blurRadius: 4.0,
                                              offset: const Offset(
                                                1,
                                                2,
                                              ),
                                            )
                                          ],
                                        ),
                                        child: Stack(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5),
                                                          color: Color(categoryModel.darkColor),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Color(categoryModel.darkColor),
                                                              blurRadius: 4.0,
                                                              offset: const Offset(
                                                                1,
                                                                2,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        width: sWidth > 270 ? sWidth * 0.18 : 60,
                                                        height: 60,
                                                        child: Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: sWidth * 0.02, vertical: 8),
                                                          child: SvgPicture.asset(categoryModel.imageUrl, colorFilter: ColorFilter.mode(Color(categoryModel.logoColor), BlendMode.srcIn)),
                                                        ),
                                                      ),
                                                      Column(
                                                        children: [
                                                          Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(16),
                                                                color: Color(categoryModel.darkColor),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Color(categoryModel.darkColor),
                                                                    blurRadius: 6.0,
                                                                    offset: const Offset(
                                                                      0,
                                                                      3,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              width: 30,
                                                              height: 30,
                                                              child: Padding(
                                                                padding: const EdgeInsets.symmetric(vertical: 7.0),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      width: 4,
                                                                      height: 4,
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        color: Color(categoryModel.logoColor),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 4,
                                                                      height: 4,
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        color: Color(categoryModel.logoColor),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 4,
                                                                      height: 4,
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        color: Color(categoryModel.logoColor),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: sWidth > 270 ? sWidth * 0.03 : sWidth * 0.05,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                            width: 80,
                                                            height: 25,
                                                            child: AppText(text: categoryModel.title, size: 22, color: Color(categoryModel.logoColor), fontWeight: FontWeight.bold),
                                                          ),
                                                          SizedBox(
                                                            width: 80,
                                                            height: 25,
                                                            child: AppText(text: categoryModel.description, size: 4, color: Color(categoryModel.logoColor), fontWeight: FontWeight.bold),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Positioned(
                                              right: sWidth > 270 ? sWidth * -0.05 : sWidth * -0.02,
                                              top: 70,
                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(15, 0, 15.0, 15),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color(categoryModel.darkColor),
                                                        blurRadius: 40.0,
                                                        offset: const Offset(
                                                          0,
                                                          0,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  width: 55,
                                                  height: 55,
                                                  child: Transform(
                                                    alignment: Alignment.center,
                                                    transform: Matrix4.rotationY(categoryModel.rotate),
                                                    child: Transform(
                                                      transform: Matrix4.rotationZ(-0.29),
                                                      child: SvgPicture.asset(categoryModel.imageUrl, colorFilter: ColorFilter.mode(Color(categoryModel.lightColor), BlendMode.srcIn)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Title of Recent
                      Row(
                        children: [
                          FadeInLeft(
                            delay: const Duration(milliseconds: 1100),
                            child: Container(
                              height: 9,
                              width: 25,
                              decoration: const BoxDecoration(
                                color: purpleTheme,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
                                boxShadow: [
                                  BoxShadow(
                                    color: purpleTheme,
                                    blurRadius: 6.0,
                                    offset: Offset(
                                      0,
                                      3,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FadeInLeft(
                            delay: const Duration(milliseconds: 1100),
                            child: const AppText(text: "Recent", size: 20, color: purpleTheme, fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: Container()),
                          FadeInRight(
                            delay: const Duration(milliseconds: 1100),
                            child: const Padding(
                                padding: EdgeInsets.only(right: 15.0),
                                child: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: purpleTheme,
                                )),
                          ),
                        ],
                      ),
                      // Recent Box
                      FadeInUp(
                        delay: const Duration(milliseconds: 1300),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            width: sWidth,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xffE0E8F9),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xff000000).withOpacity(0.27),
                                  blurRadius: 17.0,
                                  offset: const Offset(
                                    0,
                                    3,
                                  ),
                                )
                              ],
                            ),
                            child: AnimationLimiter(
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: recentcomponent.length,
                                itemBuilder: (BuildContext context, int index) {
                                  recentcomponent.sort((a, b) => a.time.compareTo(b.time));
                                  RecentModel current = recentcomponent[index];
                                  CategoryModel catcurrent = categoryComponents[current.groupid];

                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 2000),
                                    child: SlideAnimation(
                                      verticalOffset: 200.0,
                                      child: FadeInAnimation(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                          child: Container(
                                            width: sWidth,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: Color(catcurrent.color),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(catcurrent.lightColor).withOpacity(0.27),
                                                  blurRadius: 17.0,
                                                  offset: const Offset(
                                                    0,
                                                    3,
                                                  ),
                                                )
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                    child: Container(
                                                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const SizedBox(
                                                            height: 4,
                                                          ),
                                                          AppText(
                                                            text: current.title,
                                                            size: 6,
                                                            color: Color(
                                                              catcurrent.logoColor,
                                                            ),
                                                            fontWeight: FontWeight.bold,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                          const SizedBox(
                                                            height: 2,
                                                          ),
                                                          AppText(text: "${current.time} min ago", size: 6, color: Color(catcurrent.logoColor), fontWeight: FontWeight.bold)
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 14.0),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    padding: const EdgeInsets.all(1.5),
                                                    width: sWidth * 0.15,
                                                    child: Transform(
                                                      alignment: Alignment.center,
                                                      transform: Matrix4.rotationY(catcurrent.rotate),
                                                      child: Transform(
                                                        transform: Matrix4.rotationZ(-0.29),
                                                        child: SvgPicture.asset(
                                                          catcurrent.imageUrl,
                                                          colorFilter: ColorFilter.mode(Color(catcurrent.lightColor), BlendMode.srcIn),
                                                          height: 50,
                                                          width: 50,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 4.0),
                                                  child: SizedBox(
                                                    width: sWidth * 0.07,
                                                    child: Icon(
                                                      Icons.arrow_forward_ios_sharp,
                                                      color: Color(catcurrent.logoColor),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
