import 'package:final_project/core/caching/caching_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pedometer/pedometer.dart';
import '../../../core/utils/colors.dart';
import '../widgets/steps_circular_indicator.dart';

class StepsScreen extends StatefulWidget {
  @override
  _StepsScreenState createState() => _StepsScreenState();
}

class _StepsScreenState extends State<StepsScreen> {
    late Stream<StepCount> _stepCountStream;
  int _totalSteps = 0; // Tracks total steps from pedometer
  int _todaySteps = 0; // Tracks today's steps
  String _todayDate = ''; // Tracks current date

  @override
  void initState() {
    super.initState();
    _initTodaySteps();
    startListening();
  }

  // Initialize step data for the current day
  Future<void> _initTodaySteps() async {
    String todayDate = _getFormattedDate(DateTime.now());
    String savedDate = CachingHelper.instance?.readString('savedDateForSteps') ?? '';
    print("*******************$savedDate");
    _totalSteps = CachingHelper.instance?.readInteger('savedTotalSteps') ?? 0;
    print("////////////$_totalSteps");
    int lastSavedSteps = CachingHelper.instance?.readInteger('lastSavedSteps') ?? 0;
    print("////////////$lastSavedSteps");

    // Reset the steps if the saved date is not today's date
    if (savedDate == todayDate) {
      // Same day, so just load the saved steps
      setState(() {
        _todaySteps = _totalSteps - lastSavedSteps;
      });
    } else {
      // New day, reset today’s steps
      await _saveStepsForToday(0);
    }

    setState(() {
      _todayDate = todayDate;
    });
  }

  void startListening() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(_onStepCount).onError(_onStepCountError);
  }

  // Step count event handler
  void _onStepCount(StepCount event) {
    _initTodaySteps();
    int stepsSinceBoot = event.steps; // Total steps from pedometer
    int lastSavedSteps = CachingHelper.instance?.readInteger('lastSavedSteps') ?? 0;

    setState(() {
      _totalSteps = stepsSinceBoot;
      _todaySteps = _totalSteps - lastSavedSteps; // Calculate today's steps
      CachingHelper.instance?.writeData('savedTotalSteps', _totalSteps);

      print("*********************** ALL = $stepsSinceBoot");
      print("*********************** LAST = $lastSavedSteps");
      print("*********************** TODAY = $_todaySteps");
    });

    // Periodically save the steps as a precaution
    //_saveCurrentSteps(stepsSinceBoot);
  }

  void _onStepCountError(error) {
    setState(() {
      _todaySteps = 0;
    });
  }

  // Get formatted date (YYYY-MM-DD)
  String _getFormattedDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }

  // Save the steps count for today
  Future<void> _saveStepsForToday(int steps) async {
    String todayDate = _getFormattedDate(DateTime.now());
    print("*****************TEST CASE*********************************");
    print("*****************$_totalSteps*********************************");
    print("*****************TEST CASE*********************************");

    setState(() {
      _todaySteps = steps;
    });

    CachingHelper.instance?.writeData('savedTotalSteps', _totalSteps);
    CachingHelper.instance?.writeData('savedDateForSteps', todayDate);
    CachingHelper.instance?.writeData('lastSavedSteps', _totalSteps);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Steps Tracker',
          style: TextStyle(color: Colors.white),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.directions_walk,
              size: 100,
              color: Colorsapp.darkOrange,
            ),
            SizedBox(
              height: 70,
            ),
            StepsCircularIndicator(
              steps: _todaySteps, // Replace with actual steps value
              stepGoal: 9800, // Replace with actual step goal value
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Steps Taken Today',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            Text(
              '$_todaySteps',
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colorsapp.darkOrange),
            ),
             SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'All your steps: ',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                '$_totalSteps',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colorsapp.darkOrange),
              ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'last steps: ',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    CachingHelper.instance?.readInteger('lastSavedSteps').toString()??'',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colorsapp.darkOrange),
              ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
