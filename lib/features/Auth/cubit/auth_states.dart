import 'package:final_project/features/Auth/model/workout_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  List<Object> get props => [message];
}

class AuthSignedOut extends AuthState {}

class WorkoutInitstate extends AuthState {}

class WorkoutSuccessful extends AuthState {
final List<WorkoutModel> workouts;
  WorkoutSuccessful({required this.workouts});
}

class WorkoutError extends AuthState {
  String? errorMessage;
  WorkoutError({this.errorMessage});
}

class WorkoutLoading extends AuthState {}
