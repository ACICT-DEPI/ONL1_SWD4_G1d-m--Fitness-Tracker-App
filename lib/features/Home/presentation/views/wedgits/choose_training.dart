import 'package:final_project/core/utls/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseTraining extends StatelessWidget {
  const ChooseTraining({super.key});

  @override
  Widget build(BuildContext context) {
    var sizee = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colorsapp.secondarycolor,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(sizee.width / 45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
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
                        decoration: const BoxDecoration(
                            color: Colors.orange, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_back)),
                      ),
                     
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.orange, shape: BoxShape.circle),
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
                      child:  Text(
                        "QUICK AND\n DYNAMIC",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          // color: Colors.white,
                        ),
                     
                     
                      ),
                                       ),
                   )
                ],
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Colorsapp.darkOrange),
                    padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 20, horizontal: 50))),
                child: const Text("Start"))
          ],
        ),
      ),
    );
  }
}
