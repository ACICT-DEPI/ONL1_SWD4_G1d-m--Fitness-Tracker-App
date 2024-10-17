import 'dart:async';
import 'package:flutter/material.dart';

 

class SleepTrackerScreen extends StatefulWidget {
  @override
  _SleepTrackerScreenState createState() => _SleepTrackerScreenState();
}

class _SleepTrackerScreenState extends State<SleepTrackerScreen> {
  // Variables for sleep tracking
  DateTime _startTime = DateTime.now();  // Initialized with current time
  Duration _elapsedTime = const Duration();
  Timer? _timer;  // Made nullable
  bool _isTracking = false;

  // Dummy alarm time
  String alarmTime = "07:00 AM";

  // To store quality of sleep
  int sleepQuality = 80; // This could be calculated or randomized

  // Start tracking sleep time
  void _startSleepTracking() {
    setState(() {
      _isTracking = true;
      _startTime = DateTime.now();
    });

    // Timer to update the sleep duration every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime = DateTime.now().difference(_startTime);
      });
    });
  }

  // Stop the timer and sleep tracking
  void _stopSleepTracking() {
    if (_timer != null) {
      _timer!.cancel();  // Use null-aware operator
    }

    setState(() {
      _isTracking = false;
      // You can also add logic here to calculate sleep quality based on _elapsedTime.
      sleepQuality = calculateSleepQuality(_elapsedTime.inMinutes); // Example logic
    });
  }

  // Simulate sleep quality calculation (example logic)
  int calculateSleepQuality(int durationInMinutes) {
    if (durationInMinutes > 60) {
      return 90;
    } else if (durationInMinutes > 30) {
      return 80;
    } else {
      return 60;
    }
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Top App Bar
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu, color: Colors.white),
                Text('Sleep Tracker',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          // Center content (Time, Alarm, Moon, and Stats)
          Center(
            child: Column(
              children: [
                Text(
                  _isTracking
                      ? _formatDuration(_elapsedTime) // Show elapsed time
                      : 'Start Tracking', // Default text when not tracking
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Alarm $alarmTime',
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 20),
                // Moon and Stars
                const Stack(
                  alignment: Alignment.center,
                  children: [
                    // Stars
                    Positioned(
                      top: 0,
                      left: 40,
                      child: Icon(Icons.star, color: Colors.red, size: 30),
                    ),
                    Positioned(
                      top: 60,
                      left: 100,
                      child: Icon(Icons.star, color: Colors.yellow, size: 30),
                    ),
                    Positioned(
                      top: 100,
                      right: 60,
                      child: Icon(Icons.star, color: Colors.blue, size: 30),
                    ),
                    // Moon Icon
                    Icon(Icons.brightness_3, color: Colors.white, size: 100),
                  ],
                ),
                const SizedBox(height: 30),
                // Sleep stats
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    sleepStat('${_elapsedTime.inMinutes} Min', 'Duration'),
                    sleepStat(_isTracking ? '${(_elapsedTime.inHours % 24)} hours' : '0 hours', 'Sleep Tracking'),
                    sleepStat('$sleepQuality%', 'Quality'),
                  ],
                ),
              ],
            ),
          ),
          // Swipe up to Stop Tracking button
          GestureDetector(
            onVerticalDragEnd: (details) {
              if (_isTracking) {
                _stopSleepTracking(); // Stop tracking on swipe up
              } else {
                _startSleepTracking(); // Start tracking on swipe up
              }
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  _isTracking ? 'Swipe up to Stop Tracking' : 'Swipe up to Start Tracking',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget for displaying sleep stats
  Widget sleepStat(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label,
            style: const TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.normal)),
      ],
    );
  }

  // Format Duration to a readable format
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}