import 'package:app_devfest_batna/api/login%20api/login_json.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;
  final LoginJson user;

  LoginSuccess(this.message, this.user);
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}
