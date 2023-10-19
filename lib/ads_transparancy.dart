import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void askTracking(BuildContext context) {
  if (Platform.isIOS) {
    AppTrackingTransparency.trackingAuthorizationStatus.then((value) async {
      switch (value) {
        case TrackingStatus.authorized:
          return;
        case TrackingStatus.denied:
        case TrackingStatus.notSupported:
          return;
        case TrackingStatus.restricted:
          return;
        case TrackingStatus.notDetermined:
      }
      final res = await SharedPreferences.getInstance();

      if (res.getBool("TrackingStatus.denied") == true) {
        return;
      }
      await Future.delayed(const Duration(milliseconds: 200));
      final nav = await showAskDialog(
          context: context,
          force: true,
          msg:
          "To create an optimal platform with minimal costs on your end, we would like to display personalized ads.");
      if (!nav) {
        return;
      }
      await Future.delayed(const Duration(milliseconds: 200));
      AppTrackingTransparency.requestTrackingAuthorization().then((value) {
        if (value == TrackingStatus.denied) {
          SharedPreferences.getInstance()
              .then((value) => value.setBool("TrackingStatus.denied", true));
        }
      });
    });
  }
}

Future<bool> showAskDialog(
    {required BuildContext context, required msg, bool force = false}) async {
  bool pop = false;
  await showDialog<void>(
    context: context,
    barrierDismissible: true,
    // false = user must tap button, true = tap outside dialog
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text('Confirm'),
        content: Text('$msg'),
        actions: <Widget>[
          TextButton(
            child: Text(force ? 'continue' : 'Yes'),
            onPressed: () {
              pop = true;
              Navigator.of(dialogContext).pop(); // Dismiss alert dialog
            },
          ),
          if (!force)
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
        ],
      );
    },
  );
  return pop;
}
