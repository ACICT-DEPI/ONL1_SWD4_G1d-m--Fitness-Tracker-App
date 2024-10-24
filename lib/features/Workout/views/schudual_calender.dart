import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/Workout/widgets/input_textfield.dart';
import 'package:final_project/features/authentication/cubit/auth_cubit.dart';
import 'package:final_project/features/authentication/cubit/auth_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class SchudualCalendar extends StatefulWidget {
  const SchudualCalendar({super.key});

  @override
  State<SchudualCalendar> createState() => _SchudualCalendarState();
}

class _SchudualCalendarState extends State<SchudualCalendar> {
 
  CalendarFormat format = CalendarFormat.month;
  DateTime focuseddDay = DateTime.now();
  DateTime selecteddDay = DateTime.now();
  TextEditingController eventcontroller = TextEditingController();
  String currentTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String schudualTime = "02:00 PM";
 

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            backgroundColor: Colors.black,
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Training Schudual"),
              backgroundColor: Colors.black,
              foregroundColor: Colorsapp.darkOrange,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [addcalenderBody()],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              icon: const Icon(Icons.add),
              label: const Text("Add Exersice"),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 300,
                        child: AlertDialog(
                          title: const Text("Add Event"),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                InputTextfield(
                                    controller: eventcontroller,
                                    hint: "Enter Your Exercise",
                                    title: "Exercise"),
                                InputTextfield(
                                  hint: schudualTime.toString(),
                                  title: "Start Exercise",
                                  widget: IconButton(
                                      onPressed: () {
                                        getTimeFromUser(isStartTime: true);
                                        setState(() {});
                                      },
                                      icon: const Icon(Icons.access_time)),
                                )
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  AuthCubit.get(context).addTrain(
                                      focusDay: focuseddDay.day.toString(),
                                      title: eventcontroller.text,
                                      schudualTime: schudualTime,
                                      currentTime: currentTime);
                                  // if (eventcontroller.text.isEmpty) {
                                  // } else {
                                  //   if (selectedEvents[selecteddDay] != null) {
                                  //     selectedEvents[selecteddDay]?.add(Event(
                                  //         schudualTime: schudualTime,
                                  //         title: eventcontroller.text,
                                  //         currentTime: currentTime));
                                  //   } else {
                                  //     selectedEvents[selecteddDay] = [
                                  //       Event(
                                  //           schudualTime: schudualTime,
                                  //           title: eventcontroller.text,
                                  //           currentTime: currentTime)
                                  //     ];
                                  //   }
                                  // }
                                  Navigator.pop(context);
                                  eventcontroller.clear();
                                  setState(() {});
                                  return;
                                },
                                child: const Text("Ok")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel")),
                          ],
                        ),
                      );
                    });
              },
            ),
          );
        });
  }

  _showTimePicker() {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour:
            int.parse(schudualTime.split(":")[0]), // Corrected split delimiter
        minute: int.parse(schudualTime
            .split(":")[1]
            .split(" ")[0]), // Corrected split delimiter
      ),
    );
  }

  getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    if (pickedTime == null) {
      print("Time canceled");
    } else {
      String formatedTime = pickedTime.format(context);

      if (isStartTime == true) {
        setState(() {
          schudualTime = formatedTime;
        });
      } else {
        setState(() {
          print("object");
        });
      }
    }
  }

  addcalenderBody() {
    User? user = FirebaseAuth.instance.currentUser;

    // Reference to the user's 'fav' collection in Firestore
    CollectionReference userTrain = FirebaseFirestore.instance
        .collection("test")
        .doc(user?.uid)
        .collection("d${focuseddDay.day.toString()}");
    return Column(children: [
      TableCalendar(
          // shouldFillViewport: true,

          daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colorsapp.darkOrange),
              weekendStyle: TextStyle(color: Colorsapp.darkOrange)),
          selectedDayPredicate: (day) {
            return isSameDay(selecteddDay, day);
          },
           
          calendarStyle: CalendarStyle(
              outsideTextStyle: TextStyle(color: Colorsapp.darkOrange),
              weekendTextStyle: TextStyle(color: Colorsapp.darkOrange),
              weekNumberTextStyle: TextStyle(color: Colorsapp.darkOrange),
              isTodayHighlighted: true,
              weekendDecoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              defaultDecoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              defaultTextStyle: TextStyle(color: Colorsapp.darkOrange),
              todayDecoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.deepOrange),
              selectedDecoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue)),
          startingDayOfWeek: StartingDayOfWeek.saturday,
          daysOfWeekVisible: true,
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              selecteddDay = selectedDay;
              focuseddDay = focusedDay;
            });
            print(focuseddDay);
          },
          calendarFormat: format,
          onFormatChanged: (CalendarFormat _format) {
            setState(() {
              format = _format;
            });
          },
          headerStyle: HeaderStyle(
              formatButtonDecoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(12)),
                  border: Border(
                    bottom: BorderSide(
                      color: Colorsapp.darkOrange,
                    ),
                    top: BorderSide(
                      color: Colorsapp.darkOrange,
                    ),
                    left: BorderSide(
                      color: Colorsapp.darkOrange,
                    ),
                    right: BorderSide(
                      color: Colorsapp.darkOrange,
                    ),
                  ),
                  color: Colors.black),
              leftChevronIcon: Icon(
                Icons.arrow_back_ios_new,
                color: Colorsapp.darkOrange,
                size: 15,
              ),
              rightChevronIcon: Icon(
                Icons.arrow_forward_ios,
                color: Colorsapp.darkOrange,
                size: 15,
              ),
              decoration: const BoxDecoration(),
              titleTextStyle: TextStyle(color: Colorsapp.darkOrange),
              formatButtonTextStyle: TextStyle(color: Colorsapp.darkOrange)),
          focusedDay: DateTime.now(),
          firstDay: DateTime(1990),
          lastDay: DateTime(2222)),
      StreamBuilder<QuerySnapshot>(
          stream: userTrain.snapshots(),
          builder: (context, snapshot) {
            var sizee = MediaQuery.of(context).size;

            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }

            // Show a loading spinner while data is loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              final exercises = snapshot.data!.docs;

              // Check if there are no favorites
              if (exercises.isEmpty) {
                return const Center(child: Text('No favorite exercises found'));
              }

              return SizedBox(
                height: sizee.height / 2.4,
                child: ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (BuildContext context, index) {
                      var exercisetime =
                          exercises[index].data() as Map<String, dynamic>;
                      String stitle = exercisetime['schud_title'];
                      String sTime = exercisetime['schudualtime'];
                      String cTime = exercisetime['currenttime'];

                      return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colorsapp.darkOrange,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Row(
                              children: [
                                const Text("Exercise will Start at : "),
                                Text(sTime),
                              ],
                            ),
                            titleTextStyle: const TextStyle(
                              fontSize: 14,
                            ),
                            leadingAndTrailingTextStyle: const TextStyle(
                              fontSize: 22,
                            ),
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(stitle),
                                Text(
                                  cTime,
                                  style: const TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  AuthCubit.get(context).removeTrain(
                                      documentId:exercises[index].id ,
                                      focusDay: focuseddDay.day.toString());
                                },
                                icon: const Icon(Icons.delete)),
                          ));
                    }),
              );
            }
            return const Center(child: Text('No data available'));
          })
    ]);
  }
}