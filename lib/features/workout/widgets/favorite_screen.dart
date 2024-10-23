import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/core/utils/caloriesadtrtime.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/authentication/cubit/auth_cubit.dart';
import 'package:final_project/features/workout/widgets/choose_training.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sizee = MediaQuery.of(context).size;
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    // Reference to the user's 'fav' collection in Firestore
    CollectionReference favCollection = FirebaseFirestore.instance
        .collection("uuser")
        .doc(user?.uid)
        .collection("fav");

    return Scaffold(
      backgroundColor: Colorsapp.secondarycolor,
      appBar: AppBar(
        title: const Text("Favorite Exercises"),
        elevation: 0,
        foregroundColor: Colorsapp.darkOrange,
        backgroundColor: Colorsapp.secondarycolor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: favCollection.snapshots(), // Real-time updates using snapshots
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          // Show a loading spinner while data is loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // If data is available, display it
          if (snapshot.hasData) {
            final exercises = snapshot.data!.docs;

            // Check if there are no favorites
            if (exercises.isEmpty) {
              return const Center(child: Text('No favorite exercises found'));
            }

            return ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                var exerciseData =
                    exercises[index].data() as Map<String, dynamic>;

                // Extract fields from the document
                String image = exerciseData['image'];
                String equip = exerciseData['equip'];
                String exName = exerciseData['exName'];
                String ind = exerciseData['index'];

                return InkWell(
                  onTap: () {
                    int indd = int.parse(ind);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ChooseTraining(
                                  trainInd: indd,
                                  traincalory: allWorkoutTimeAndcalory[indd]
                                          [index]
                                      .tCalory,
                                  // pushlist[index].tCalory,
                                  trainTime: allWorkoutTimeAndcalory[indd]
                                          [index]
                                      .tTime,
                                  ind: index,
                                  pic: image,
                                  isfavorite: true,
                                )));
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
                          // Image.memory(state.workouts[index].gifUrl),
                          AspectRatio(
                              aspectRatio: 1.8 / 1.8,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(image),
                                      fit: BoxFit.fill),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Equipment: $equip",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      // color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  exName,
                                  style: const TextStyle(
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
                              onPressed: () async {
                                // String image = state.workouts[index].gifUrl;
                                //   String eq = state.workouts[index].equipment;
                                //   String exname = state.workouts[index].bodyPart;
                                //   String indexx = widget.ind.toString();

                                // Check if the item already exists in Firestore
                                QuerySnapshot querySnapshot =
                                    await AuthCubit.get(context).checkIfExists(
                                  image: image,
                                  eq: equip,
                                  exname: exName,
                                  indexx: ind,
                                );

                                bool isCurrentlyFavorite =
                                    querySnapshot.docs.isNotEmpty;

                                if (!isCurrentlyFavorite) {
                                  // Item doesn't exist, so add it
                                  await AuthCubit.get(context).addData(
                                    image: image,
                                    eq: equip,
                                    exname: exName,
                                    indexx: ind,
                                  );
                                  print("Exercise added to favorites.");
                                  // setState(() {
                                  //   isFavoriteList[index] = true; // Set to true for this index
                                  // });
                                } else {
                                  // Item exists, so remove it
                                  await AuthCubit.get(context).removeData(
                                    image: image,
                                    eq: equip,
                                    exname: exName,
                                    indexx: ind,
                                  );
                                  print("Exercise removed from favorites.");
                                  // setState(() {
                                  //   isFavoriteList[index] = false; // Set to false for this index
                                  // });
                                }
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
              },
            );
          }

          // Default display if no data is available
          return const Center(child: Text('No data available'));
        },
      ),
    );
  }
}
