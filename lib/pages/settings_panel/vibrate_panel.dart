import 'package:flutter/material.dart';
import 'package:notepad/widget/text_widget.dart';

class VibratePanel extends StatefulWidget {
  const VibratePanel({super.key});

  @override
  State<VibratePanel> createState() => _VibratePanelState();
}

class _VibratePanelState extends State<VibratePanel> {

  List vibrateOption = [
    ["Default",true],
    ["Short",false],
    ["Long",false],
  ];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,0,16,16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for(var current in vibrateOption)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text: current[0],
                      size: 10,
                      color: const Color(0xffF1F5FD),
                      fontWeight: FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          for(var x in vibrateOption){
                            x[1] = false;
                          }
                          current[1] = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: const Color(0xffF1F5FD),width: 2),
                          color: current[1] ? const Color(0xffF1F5FD) : Colors.transparent,
                        ),
                        width: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
