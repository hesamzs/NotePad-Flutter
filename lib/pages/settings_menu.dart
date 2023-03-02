import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notepad/pages/settings_panel/sounds_panel.dart';

import '../widget/text_widget.dart';

class SettingMenu extends StatefulWidget {
  SettingMenu({Key? key}) : super(key: key);


  @override
  State<SettingMenu> createState() => _SettingMenuState();
}

class _SettingMenuState extends State<SettingMenu> {

  static double checkDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else {
      print(value);
      return value;
    }
  }


  List settingMenu = [
    ["Sounds", 0 ,false,0,110 ,16, const SoundsPanel(),false],
    ["Vibration", 0 ,false,0,100, 16,Container(),false],
    ["Theme", 0 ,false,0,150,16, Container(),false],
    ["Contact Us", 0 ,false,0,150,16, Container(),false],
  ];

  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    return Column(

      children: [
        for (var current in settingMenu)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: GestureDetector(
              onTap: () {
                if (current[2] == false) {
                  Future.delayed(const Duration(milliseconds: 180), () {
                    setState(() {
                      current[7] = !current[7];
                    });
                  });

                  setState(() {
                    for(var booleans in settingMenu){
                      booleans[2] = false;
                      booleans[7] = false;
                    }
                  });

                  for(var booleans in settingMenu){
                    booleans[5] = 16;
                  }
                  current[5] += 6 ;
                  current[3] += -.5;
                  current[2] = true;
                } else {

                  Future.delayed(const Duration(milliseconds: 20), () {
                    setState(() {
                      current[7] = !current[7];
                    });
                  });
                  for(var booleans in settingMenu){
                    booleans[5] = 16;
                  }
                  current[3] += .5;
                  current[2] = false;
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                width: sWidth,
                height: current[2] ? checkDouble(current[4].toString()) : 50,
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 2, 15),
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 300),
                            style: TextStyle(fontSize: checkDouble(current[5].toString()),
                                color: const Color(0xffF1F5FD),
                                fontWeight: FontWeight.bold),
                            child: Text(
                                current[0],
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(5, 10, 15, 10),
                            child: Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xffF1F5FD).withOpacity(.1),
                                    blurRadius: 6.0,
                                    offset: const Offset(
                                      0,
                                      3,
                                    ),
                                  )
                                ]),
                                child:AnimatedRotation(
                                  turns: checkDouble(current[3].toString()),
                                  duration: const Duration(milliseconds: 350),
                                  child: SvgPicture.asset(
                                    "assets/images/arrow-down.svg",
                                    color: const Color(0xffF1F5FD),
                                  ),)
                            ))
                      ],
                    ),
                    current[7] ? Expanded(
                      child:  Container(
                        child: current[6],
                        // color: Colors.red,
                      )
                    ):const SizedBox(),
                    // Expanded(child: Container()),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}