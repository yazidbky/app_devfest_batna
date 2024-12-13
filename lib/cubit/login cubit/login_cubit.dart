import 'package:app_devfest_batna/api/login%20api/login_api_service.dart';
import 'package:app_devfest_batna/cubit/login%20cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// In your LoginCubit
class LoginCubit extends Cubit<LoginState> {
  final LoginApiService loginApiService;

  LoginCubit(this.loginApiService) : super(LoginInitial());

  Future<void> loginUser(String email, String password) async {
    emit(LoginLoading());
    try {
      final result =
          await loginApiService.loginUser(email: email, password: password);

      if (result['success']) {
        emit(LoginSuccess(result['message'], result['user']));
      } else {
        emit(LoginFailure(result['error']));
      }
    } catch (e) {
      emit(LoginFailure("Failed to connect to the server: $e"));
    }
  }
}
