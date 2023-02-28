import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notepad/widget/text_widget.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sWidth = size.width;
    var sHeight = size.height;
    return Container(
      width: sWidth * 1.2,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(child: Container()),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50)),
              color: Color(0xffF1F5FD),
            ),
            width: sWidth / 1.2,
            height: sHeight,
            child: Column(
              children: [
                SizedBox(
                  height: sHeight * 0.1,
                ),
                Row(
                  children: [
                    FadeInLeft(
                      delay: const Duration(milliseconds: 600),
                      child: Container(
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
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FadeInLeft(
                      delay: const Duration(milliseconds: 600),
                      child: const AppText(
                          text: "Settings",
                          size: 20,
                          color: Color(0xff2A135A),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: sHeight * 0.1,
                ),
                SettingMenu(sWidth: sWidth),
                Expanded(child: Container()),

                const FooterPage(),
              ],
            ),
          )
        ],
      ),
    );
  }


}

class SettingMenu extends StatefulWidget {
  SettingMenu({Key? key,required this.sWidth}) : super(key: key);

  final sWidth;
  @override
  State<SettingMenu> createState() => _SettingMenuState();
}

class _SettingMenuState extends State<SettingMenu> {

  bool CategoryisActive = false;
  bool SoundisActive = false;
  bool VibrateisActive = false;
  bool ThemeisActive = false;
  bool ContactUsisActive = false;

  @override
  Widget build(BuildContext context) {
    final sWidth = widget.sWidth;
    return Column(
      children: [
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: GestureDetector(
            onTap: () {
              if (CategoryisActive == false) {
                setState(() {});
                CategoryisActive = true;
                VibrateisActive = false;
                ContactUsisActive = false;
                ThemeisActive = false;
                SoundisActive = false;
              } else {
                setState(() {});
                CategoryisActive = false;
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              width: sWidth,
              height: CategoryisActive ? 150 : 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff2A135A),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff2A135A).withOpacity(.6),
                      blurRadius: 6.0,
                      offset: const Offset(
                        0,
                        3,
                      ),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: AppText(
                            text: "Manage Category",
                            size: 16,
                            color: Color(0xffF1F5FD),
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: const Color(0xffF1F5FD)
                                    .withOpacity(.1),
                                blurRadius: 6.0,
                                offset: const Offset(
                                  0,
                                  3,
                                ),
                              )
                            ]),
                            child: SvgPicture.asset(
                              "assets/images/arrow-down.svg",
                              color: const Color(0xffF1F5FD),
                            ),
                          ))
                    ],
                  ),
                  Expanded(child: Container())
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: GestureDetector(
            onTap: () {
              if (SoundisActive == false) {
                setState(() {});
                SoundisActive = true;
                VibrateisActive = false;
                ContactUsisActive = false;
                ThemeisActive = false;
                CategoryisActive = false;
              } else {
                setState(() {});
                SoundisActive = false;
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              width: sWidth,
              height: SoundisActive ? 150 : 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff2A135A),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff2A135A).withOpacity(.6),
                      blurRadius: 6.0,
                      offset: const Offset(
                        0,
                        3,
                      ),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: AppText(
                            text: "Sounds",
                            size: 16,
                            color: Color(0xffF1F5FD),
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: const Color(0xffF1F5FD)
                                    .withOpacity(.1),
                                blurRadius: 6.0,
                                offset: const Offset(
                                  0,
                                  3,
                                ),
                              )
                            ]),
                            child: SvgPicture.asset(
                              "assets/images/arrow-down.svg",
                              color: const Color(0xffF1F5FD),
                            ),
                          ))
                    ],
                  ),
                  Expanded(child: Container())
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: GestureDetector(
            onTap: () {
              if (VibrateisActive == false) {
                setState(() {});
                VibrateisActive = true;
                ContactUsisActive = false;
                ThemeisActive = false;
                SoundisActive = false;
                CategoryisActive = false;
              } else {
                setState(() {});
                VibrateisActive = false;
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              width: sWidth,
              height: VibrateisActive ? 150 : 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff2A135A),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff2A135A).withOpacity(.6),
                      blurRadius: 6.0,
                      offset: const Offset(
                        0,
                        3,
                      ),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: AppText(
                            text: "Vibration",
                            size: 16,
                            color: Color(0xffF1F5FD),
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: const Color(0xffF1F5FD)
                                    .withOpacity(.1),
                                blurRadius: 6.0,
                                offset: const Offset(
                                  0,
                                  3,
                                ),
                              )
                            ]),
                            child: SvgPicture.asset(
                              "assets/images/arrow-down.svg",
                              color: const Color(0xffF1F5FD),
                            ),
                          ))
                    ],
                  ),
                  Expanded(child: Container())
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: GestureDetector(
            onTap: () {
              if (ThemeisActive == false) {
                setState(() {});
                ThemeisActive = true;
                VibrateisActive = false;
                ContactUsisActive = false;
                SoundisActive = false;
                CategoryisActive = false;
              } else {
                setState(() {});
                ThemeisActive = false;
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              width: sWidth,
              height: ThemeisActive ? 150 : 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff2A135A),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff2A135A).withOpacity(.6),
                      blurRadius: 6.0,
                      offset: const Offset(
                        0,
                        3,
                      ),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: AppText(
                            text: "Theme",
                            size: 16,
                            color: Color(0xffF1F5FD),
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: const Color(0xffF1F5FD)
                                    .withOpacity(.1),
                                blurRadius: 6.0,
                                offset: const Offset(
                                  0,
                                  3,
                                ),
                              )
                            ]),
                            child: SvgPicture.asset(
                              "assets/images/arrow-down.svg",
                              color: const Color(0xffF1F5FD),
                            ),
                          ))
                    ],
                  ),
                  Expanded(child: Container())
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: GestureDetector(
            onTap: () {
              if (ContactUsisActive == false) {
                setState(() {});
                ContactUsisActive = true;
                VibrateisActive = false;
                ThemeisActive = false;
                SoundisActive = false;
                CategoryisActive = false;
              } else {
                setState(() {});
                ContactUsisActive = false;
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              width: sWidth,
              height: ContactUsisActive ? 150 : 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff2A135A),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff2A135A).withOpacity(.6),
                      blurRadius: 6.0,
                      offset: const Offset(
                        0,
                        3,
                      ),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: AppText(
                            text: "Contact Us",
                            size: 16,
                            color: Color(0xffF1F5FD),
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: const Color(0xffF1F5FD)
                                    .withOpacity(.1),
                                blurRadius: 6.0,
                                offset: const Offset(
                                  0,
                                  3,
                                ),
                              )
                            ]),
                            child: SvgPicture.asset(
                              "assets/images/arrow-down.svg",
                              color: const Color(0xffF1F5FD),
                            ),
                          ))
                    ],
                  ),
                  Expanded(child: Container())
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class FooterPage extends StatelessWidget {
  const FooterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AppText(
            text: "Made with \u2764 by hesamzs",
            size: 16,
            color: Color(0xff2A135A),
            fontWeight: FontWeight.bold),
        SizedBox(
          height: 5,
        ),
        AppText(
            text: "v0.10",
            size: 16,
            color: Color(0xff2A135A),
            fontWeight: FontWeight.bold),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}

