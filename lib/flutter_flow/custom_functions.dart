import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String? day() {
  // write code that displays day
  String? day;
  final now = DateTime.now();
  final formatter = DateFormat('EEEE');
  day = formatter.format(now);
  return day;
}

String? wishes() {
  // create me a code that shows good morning, good afternoon, good evening according to the time
  var now = new DateTime.now();
  var formatter = new DateFormat('HH');
  String formatted = formatter.format(now);
  int hour = int.parse(formatted);
  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 16) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}

List<dynamic> jsonfilter(
  List<dynamic> jsonsource,
  String? catogery,
) {
  return jsonsource.where((json) => json['category'] == catogery).toList();
}

bool timelunch(DateTime currenttime) {
  //  if current time is equal to 10:30 am and less than 2:30 pm then return true
  if (currenttime.hour == 10 && currenttime.minute >= 30 ||
      currenttime.hour > 10 && currenttime.hour < 14 ||
      currenttime.hour == 14 && currenttime.minute < 30) {
    return true;
  } else {
    return false;
  }
}

bool timesnacks(DateTime currenttime) {
  // if current time is equals to 2:30 pm and less than 6 pm then return true
  if (currenttime.hour == 14 && currenttime.minute >= 30 ||
      currenttime.hour > 14 && currenttime.hour < 18) {
    return true;
  } else {
    return false;
  }
}

bool timedinner(DateTime currenttime) {
  // if current time is greater than 6:00 pm return true
  if (currenttime.hour >= 18) {
    return true;
  } else {
    return false;
  }
}

bool timebreakfast(DateTime currenttime) {
  // if current time less than 10:30 am return true
  if (currenttime.hour < 10) {
    return true;
  } else if (currenttime.hour == 10 && currenttime.minute < 30) {
    return true;
  } else {
    return false;
  }
}
