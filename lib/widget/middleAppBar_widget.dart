import 'package:flutter/cupertino.dart';
import 'package:notepad/widget/text_widget.dart';

import 'color_widget.dart';
import 'date_widget.dart';

Widget middleAppBar(String name, BuildContext context) {
  final date = GetDate();

  var sWidth = MediaQuery.of(context).size.width;
  return sWidth < 239
      ? Column(
          children: [
            AppText(
              text: name,
              fontWeight: FontWeight.bold,
              color: purpleTheme,
              size: 20,
            ),
            AppText(text: "${date.getDayNum()} ${date.getMonth()} ${date.getYear()}", size: 12, color: purpleTheme.withOpacity(0.7), fontWeight: FontWeight.bold),
            const SizedBox(
              height: 20,
            )
          ],
        )
      : Container();
}
