import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

   

class CustomProgresstrain extends StatefulWidget {
  @override
  _CustomProgresstrainState createState() => _CustomProgresstrainState();
}

class _CustomProgresstrainState extends State<CustomProgresstrain> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(
    //   'https://www.example.com/sample-workout-video.mp4', // Use your video URL here
    // )
      // ..initialize().then((_) {
      //   setState(() {});
      //   _controller.play();
      //   _isPlaying = true;
      // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.fitness_center, color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.close, color: Colors.black),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AspectRatio(
                      aspectRatio: 1.8 / 1.8,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/wout.jpg"),
                              fit: BoxFit.fill),
                        ),
                      )),
         
          // Video player section
          // _controller.value.isInitialized
              // ? Container(
              //     height: 300,
              //     width: double.infinity,
              //     child: VideoPlayer(_controller),
              //   )
              // : Container(
              //     height: 300,
              //     color: Colors.black12,
              //     child: Center(child: CircularProgressIndicator()),
              //   ),

          // Timer and progress section
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Timer display
                  Text(
                    "00:28",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  
                  // Progress indicators (total time, completed percentage)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "00:02\nTOTAL TIME",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "0%\nCOMPLETED",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Pause/Play button and navigation
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Handle "Previous"
                          },
                          child: Text(
                            "Prev",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: _togglePlayPause,
                          backgroundColor: Colors.cyan,
                          child: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle "Next"
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
