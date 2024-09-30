import 'package:final_project/core/utls/colors.dart';
import 'package:final_project/features/Home/presentation/views/wedgits/choose_training.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpecificWorkout extends StatelessWidget {
  const SpecificWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    var sizee = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colorsapp.secondarycolor,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colorsapp.darkOrange,
        backgroundColor: Colorsapp.secondarycolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12,),
            const Center(
              child: Text("PUSH WORKOUT",style: TextStyle(color: Colors.white,fontSize: 30),),
            ),
            const Center(
              child: Text("START TRAINING",style: TextStyle(color: Colors.white,fontSize: 15),),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 25,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context)=>const ChooseTraining()));
                    },
                    child: Card(
                      color: Colorsapp.darkOrange,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(33),
                      ),
                      child: Container(
                        width: 300,
                        height: 150,
                        padding: EdgeInsets.all(sizee.width / 26),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                                aspectRatio: 1.8 / 1.8,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                        image:
                                            AssetImage("assets/images/wout.jpg"),
                                        fit: BoxFit.fill),
                                  ),
                                )),
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
                                      // color: Colors.white,
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
                            SizedBox(
                              width: sizee.width / 8,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const SpecificWorkout()));
                                },
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}