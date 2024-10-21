import 'package:cloud_firestore/cloud_firestore.dart';
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
      print('User signed in: ${user?.email}, Display Name: ${user?.displayName} kkkk ${user?.uid}');
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
  // Future<void> addData({
  //   required String image,
  //   required String eq,
  //   required String exname,
  // }) async {
  //   var db = FirebaseFirestore.instance;
  //   User? user = _auth.currentUser;
  //   final exercise = <String, String>{
  //     "image": image,
  //     "equip": eq,
  //     "exName": exname
  //   };

  //   db.collection("uuser").doc(user?.uid).collection("fav").add(exercise);
  // }
 

Future<void> addData({
  required String image,
  required String eq,
  required String exname,
  required String indexx,
}) async {
  var db = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  // Check if the user is authenticated
  if (user == null) {
    print("User is not logged in");
    return;
  }

  // Reference to the user's fav collection
  CollectionReference favCollection = db.collection("uuser").doc(user.uid).collection("fav");

  // Query Firestore to check if the item already exists
  QuerySnapshot querySnapshot = await favCollection
      .where("image", isEqualTo: image)
      .where("equip", isEqualTo: eq)
      .where("exName", isEqualTo: exname)
      .where("index", isEqualTo: indexx)
      .get();

  // If no matching document is found, add the new exercise
  if (querySnapshot.docs.isEmpty) {
    final exercise = <String, String>{
      "image": image,
      "equip": eq,
      "exName": exname,
      "index": indexx,
    };

    // Add the new exercise to Firestore
    await favCollection.add(exercise);
    print("Exercise added to favorites.");
  } else {
    print("Exercise already exists in favorites.");
  }
}


Future<void> removeData({
  required String image,
  required String eq,
  required String exname,
  required String indexx,
}) async {
  var db = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  // Check if the user is authenticated
  if (user == null) {
    print("User is not logged in");
    return;
  }

  // Reference to the user's fav collection
  CollectionReference favCollection = db.collection("uuser").doc(user.uid).collection("fav");

  // Query Firestore to find the document with matching fields
  QuerySnapshot querySnapshot = await favCollection
      .where("image", isEqualTo: image)
      .where("equip", isEqualTo: eq)
      .where("exName", isEqualTo: exname)
      .where("index", isEqualTo: indexx)
      .get();

  // If a matching document is found, delete it
  if (querySnapshot.docs.isNotEmpty) {
    for (var doc in querySnapshot.docs) {
      await doc.reference.delete();
      print("Exercise removed from favorites.");
    }
  } else {
    print("No matching exercise found in favorites.");
  }
}

Future<QuerySnapshot> checkIfExists({
  required String image,
  required String eq,
  required String exname,
  required String indexx,
}) async {
  var db = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    print("User is not logged in");
    throw Exception("User is not authenticated");
  }

  CollectionReference favCollection = db.collection("uuser").doc(user.uid).collection("fav");

  return await favCollection
      .where("image", isEqualTo: image)
      .where("equip", isEqualTo: eq)
      .where("exName", isEqualTo: exname)
      .where("index", isEqualTo: indexx)
      .get();
     
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
