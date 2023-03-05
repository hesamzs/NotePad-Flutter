import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widget/text_widget.dart';

class ContactUs extends StatelessWidget {
  ContactUs({Key? key}) : super(key: key);

  List contactUs = [
    ["Telegram", "t.me/hesamzs"],
    ["Instagram", "instagram.com/hesamzs"],
    ["Github", "github.com/hesamzs"],
    ["Footer", ""],
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: ListView.builder(
        itemCount: contactUs.length,
        itemBuilder: (context, index) {
          var current = contactUs[index];
          if (current[0] == "Footer") {
            return const SizedBox(
              height: 60,
              child: Center(child: FooterPage()),
            );
          } else {
            return GestureDetector(
              onTap: () {
                print('copied${current[1]}');
              },
              child: SizedBox(
                height: 25,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: AppText(
                            text: current[0],
                            size: 12,
                            color: const Color(0xffF1F5FD),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Icon(
                      Icons.copy,
                      color: Color(0xffF1F5FD),
                      size: 18,
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class FooterPage extends StatelessWidget {
  const FooterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        AppText(
            text: sWidth > 240 ? "Made with \u2764 by hesamzs" : "Made by hesamzs",
            size: sWidth > 270 ? 14 : 8,
            color: const Color(0xffF1F5FD).withOpacity(0.8),
            fontWeight: FontWeight.bold),
        const SizedBox(
          height: 5,
        ),
        AppText(
            text: "v0.10",
            size:  sWidth > 270 ? 12 : 8,
            color: const Color(0xffF1F5FD).withOpacity(0.8),
            fontWeight: FontWeight.bold),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
