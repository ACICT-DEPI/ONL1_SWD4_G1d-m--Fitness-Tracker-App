import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/caching/caching_helper.dart';
import 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {

  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);


  late int steps;
  late int water;
  late int sleepHours;
  late int sleepQuality;
  late double stepsCalories;
  late double workoutCalories;

  void initProfile() {
    steps = CachingHelper.instance?.readInteger("savedTodaySteps") ?? 0;
    water = CachingHelper.instance?.readInteger('savedDrunkWater') ?? 0;
    sleepHours = CachingHelper.instance?.readInteger('savedSleepHours') ?? 0;
    sleepQuality = CachingHelper.instance?.readInteger('savedSleepQuality') ?? 0;
    stepsCalories = CachingHelper.instance?.readDouble('stepsCalories') ?? 0;
    workoutCalories = CachingHelper.instance?.readDouble('workoutCalories') ?? 0;
    emit(ProfileLoading());
  }
}
