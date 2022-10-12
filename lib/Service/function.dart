import 'dart:io';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class Functions {




  static DateTime getFullDate(String dateTime) {
    return DateTime.fromMillisecondsSinceEpoch(int.tryParse(dateTime)!);
  }



  static String getFormattedDate(String dateTime) {
    // final template = DateFormat('dd, MMMM yyyy - hh:mm a');
    final template = DateFormat('dd, MMMM yyyy');
    return template
        .format(DateTime.fromMillisecondsSinceEpoch(int.tryParse(dateTime)!));
  }

  static String getFormattedInMMDDYY(String dateTime) {
    final template = DateFormat('hh:mm a MM/dd/yy');
    return template
        .format(DateTime.fromMillisecondsSinceEpoch(int.tryParse(dateTime)!));
  }

  static int getYear(String dateTime) {
    return DateTime.fromMillisecondsSinceEpoch(int.tryParse(dateTime)!).year;
  }

  static int getMonth(String dateTime) {
    return DateTime.fromMillisecondsSinceEpoch(int.tryParse(dateTime)!).month;
  }

  static int getDay(String dateTime) {
    return DateTime.fromMillisecondsSinceEpoch(int.tryParse(dateTime)!).day;
  }

  static String getTime(String dateTime) {
    final template = DateFormat('hh:mm a');
    return template
        .format(DateTime.fromMillisecondsSinceEpoch(int.tryParse(dateTime)!));
  }
}
