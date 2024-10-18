abstract class FirestoreState {}

class FirestoreInitState extends FirestoreState {}

class FirestoreSuccessful extends FirestoreState {
// final List<FirestoreModel> Firestores;
//   FirestoreSuccessful({required this.Firestores});
}

class FirestoreError extends FirestoreState {
  // String? errorMessage;
  // FirestoreError({this.errorMessage});
}

class FirestoreLoading extends FirestoreState {}