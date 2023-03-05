import 'package:flutter/material.dart';
import 'package:notepad/pages/settings_menu.dart';
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
            child: sHeight > 240
                ? Column(
                    children: [
                      const SizedBox(
                        height: 40,
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
                              text: "Settings",
                              size: 20,
                              color: Color(0xff2A135A),
                              fontWeight: FontWeight.bold),
                        ],
                      ),
                      Container(
                        color: Colors.transparent,
                        height: sHeight > 280 ? sHeight * 0.16 : sHeight * 0.09,
                      ),
                      Container(
                        height: sHeight > 450 ? sHeight / 1.7 : sHeight / 2,
                        color: Colors.transparent,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [SettingMenu()],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  )
                : const Center(
                    child: AppText(
                        text: "your screen size is too small ",
                        size: 14,
                        color: Color(0xff2A135A),
                        fontWeight: FontWeight.w600),
                  ),
          )
        ],
      ),
    );
  }
}

