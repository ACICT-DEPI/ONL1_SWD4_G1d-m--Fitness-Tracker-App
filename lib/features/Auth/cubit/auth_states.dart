abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;

   AuthError(this.message);

  @override
  List<Object> get props => [message];
}

class AuthSignedOut extends AuthState {}