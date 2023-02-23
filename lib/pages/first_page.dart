import 'package:flutter/material.dart';
import 'package:notepad/models/category_model.dart';
import 'package:notepad/widget/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math; // import this

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sWidth = size.width;
    var sHeight = size.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF1F5FD),
      body: SizedBox(
        width: sWidth,
        height: sHeight,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppText(
                      text: '21',
                      size: 36,
                      color: Color(0xff2A135A),
                      fontWeight: FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        AppText(
                            text: 'February',
                            size: 16,
                            color: Color(0xff2A135A),
                            fontWeight: FontWeight.bold),
                        AppText(
                          text: 'Saturday',
                          size: 12,
                          color: Color(0xff2A135A),
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  SizedBox(
                      width: sWidth * 0.1,
                      height: 30,
                      child: SvgPicture.asset(
                        "assets/images/settings.svg",
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Container(
                  height: 9,
                  width: 25,
                  decoration: const BoxDecoration(
                    color: Color(0xff2A135A),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff2A135A),
                        blurRadius: 6.0,
                        offset: Offset(
                          0,
                          3,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const AppText(
                    text: "Categories",
                    size: 20,
                    color: Color(0xff2A135A),
                    fontWeight: FontWeight.bold),
                Expanded(child: Container()),
                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: AppText(
                      text: "view more",
                      size: 12,
                      color: Color(0xff2A135A),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: categoryComponents.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: sHeight * 0.18,
                ),
                itemBuilder: (_, int index) {
                  CategoryModel categoryModel = categoryComponents[index];
                  return Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(categoryModel.darkcolor),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(categoryModel.darkcolor),
                                          blurRadius: 4.0,
                                          offset: const Offset(
                                            1,
                                            2,
                                          ),
                                        )
                                      ],
                                    ),
                                    width: sWidth * 0.18,
                                    height: sHeight * 0.08,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 12),
                                      child: SvgPicture.asset(
                                        categoryModel.imageUrl,
                                        color: Color(categoryModel.logocolor),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color:
                                                Color(categoryModel.darkcolor),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(
                                                    categoryModel.darkcolor),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  width: 4,
                                                  height: 4,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(15),
                                                    color: Color(
                                                        categoryModel.logocolor),
                                                  ),
                                                ),
                                                Container(
                                                  width: 4,
                                                  height: 4,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(15),
                                                    color: Color(
                                                        categoryModel.logocolor),
                                                  ),
                                                ),
                                                Container(
                                                  width: 4,
                                                  height: 4,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(15),
                                                    color: Color(
                                                        categoryModel.logocolor),
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
                              padding: const EdgeInsets.only(
                                left: 17,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: sWidth * 0.18,
                                        height: sHeight * 0.03,
                                        child: AppText(
                                            text: categoryModel.title,
                                            size: 22,
                                            color:
                                                Color(categoryModel.logocolor),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      if (sHeight > 590)
                                      SizedBox(
                                        width: sWidth * 0.16,
                                        height: sHeight * 0.02,
                                        child:  AppText(
                                            text: categoryModel.description,
                                            size: 4,
                                            color:
                                                Color(categoryModel.logocolor),
                                            fontWeight: FontWeight.bold),
                                      )

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          // right: 30,
                          left: sWidth * 0.22,
                          top: sHeight * 0.09,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(categoryModel.darkcolor),
                                    blurRadius: 40.0,
                                    offset: const Offset(
                                      0,
                                      0,
                                    ),
                                  )
                                ],
                              ),
                              width: sWidth * 0.18,
                              height: sHeight * 0.08,
                              child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(math.pi),
                                child: Transform(
                                  transform: Matrix4.rotationZ(-0.29),
                                  child: SvgPicture.asset(
                                    categoryModel.imageUrl,
                                    color: Color(categoryModel.lightcolor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
