import 'package:flutter/material.dart';

import '../../widget/text_widget.dart';

class ContactUs extends StatelessWidget {
  ContactUs({Key? key}) : super(key: key);

  List contactUs = [
    ["imageurl","Telegram","link"],
    ["imageurl","Instagram","link"],
    ["imageurl","Github","link"],
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: GestureDetector(
        onTap: () {
          print('clicked');
        },
        child:
        ListView.builder(
          itemCount: contactUs.length,
          itemBuilder: (context,index){
            var current = contactUs[index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: AppText(
                        text: current[1],
                        size: 10,
                        color: Color(0xffF1F5FD),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(Icons.link,color: Color(0xffF1F5FD),size: 18,)
              ],
            );

          },
        ),
      ),
    );
  }
}
