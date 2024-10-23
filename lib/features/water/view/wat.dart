import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weekly Progress"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgressItem(
              title: "Drink Water",
              progress: 75,
              lastWeekProgress: 68,
            ),
            SizedBox(height: 20),
            ProgressItem(
              title: "Exercise",
              progress: 50,
              lastWeekProgress: 50,
            ),
            SizedBox(height: 20),
            ProgressItem(
              title: "Study",
              progress: 82,
              lastWeekProgress: 77,
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressItem extends StatelessWidget {
  final String title;
  final int progress;
  final int lastWeekProgress;

  const ProgressItem({
    required this.title,
    required this.progress,
    required this.lastWeekProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: progress / 100,
                strokeWidth: 8,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
              ),
              Text(
                "$progress%",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Last Week: $lastWeekProgress%",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        ],
      ),
    );
  }
}