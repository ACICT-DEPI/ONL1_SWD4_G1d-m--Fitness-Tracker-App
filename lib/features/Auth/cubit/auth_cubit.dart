import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
 
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);


  String? name;
  String? email;
  bool userFound = true;

  Future<void> getUserData()async{
    User? user = _auth.currentUser;
      print('User signed in: ${user?.email}, Display Name: ${user?.displayName}');
      // set user name value
      name = user?.displayName??"";
      email = user?.email??"";
      if(user!=null) userFound = true;
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoading());
    try {
      // Create user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Update the user's display name
      await userCredential.user!.updateDisplayName(name);
      await userCredential.user!.reload();
      // Print user details
      User? user = _auth.currentUser;
      print('User signed up: ${user?.email}, Display Name: ${user?.displayName}');
      // set user name value
      name = user?.displayName??"";
      email = user?.email??"";
      userFound = true;
      print(name);
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
      // Login with email and password
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Print user details
      User? user = _auth.currentUser;
      print('User signed in: ${user?.email}, Display Name: ${user?.displayName}');
      // set user name value
      name = user?.displayName??"";
      email = user?.email??"";
      userFound = true;
      print(name);
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
      userFound = false;
      emit(AuthSignedOut());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'An unknown error occurred'));
    }
  }

  Stream<User?> authStateChanges() {
    emit(AuthSuccess());
    return _auth.authStateChanges();
  }

  Future<User?> checkUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Optionally, you can check if the user is signed in with a valid token
      // String token = await user.getIdToken();
    }
    return user;
  }
}
