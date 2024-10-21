import 'package:flutter/material.dart';


class WaterScreen extends StatefulWidget {
  @override
  _WaterScreenState createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  double totalWater = 1000.0; // current water intake
  double waterGoal = 2000.0;  // daily goal

  void _addWater(double amount) {
    setState(() {
      totalWater += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = totalWater / waterGoal;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning, Harry Tran',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              // Current water intake display
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '09:00 AM',
                    style: TextStyle(fontSize: 18),
                  ),
                  Column(
                    children: [
                      Text('300ml water'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          _addWater(300);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Circular progress indicator for daily water goal
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 180,
                      width: 180,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 12,
                        backgroundColor: Colors.blue.shade100,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${totalWater.toInt()}ml',
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        Text('of ${waterGoal.toInt()}ml'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Add water button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _addWater(200); // adds 200ml
                  },
                  child: Text('Add'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Daily goal status
              Center(
                child: Text(
                  'You got ${((totalWater / waterGoal) * 100).toInt()}% of today\'s goal. Keep it up!',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
