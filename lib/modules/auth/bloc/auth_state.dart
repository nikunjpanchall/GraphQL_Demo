part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class SignUpState extends AuthState {
  final bool isLoading;
  final bool isLoaded;
  final bool hasError;

  SignUpState({this.isLoading = false, this.isLoaded = false, this.hasError = false});
}

class LoginState extends AuthState {
  final bool isLoading;
  final bool isLoaded;
  final bool hasError;

  LoginState({this.isLoading = false, this.isLoaded = false, this.hasError = false});
}
