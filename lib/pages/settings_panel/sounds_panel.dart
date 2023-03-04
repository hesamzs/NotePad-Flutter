import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:notepad/widget/text_widget.dart';

class SoundsPanel extends StatefulWidget {
  const SoundsPanel({Key? key}) : super(key: key);

  @override
  State<SoundsPanel> createState() => _SoundsPanelState();
}

class _SoundsPanelState extends State<SoundsPanel> {
  bool soundBtn = false;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(16,0,16,10),
      child: GestureDetector(
        onTap: (){
          print('clicked');
        },
        child: Row(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const AppText(
                        text: "Ringtone",
                        size: 10,
                        color: Color(0xffF1F5FD),
                        fontWeight: FontWeight.bold),
                    const SizedBox(
                      height: 2,
                    ),
                    AppText(
                        text: "Default",
                        size: 10,
                        color: const Color(0xffF1F5FD).withOpacity(.6),
                        fontWeight: FontWeight.bold),
                  ],
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 1,
                height: 30,
                color: Colors.white,
              ),
            ),
            Column(
              children: [
                SizedBox(height: 4,),
                SizedBox(
                  // color: Colors.black,
                  child: FlutterSwitch(
                    toggleSize: 15.0,
                    width: 40,
                    height: 25,
                    borderRadius: 30.0,
                    padding: 4.0,
                    inactiveColor: Colors.red,
                    activeColor: Colors.green,
                    // activeToggleColor: Color(0xff2A135A),
                    value: soundBtn,
                    onToggle: (value) {
                      print("VALUE : $value");
                      setState(() {
                        soundBtn = value;
                      });
                    },
                  ),
                ),
                Expanded(child: Container())
              ],
            )
          ],
        ),
      ),
    );
  }
}
