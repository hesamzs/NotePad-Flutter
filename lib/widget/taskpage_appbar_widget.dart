import 'package:flutter/material.dart';
import 'package:notepad/widget/text_widget.dart';

import '../../widget/date_widget.dart';
import 'color_widget.dart';
import 'middleAppBar_widget.dart';

Widget taskPageAppbar(String name, var context, modelList) {
  final date = GetDate();
  var sWidth = MediaQuery.of(context).size.width;

  return Column(
    children: [
      Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context, [name, modelList]),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: purpleTheme,
                      blurRadius: 16.0,
                      offset: Offset(
                        0,
                        0,
                      ),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                  color: purpleTheme.withOpacity(0.9),
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
                  color: purpleTheme,
                  size: 20,
                ),
                AppText(text: sWidth < 240 ? " " : "${date.getDayNum()} ${date.getMonth()} ${date.getYear()}", size: 12, color: purpleTheme.withOpacity(0.7), fontWeight: FontWeight.bold),
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
      middleAppBar(name, context),
    ],
  );
}
