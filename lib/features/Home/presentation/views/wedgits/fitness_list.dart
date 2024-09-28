import 'package:flutter/material.dart';

class FitnessList extends StatelessWidget {
  const FitnessList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 25,
        itemBuilder: (BuildContext context, index) {
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(33),
            ),
            child: Container(
              width: 300,
              height: 150,
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/wout.jpg"),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'WORKOUT\n AT HOME',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'PUSH',
                          style: TextStyle(
                            fontSize: 15,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(
                  width: 60,
                ),
                  Expanded(child: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward)))
                ],
              ),
            ),
          );
        });
  }
}
