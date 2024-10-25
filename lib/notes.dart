// The DatePicker
// showDatePicker(
// context: context,
// initialDate: date.now,
// firstDate: DateTime(2023),
// lastDate: DateTime(date.now.year + 5),
// builder: (context, child) => Theme(
// data: ThemeData().copyWith(
// colorScheme: const ColorScheme.light(
// onPrimary: Color(0xffF1F5FD),
// primary: Color(0xff422D70),
// ),
// dialogBackgroundColor: const Color(0xffF1F5FD),
// ),
// child: child!,
// ),
// ).then((value) {
// print(value);
// });

// Days List Widget

// sWidth > 450
// ? Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: _CreateList(),
// )
// : _CreateListView()),

// List<Widget> _CreateList() {
//   return List.generate(
//     7,
//         (index) {
//       return Padding(
//         padding: const EdgeInsets.only(right: 8.0, bottom: 8),
//         child: GestureDetector(
//           onTap: () {
//             setState(() {
//               isTrue = index;
//             });
//           },
//           child: Container(
//             width: 50,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(
//                     color: isTrue == index
//                         ? Colors.transparent
//                         : purpleTheme.withOpacity(0.7),
//                     width: 2),
//                 boxShadow: [
//                   BoxShadow(
//                     color: purpleTheme.withOpacity(0.3),
//                     blurRadius: 3.0,
//                     offset: const Offset(
//                       2,
//                       3,
//                     ),
//                   ),
//                 ],
//                 gradient: isTrue == index
//                     ? const LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     Color(0xff685492),
//                      purpleTheme,
//                   ],
//                 )
//                     : const LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     Color(0xffF1F5FD),
//                     Color(0xffF1F5FD),
//                   ],
//                 )),
//             child: Column(
//               children: [
//                 Expanded(child: Container()),
//                 Center(
//                     child: AppText(
//                         text: date.getDayShort(index),
//                         size: 5,
//                         color: isTrue == index
//                             ? const Color(0xffF1F5FD)
//                             : purpleTheme,
//                         fontWeight: FontWeight.bold)),
//                 Center(
//                   child: AppText(
//                       text: date.getDayNumWeek(index),
//                       size: 18,
//                       color: isTrue == index
//                           ? const Color(0xffF1F5FD)
//                           : purpleTheme,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 Expanded(child: Container()),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
//
// Widget _CreateListView() {
//   return ListView.builder(
//     itemCount: 7,
//     scrollDirection: Axis.horizontal,
//     itemBuilder: (BuildContext context, int index) {
//       return Padding(
//         padding: const EdgeInsets.only(right: 8.0, bottom: 8),
//         child: GestureDetector(
//           onTap: () {
//             setState(() {
//               isTrue = index;
//             });
//           },
//           child: Container(
//             width: 50,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(
//                     color: isTrue == index
//                         ? Colors.transparent
//                         : purpleTheme.withOpacity(0.7),
//                     width: 2),
//                 boxShadow: [
//                   BoxShadow(
//                     color: purpleTheme.withOpacity(0.3),
//                     blurRadius: 3.0,
//                     offset: const Offset(
//                       2,
//                       3,
//                     ),
//                   ),
//                 ],
//                 gradient: isTrue == index
//                     ? const LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     Color(0xff685492),
//                      purpleTheme,
//                   ],
//                 )
//                     : const LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     Color(0xffF1F5FD),
//                     Color(0xffF1F5FD),
//                   ],
//                 )),
//             child: Column(
//               children: [
//                 Expanded(child: Container()),
//                 Center(
//                     child: AppText(
//                         text: date.getDayShort(index),
//                         size: 5,
//                         color: isTrue == index
//                             ? const Color(0xffF1F5FD)
//                             : purpleTheme,
//                         fontWeight: FontWeight.bold)),
//                 Center(
//                   child: AppText(
//                       text: date.getDayNumWeek(index),
//                       size: 18,
//                       color: isTrue == index
//                           ? const Color(0xffF1F5FD)
//                           : purpleTheme,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 Expanded(child: Container()),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
