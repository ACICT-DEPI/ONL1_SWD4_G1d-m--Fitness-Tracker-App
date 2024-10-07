import 'package:final_project/features/lose_weight/cubit/lose_weight_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utls/colors.dart';
import 'features/Auth/cubit/auth_cubit.dart';
import 'features/Auth/view/first_screen.dart';
import 'features/Auth/view/home_check.dart';
import 'firebase_options.dart';
// test
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit(),),
          BlocProvider(create: (context) => LoseWeightCubit(),)
        ],
        child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colorsapp.darkOrange),
          useMaterial3: true,
        ),
        home: HomeCheck(),
      ));
  }
}
