import 'package:final_project/features/Workout/cubit/firestore_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirestoreCubit extends Cubit<FirestoreState> {
    FirestoreCubit() : super(FirestoreInitState());
  static FirestoreCubit get(context) => BlocProvider.of(context);
}