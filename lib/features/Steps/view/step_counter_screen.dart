import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';


class StepCounterScreen extends StatefulWidget {
  @override
  _StepCounterScreenState createState() => _StepCounterScreenState();
}

class _StepCounterScreenState extends State<StepCounterScreen> {
  String _stepCount = '0';
  late Stream<StepCount> _stepCountStream;

  @override
  void initState() {
    super.initState();
    startListening();
  }

  void startListening() {
    _stepCountStream = Pedometer.stepCountStream;

    _stepCountStream.listen(onStepCount).onError(onStepCountError);
  }

  void onStepCount(StepCount event) {
    setState(() {
      _stepCount = event.steps.toString();
    });
  }

  void onStepCountError(error) {
    print("Step Count Error: $error");
    setState(() {
      _stepCount = 'Step Count Not Available';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Steps Taken:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              _stepCount,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}