import 'package:app_devfest_batna/api/registre%20api/registre_api_service.dart';
import 'package:app_devfest_batna/cubit/registre%20cubit/registre_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final AuthService authService;

  RegistrationCubit(this.authService) : super(RegistrationInitial());

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(RegistrationLoading());
    try {
      final result = await authService.registerUser(
        name: name,
        email: email,
        password: password,
      );

      if (result['success']) {
        emit(RegistrationSuccess(result['message']));
      } else {
        emit(RegistrationFailure(result['error']));
      }
    } catch (e) {
      emit(RegistrationFailure("Failed to connect to the server: $e"));
    }
  }
}
