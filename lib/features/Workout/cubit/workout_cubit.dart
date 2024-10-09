import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/api_endpoint.dart';
import '../model/workout_model.dart';
import 'workout_states.dart';

class WorkoutCubit extends Cubit<WorkoutState> {

  WorkoutCubit() : super(WorkoutInitState());
  static WorkoutCubit get(context) => BlocProvider.of(context);


  WorkoutModel? wk;
  String sss = '';
  bodyPartBack(String exName) async {
    try {
      String api = Endpoint.baseUrl;
      final option = Options(headers: {
        "x-rapidapi-host": "exercisedb.p.rapidapi.com",
        "x-rapidapi-key": "554a02e03dmshd886ff48681c04dp19af10jsna2f57238ab4d",
      });
      emit(WorkoutLoading());
      final response =
          await Dio().get("$api/name/$exName?offset=0&limit=10", options: option);
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

}
