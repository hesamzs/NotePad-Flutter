import 'package:flutter/material.dart';

class GetDate {
  final now = DateTime.now();

  final months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  final days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  final dayShort = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

  int getDaysInMonth() {
    return (DateTimeRange(start: now, end: DateTime(now.year, now.month + 1)).duration.inDays);
  }

  String createDate(DateTime time) {
    String date = "${months[time.month - 1]} ${time.day},${time.year}";
    return date;
  }

  String checkDate() {
    String date = "${months[now.month - 1]} ${now.day},${now.year}";
    return date;
  }

  String getDayShort(int num) {
    int setDay;
    if (now.weekday - 1 + num < 7) {
      setDay = now.weekday - 1 + num;
      return dayShort[setDay];
    } else {
      setDay = now.weekday - 8 + num;
      return dayShort[setDay];
    }
  }

  String getDayNumWeek(int num) {
    var tomorrow = DateTime(now.year, now.month, now.day + num);
    return tomorrow.day.toString();
  }

  String getDay() {
    return days[now.weekday - 1];
  }

  String getMonth() {
    return months[now.month - 1];
  }

  String getDayNum() {
    return now.day.toString();
  }

  String getYear() {
    return now.year.toString();
  }
}
