import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:final_project/core/notification/notification_service.dart';
import 'package:final_project/features/sleep/cubit/sleep_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/caching/caching_helper.dart';

class SleepCubit extends Cubit<SleepStates> {
  SleepCubit() : super(InitialState());

  static SleepCubit get(context) => BlocProvider.of(context);

  TimeOfDay? selectedSleepTime;
  TimeOfDay? selectedAlarmTime;

  Future<void> initSleep() async {
    selectedSleepTime =
        stringToTimeOfDay(CachingHelper.instance?.readString('savedSleepTime'));
    selectedAlarmTime =
        stringToTimeOfDay(CachingHelper.instance?.readString('savedAlarmTime'));
  }

  Future<void> setAlarm() async {
    // Request permission for scheduling exact alarms
    var status = await Permission.scheduleExactAlarm.request();
    if (status.isGranted) {
      // Schedule the alarm for a specific time
      DateTime now = DateTime.now();
      DateTime alarmTime = DateTime(now.year, now.month, now.day,
          selectedAlarmTime!.hour, selectedAlarmTime!.minute);
      // If the selected time is in the past, schedule it for the next day
      if (alarmTime.isBefore(now)) {
        alarmTime = alarmTime.add(Duration(days: 1));
      }
      await scheduleAlarm(alarmTime);
      print("Schedule Alaaaaaaaaaaaaaaaaaarm :     $alarmTime");
    } else {
      print('Permission to schedule exact alarm was denied');
    }
  }

  Future<void> scheduleAlarm(DateTime alarmTime) async {
    final int alarmId = 0; // You can give each alarm a unique ID
    await AndroidAlarmManager.oneShotAt(
      alarmTime,
      alarmId,
      alarmCallback,
      exact: true,
      wakeup: true,
    ).then((v) {
      print("AndroidAlarmManager value: $v");
    });
  }

// The callback function that triggers the notification
  static void alarmCallback() async {
    await NotificationService()
        .showNotification(
      'alarm_channel',
      'Alarm',
      'Channel for Alarm Notifications',
      'Alarm',
      'Time to wake up!',
    ).then((val) {
      print("SUCCESS SEND");
    });
  }

  TimeOfDay? stringToTimeOfDay(String? timeString) {
    if (timeString != null) {
      try {
        // Trim any leading/trailing whitespace
        timeString = timeString.trim();

        // Check if the string starts and ends with the expected format
        if (timeString.startsWith("TimeOfDay(") && timeString.endsWith(")")) {
          // Extract the content within "TimeOfDay(...)"
          timeString = timeString.substring(10, timeString.length - 1);
        } else {
          throw FormatException("Invalid format, must be TimeOfDay(hh:mm)");
        }

        // Split the string to get hour and minute
        final timeParts = timeString.split(':');

        if (timeParts.length != 2) {
          throw FormatException("Invalid time format, must be hh:mm");
        }

        final hour = int.parse(timeParts[0].trim()); // Extract the hour
        final minute = int.parse(timeParts[1].trim()); // Extract the minute

        // Return the TimeOfDay object
        return TimeOfDay(hour: hour, minute: minute);
      } catch (e) {
        print('Error parsing time: $e');
        return null; // Return null if input is invalid
      }
    }
    return null;
  }
}
