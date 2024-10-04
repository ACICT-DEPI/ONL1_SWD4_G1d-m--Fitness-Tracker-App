import 'package:dio/dio.dart';
import 'package:final_project/features/Auth/model/api_endpoint.dart';
import 'package:final_project/features/Auth/model/workout_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
 
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  WorkoutModel? wk;
  String sss = '';
  bodyPartBack(String exname) async {
    try {
      String api = Endpoint.baseUrl;
      final option = Options(headers: {
        "x-rapidapi-host": "exercisedb.p.rapidapi.com",
        "x-rapidapi-key": "554a02e03dmshd886ff48681c04dp19af10jsna2f57238ab4d",
      });
      emit(WorkoutLoading());
      final response =
          await Dio().get("$api/name/$exname?offset=0&limit=10", options: option);
       List<dynamic> responseData = response.data;
      List<WorkoutModel> workouts = responseData.map((item) => WorkoutModel.fromJson(item)).toList();
      emit(WorkoutSuccessful(workouts: workouts));
      print(response.data);

      return workouts;
    } on Exception catch (e) {
      emit(WorkoutError(errorMessage: e.toString()));
      print(e.toString());
    }
  }








  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'An unknown error occurred'));
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      print(e);
      emit(AuthError(e.message ?? 'An unknown error occurred'));
    }
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    try {
      await _auth.signOut();
      emit(AuthSignedOut());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'An unknown error occurred'));
    }
  }

  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }
}
