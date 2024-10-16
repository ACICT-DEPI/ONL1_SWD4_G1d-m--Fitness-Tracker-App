import 'package:final_project/features/sleep/cubit/sleep_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class SleepCubit extends Cubit<SleepStates> {
  SleepCubit() : super(InitialState());

  static SleepCubit get(context) => BlocProvider.of(context);

  Future<void> openAlarm() async {
    // Android-specific URL to open alarm
    const alarmUrl = 'content://com.android.alarmclock/alarm';
    //const alarmUrl = 'intent://com.android.deskclock/alarm#Intent;scheme=content;end';


    final Uri alarmUri = Uri.parse(alarmUrl);

    if (await canLaunchUrl(alarmUri)) {
      await launchUrl(alarmUri);
    } else {
      throw 'Could not open the alarm app';
    }
  }

}