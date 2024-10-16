import 'package:flutter/material.dart';

class CalcCard extends StatelessWidget {
  CalcCard({super.key, required this.route, required this.image, required this.title});

  Widget route;
  String image;
  String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => route,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 1,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
              child: Image(image: AssetImage(image), fit: BoxFit.fill,),
            ),
            SizedBox(height: 5,),
            Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepOrange[400]),),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
