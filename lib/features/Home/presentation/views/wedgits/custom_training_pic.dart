import 'package:flutter/material.dart';

class CustomTrainingPic extends StatelessWidget {
  const CustomTrainingPic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      height: 400,
      // margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 22),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(22)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200], shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back)),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200], shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 230,
            child: AspectRatio(
                aspectRatio: 1.8 / 1.8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/wout.jpg"),
                        fit: BoxFit.fill),
                  ),
                )),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "QUICK AND\nDYNAMIC",
                style: TextStyle(
                  fontSize: 37,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
