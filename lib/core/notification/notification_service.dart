import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;


class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  tz.TZDateTime convertToTZDateTime(DateTime dateTime) {
    return tz.TZDateTime.from(dateTime, tz.local);
  }

  Future<void> scheduleNotification(
      String channelId, String channelName, String channelDescription,
      String title, String body, DateTime scheduledTime,
       DateTime start, DateTime end) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId,channelName,
      channelDescription: channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      playSound: true,
      //sound: RawResourceAndroidNotificationSound('assets/sound.mp3'),
    );

    final platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        title,
        body,
        tz.TZDateTime.from(scheduledTime, tz.local),//5:30
        platformChannelSpecifics,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      ).then((value){print("DONE");print(scheduledTime);});
    }

  Future<void> showNotification(
      String channelId, String channelName, String channelDescription,
      String title, String body,) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId,channelName,
      channelDescription: channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      playSound: true,
      sound: const RawResourceAndroidNotificationSound('alarm_sound'),
    );
    final platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
      await _flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        platformChannelSpecifics,
      ).then((value){print("DONE");});
    }



  Future<void> periodicScheduleNotification(String title, String body, DateTime scheduledTime) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
        'repeating channel id', 'repeating channel name',
        channelDescription: 'repeating description',);
    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.periodicallyShow(0, title,
        body, RepeatInterval.everyMinute, notificationDetails,
        androidAllowWhileIdle: true
    );
  }
}