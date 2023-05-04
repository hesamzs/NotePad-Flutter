import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad/widget/text_widget.dart';
import '../../widget/date_widget.dart';

Widget TaskPageAppbar(double sWidth, String name, var context) {
  final date = getDate();

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
                  color: const Color(0xff2A135A).withOpacity(0.9),
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
                  text: sWidth < 240 ? " " : name,
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
      _MiddleAppBar(name, sWidth),
    ],
  );
}

Widget _MiddleAppBar(String name, double sWidth) {
  final date = getDate();

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
