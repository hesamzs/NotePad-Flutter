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
            child: Column(
              children: [
                SizedBox(
                  height: sHeight * 0.1,
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
                Expanded(flex:1,child: Container()),
                SettingMenu(),
                Expanded(flex:3,child: Container()),

                const FooterPage(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FooterPage extends StatelessWidget {
  const FooterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
            text: "Made with \u2764 by hesamzs",
            size: 14,
            color: const Color(0xff2A135A).withOpacity(0.8),
            fontWeight: FontWeight.bold),
        const SizedBox(
          height: 5,
        ),
        AppText(
            text: "v0.10",
            size: 12,
            color: const Color(0xff2A135A).withOpacity(0.8),
            fontWeight: FontWeight.bold),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
